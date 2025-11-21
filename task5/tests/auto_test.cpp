#include <gtest/gtest.h>
#include <filesystem>
#include <unordered_set>
#include <map>
#include <algorithm>
#include <fstream>
#include <sstream>
#include <iostream>
#include <regex>
#include <vector>
#include <set>

namespace fs = std::filesystem;

static const std::string WHILEC_BIN = "./bin/whilec";
static const std::string OUT_ASM = "out_program.s";

static std::pair<int, std::string> run_command_capture(const std::string &cmd)
{
    std::string out;
    FILE *pipe = popen((cmd + " 2>&1").c_str(), "r");
    if (!pipe)
        return {-1, "open failed"};
    char buffer[4096];
    while (fgets(buffer, sizeof(buffer), pipe) != nullptr)
        out += buffer;
    int rc = pclose(pipe);
    int exitcode = WEXITSTATUS(rc);
    return {exitcode, out};
}

// asm assertions (use src_text to decide control flow checks)
static void assert_asm_contains_key_patterns(const std::string &asm_text, const std::string &src_text)
{
    std::vector<std::regex> addr_patterns = {
        std::regex(R"(\bli\s+t2,\s*\d+\b)"),
        std::regex(R"(\bslli\s+t2,\s*t2,\s*3\b)"),
        std::regex(R"(\badd\s+t2,\s*(?:a0,\s*t2|t2,\s*a0)\b)")};
    for (size_t i = 0; i < addr_patterns.size(); ++i)
    {
        ASSERT_TRUE(std::regex_search(asm_text, addr_patterns[i])) << "Missing address calc pattern[" << i << "]";
    }
    std::regex store_or_load(R"((\b(sd|sw|ld|lw)\b)[^\n]*\([^\)\s]+\))");
    ASSERT_TRUE(std::regex_search(asm_text, store_or_load)) << "Missing store/load using base register";

    bool src_has_ctrl = std::regex_search(src_text, std::regex(R"(\b(if|while)\b)"));
    if (src_has_ctrl)
    {
        std::regex ctrl(R"(\bbeqz\b|\bj\b|\bbne\b|\bbge\b|\bblt\b)");
        ASSERT_TRUE(std::regex_search(asm_text, ctrl)) << "Missing control-flow branches in asm (source has if/while)";
    }
}

struct AsmInputs
{
    std::vector<int> all_indices;   // first-seen order of li t2,idx
    std::vector<int> input_indices; // subset whose first access is ld
    int vars_size = 0;              // max(idx)+1
};


static AsmInputs analyze_inputs_from_asm(const std::string &asm_text)
{
    std::istringstream in(asm_text);
    std::string line;

    std::regex li_t2(R"(^\s*li\s+t2\s*,\s*(\d+)\b)");
    std::regex ld_0t2(R"(^\s*ld\s+t0\s*,\s*0\s*\(\s*t2\s*\))");
    std::regex sd_0t2(R"(^\s*sd\s+t0\s*,\s*0\s*\(\s*t2\s*\))");

    int cur_idx = -1;
    std::unordered_set<int> seen_idx;
    std::vector<int> order;
    std::unordered_map<int, char> first_op;
    int max_idx = -1;

    while (std::getline(in, line))
    {
        for (char &c : line)
            if (c == '\t')
                c = ' ';
        while (!line.empty() && (line.back() == ' ' || line.back() == '\r'))
            line.pop_back();

        std::smatch m;
        if (std::regex_search(line, m, li_t2))
        {
            cur_idx = std::stoi(m[1].str());
            if (!seen_idx.count(cur_idx))
            {
                seen_idx.insert(cur_idx);
                order.push_back(cur_idx);
            }
            if (cur_idx > max_idx)
                max_idx = cur_idx;
            continue;
        }
        if (cur_idx != -1)
        {
            if (std::regex_search(line, ld_0t2))
            {
                if (!first_op.count(cur_idx))
                    first_op[cur_idx] = 'l';
            }
            else if (std::regex_search(line, sd_0t2))
            {
                if (!first_op.count(cur_idx))
                    first_op[cur_idx] = 's';
            }
        }
    }

    std::vector<int> inputs;
    for (int idx : order)
    {
        auto it = first_op.find(idx);
        if (it != first_op.end() && it->second == 'l')
            inputs.push_back(idx);
    }

    AsmInputs ai;
    ai.all_indices = std::move(order);
    ai.input_indices = std::move(inputs);
    ai.vars_size = (max_idx >= 0 ? max_idx + 1 : 0);
    return ai;
}

// Harness 
static void write_harness_c_from_asm(int vars_size,
                                     const std::vector<int> &input_indices,
                                     const std::string &symbol_name,
                                     const fs::path &out){
    std::ofstream f(out);
    f << "#include <stdlib.h>\n#include <stdio.h>\n\n";
    f << "extern void " << symbol_name << "(long int *vars);\n";
    if (vars_size <= 0)
        vars_size = 1;
    f << "long int vars[" << vars_size << "];\n";
    f << "int main(int argc, char **argv) {\n";
    f << "  if (argc != " << (1 + input_indices.size()) << ") {\n";
    f << "    fprintf(stderr, \"Usage: %s";
    for (size_t i = 0; i < input_indices.size(); ++i)
        f << " <v" << input_indices[i] << ">";
    f << "\\n\", argv[0]);\n";
    f << "    return 2;\n";
    f << "  }\n\n";
    f << "  for (int i = 0; i < " << vars_size << "; ++i) vars[i] = 0;\n";
    for (size_t j = 0; j < input_indices.size(); ++j)
    {
        f << "  vars[" << input_indices[j] << "] = atol(argv[" << (1 + j) << "]);\n";
    }
    f << "  printf(\"Initial state:\\n\");\n";
    f << "  for (int i = 0; i < " << vars_size << "; ++i) printf(\"v%d=%ld\\n\", i, vars[i]);\n";
    f << "  " << symbol_name << "(vars);\n";
    f << "  printf(\"Final state:\\n\");\n";
    f << "  for (int i = 0; i < " << vars_size << "; ++i) printf(\"v%d=%ld\\n\", i, vars[i]);\n";
    f << "  return 0;\n}\n";
    f.close();
}

// collect tests
static std::vector<fs::path> collect_all_while_files()
{
    std::vector<fs::path> out;
    // task5 & taks3
    for (fs::path root : {fs::path("tests"), fs::path("../task3")})
    {
        if (!fs::exists(root))
            continue;
        for (auto &e : fs::recursive_directory_iterator(root))
        {
            if (e.is_regular_file() && e.path().extension() == ".while")
            {
                out.push_back(e.path());
            }
        }
    }
    std::sort(out.begin(), out.end());
    return out;
}

// Parameterized test fixture
class WhileFileTest : public ::testing::TestWithParam<std::string>
{
};

TEST_P(WhileFileTest, GenerateAsmAndSanityCheck)
{
    std::string file = GetParam();
    SCOPED_TRACE(file);

    // compile while file -> out_program.s
    std::ostringstream cmd;
    cmd << WHILEC_BIN << " < " << file;
    auto [rc, out] = run_command_capture(cmd.str());
    ASSERT_EQ(rc, 0) << "whilec failed: " << out;

    ASSERT_TRUE(fs::exists(OUT_ASM)) << "Expected out_program.s after running whilec.";

    // read asm
    std::ifstream asm_in(OUT_ASM);
    ASSERT_TRUE(asm_in.good());
    std::stringstream ss;
    ss << asm_in.rdbuf();
    std::string asm_text = ss.str();

    // read source
    std::ifstream src_in(file);
    ASSERT_TRUE(src_in.good());
    std::stringstream ssrc;
    ssrc << src_in.rdbuf();
    std::string src_text = ssrc.str();

    // asm checks
    assert_asm_contains_key_patterns(asm_text, src_text);

    int tests_to_run = ::testing::UnitTest::GetInstance()->test_to_run_count();
    bool single_test_run = (tests_to_run == 1);

    if (single_test_run)
    {
        fs::path keep_dir = "build/tests";
        fs::create_directories(keep_dir);

        fs::path p(file);
        std::string stem = p.stem().string();

        // analyze inputs directly from assembly
        AsmInputs ai = analyze_inputs_from_asm(asm_text);
        const std::string sym = "program"; 

        fs::path harness_path = keep_dir / (stem + ".c");
        write_harness_c_from_asm(ai.vars_size, ai.input_indices, sym, harness_path);

        fs::path asm_copy = keep_dir / (stem + ".s");
        fs::copy_file(OUT_ASM, asm_copy, fs::copy_options::overwrite_existing);
    }
    else
    {
        if (fs::exists(OUT_ASM))
            fs::remove(OUT_ASM);
    }
}

// instantiate with collected files
INSTANTIATE_TEST_SUITE_P(
    AllWhileFiles,
    WhileFileTest,
    ::testing::ValuesIn([]()
                        {
        std::vector<std::string> paths;
        for (auto &p : collect_all_while_files()) 
            paths.push_back(p.string());
        return paths; }()),
    [](const testing::TestParamInfo<std::string> &info)
    {
        fs::path p(info.param);
        std::string name = p.stem().string();
        for (char &c : name)
            if (!std::isalnum(static_cast<unsigned char>(c)))
                c = '_';
        return name;
    });

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
