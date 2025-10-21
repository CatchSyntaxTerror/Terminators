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

namespace fs = std::filesystem;

static const std::string WHILEC_BIN = "./bin/whilec";
static const std::string OUT_ASM = "out_program.s";
static const std::string HARNESS_C = "harness_auto.c";
static const std::string RUN_EXE = "program_rv";

// run shell capture helper
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

// extract LHS var names
static std::vector<std::string> extract_vars_from_while(const fs::path &p)
{
    std::ifstream in(p);
    std::string line;
    std::regex assign_re(R"(^\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*:=)");
    std::vector<std::string> vars;
    std::unordered_set<std::string> seen;
    while (std::getline(in, line))
    {
        std::smatch m;
        if (std::regex_search(line, m, assign_re))
        {
            std::string name = m[1].str();
            if (seen.insert(name).second)
                vars.push_back(name);
        }
    }
    return vars;
}

// generate harness
static void write_harness_c(const std::vector<std::string> &vars, const std::string &symbol_name, const fs::path &out)
{
    std::ofstream f(out);
    f << "#include <stdlib.h>\n#include <stdio.h>\n\n";
    f << "extern void " << symbol_name << "(long int *vars);\n";
    f << "long int vars[" << (vars.size()) << "];\n";
    f << "int main(int argc, char **argv) {\n";
    f << "  if (argc != " << (vars.size() + 1) << ") { fprintf(stderr, \"Usage\\n\"); return 2; }\n";
    for (size_t i = 0; i < vars.size(); ++i)
        f << "  vars[" << i << "] = atol(argv[" << (i + 1) << "]);\n";
    f << "  printf(\"Initial state:\\n\");\n";
    for (size_t i = 0; i < vars.size(); ++i)
        f << "  printf(\"" << vars[i] << "=%ld\\n\", vars[" << i << "]);\n";
    f << "  " << symbol_name << "(vars);\n";
    f << "  printf(\"Final state:\\n\");\n";
    for (size_t i = 0; i < vars.size(); ++i)
        f << "  printf(\"" << vars[i] << "=%ld\\n\", vars[" << i << "]);\n";
    f << "  return 0; }\n";
    f.close();
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

// collect tests
static std::vector<fs::path> collect_all_while_files()
{
    std::vector<fs::path> out;
    // task5
    fs::path p1 = "tests";
    if (fs::exists(p1))
    {
        for (auto &e : fs::directory_iterator(p1))
            if (e.is_regular_file() && e.path().extension() == ".while")
                out.push_back(e.path());
    }
    // task3
    fs::path p2 = "../task3";
    if (fs::exists(p2))
    {
        for (auto &e : fs::recursive_directory_iterator(p2))
            if (e.is_regular_file() && e.path().extension() == ".while")
                out.push_back(e.path());
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

    // cleanup
    if (fs::exists(OUT_ASM))
        fs::remove(OUT_ASM);
}

// instantiate with collected files
INSTANTIATE_TEST_SUITE_P(AllWhileFiles, WhileFileTest,
                         ::testing::ValuesIn([]()
                                             {
        std::vector<std::string> paths;
        for (auto &p : collect_all_while_files()) paths.push_back(p.string());
        return paths; }()));

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
