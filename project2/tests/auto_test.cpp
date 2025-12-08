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

static const std::string WHILEC_BIN = "../src/whilec";
static const std::string OUT_ASM = "assemblycode/out_program.s";
static const std::string CSV_SUMMARY = "build/memops_summary.csv";

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
    // prologue: mv t2,a0
    std::vector<std::regex> prologue_patterns = {
        std::regex(R"(\bmv\s+t2\s*,\s*a0\b)")};
    for (size_t i = 0; i < prologue_patterns.size(); ++i)
    {
        ASSERT_TRUE(std::regex_search(asm_text, prologue_patterns[i]))
            << "Missing expected prologue pattern[" << i << "]";
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

static int detect_max_sreg(const std::string &asm_text)
{
    std::regex sreg(R"(\bs([0-9]+)\b)");
    std::smatch m;
    int max_s = -1;
    int min_s = 1000000;

    auto begin = asm_text.begin();
    auto end = asm_text.end();

    while (std::regex_search(begin, end, m, sreg))
    {
        int id = std::stoi(m[1]);
        if (id > max_s) max_s = id;
        if (id < min_s) min_s = id;
        begin = m.suffix().first;
    }

    if (max_s < 0) {
        return 1;
    }

    return max_s - min_s + 1;
}

// Harness 
static void write_harness_c(
        const std::vector<std::string> &var_names,
        const std::vector<std::string> &livein_names,
        const std::string &symbol_name,
        const fs::path &out)
{
    int vars_size = var_names.size();
    int live_count = livein_names.size();
    std::unordered_set<std::string> livein_set(livein_names.begin(),
                                               livein_names.end());

    std::ofstream f(out);
    f << "#include <stdlib.h>\n#include <stdio.h>\n\n";
    f << "extern void " << symbol_name << "(long int *vars);\n";
    f << "long int vars[" << vars_size << "];\n";

    f << "int main(int argc, char **argv) {\n";
    f << "  if (argc != " << (1 + live_count) << ") {\n";
    f << "    fprintf(stderr, \"Usage: %s";
    for (auto &v : livein_names)
        f << " <" << v << ">";
    f << "\\n\", argv[0]);\n";
    f << "    return 2;\n  }\n\n";

    f << "  for (int i=0;i<" << vars_size << ";i++) vars[i]=0;\n";
    f << "  int ai = 1;\n";

    for (int i = 0; i < vars_size; i++)
    {
        if (livein_set.count(var_names[i]))
            f << "  vars[" << i << "] = atol(argv[ai++]); // "<<var_names[i]<<"\n";
    }
    f << "\n";

    f << "  printf(\"Initial state:\\n\");\n";
    for (int i = 0; i < vars_size; i++)
        f << "  printf(\"" << var_names[i]
           << "=%ld\\n\", vars[" << i << "]);\n";

    f << "  " << symbol_name << "(vars);\n";

    f << "  printf(\"Final state:\\n\");\n";
    for (int i = 0; i < vars_size; i++)
        f << "  printf(\"" << var_names[i]
           << "=%ld\\n\", vars[" << i << "]);\n";

    f << "  return 0;\n}\n";
}

static std::vector<std::string> read_var_order_from_labeled(const fs::path &lb)
{
    std::ifstream f(lb);
    std::string text((std::istreambuf_iterator<char>(f)),
                     std::istreambuf_iterator<char>());

    std::regex id(R"([A-Za-z_][A-Za-z0-9_]*)");
    std::unordered_set<std::string> keywords =
        {"if","then","else","while","do","od","skip",
         "and","or","not","true","false","fi"};

    std::set<std::string> vars;

    auto it = std::sregex_iterator(text.begin(), text.end(), id);
    auto end = std::sregex_iterator();
    for (; it != end; ++it)
    {
        std::string v = it->str();
        if (!keywords.count(v))
            vars.insert(v);
    }
    return std::vector<std::string>(vars.begin(), vars.end());
}

static std::vector<std::string> read_livein()
{
    std::ifstream in("liveness_entry.txt");
    std::vector<std::string> xs;
    std::string v;
    while (in >> v) xs.push_back(v);
    return xs;
}

static int count_pseudo_rv_memops(const std::string &asm_text) {
    std::regex ld_pattern(R"(\bld\s+s[0-9]+)");
    std::regex sd_pattern(R"(\bsd\s+s[0-9]+)");

    int count = 0;

    auto begin = asm_text.begin();
    auto end = asm_text.end();
    std::smatch m;

    while (std::regex_search(begin, end, m, ld_pattern)) {
        count++;
        begin = m.suffix().first;
    }

    begin = asm_text.begin();
    while (std::regex_search(begin, end, m, sd_pattern)) {
        count++;
        begin = m.suffix().first;
    }

    return count;
}

// collect tests
static std::vector<fs::path> collect_all_while_files()
{
    std::vector<fs::path> out;
    
    for (fs::path root : {fs::path("../WhileFiles")})
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
protected:
    static bool csv_initialized;

    static void initializeCSV() {
        if (!csv_initialized) {
            fs::create_directories("../tests/build");
            std::ofstream csv(CSV_SUMMARY, std::ios::trunc);
            csv << "file,memops\n";
            csv.close();
            csv_initialized = true;
        }
    }

    static void appendCSV(const std::string &file_stem, int memops) {
        std::ofstream csv(CSV_SUMMARY, std::ios::app);
        csv << file_stem << "," << memops << "\n";
    }
};

bool WhileFileTest::csv_initialized = false;

TEST_P(WhileFileTest, GenerateAsmAndSanityCheck)
{
    std::string file = GetParam();
    SCOPED_TRACE(file);

    WhileFileTest::initializeCSV();

    if (fs::exists(OUT_ASM))
        fs::remove(OUT_ASM);
    if (fs::exists("dotfiles"))
        fs::remove_all("dotfiles");
    if (fs::exists("assemblycode"))
        fs::remove_all("assemblycode");
    if (fs::exists("labeled_program.while"))
        fs::remove("labeled_program.while");

    // compile while file -> out_program.s
    std::ostringstream cmd;
    cmd << WHILEC_BIN << " < " << file;
    auto [rc, out] = run_command_capture(cmd.str());
    ASSERT_EQ(rc, 0) << "whilec failed: " << out;

    ASSERT_TRUE(fs::exists("labeled_program.while"))
        << "Expected labeled_program.while to be generated.";
    ASSERT_TRUE(fs::exists("dotfiles/ast.dot"))
        << "Expected dotfiles/ast.dot to be generated.";
    ASSERT_TRUE(fs::exists("dotfiles/cfg.dot"))
        << "Expected dotfiles/cfg.dot to be generated.";
    ASSERT_TRUE(fs::exists(OUT_ASM))
        << "Expected pseudo RISC-V asm at " << OUT_ASM;

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
    int memops = count_pseudo_rv_memops(asm_text);
    int vars_size = detect_max_sreg(asm_text);

    std::cout << "\n\n[==========] memops=" << memops
              << ", vars_size=" << vars_size << "\n\n";    
    fs::path p(file);
    std::string stem = p.stem().string();

    WhileFileTest::appendCSV(stem, memops);

    int tests_to_run = ::testing::UnitTest::GetInstance()->test_to_run_count();
    bool single_test_run = (tests_to_run == 1);

    if (single_test_run)
    {
        fs::path keep_dir = "build";
        fs::create_directories(keep_dir);
        
        auto var_order = read_var_order_from_labeled("labeled_program.while");
        auto livein_vars = read_livein();

        if (var_order.empty())
        {
            // fallback
            for (int i=0; i<vars_size; ++i)
                var_order.push_back("v"+std::to_string(i));
        }

        fs::path harness_path = keep_dir / (fs::path(file).stem().string() + ".c");
        write_harness_c(var_order, livein_vars, "program", harness_path);

        fs::path asm_copy = keep_dir / (fs::path(file).stem().string() + ".s");
        fs::copy_file(OUT_ASM, asm_copy,
                      fs::copy_options::overwrite_existing);
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
