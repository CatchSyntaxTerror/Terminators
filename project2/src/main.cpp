#include "parser.hpp"
#include "dot_emitter.hpp"
#include "symtab.hpp"
#include "pseudo_rvgen.hpp"
#include "labeler.hpp"
#include "pretty_print.hpp"
#include "cfg.hpp"
#include "cfg_dot.hpp"
#include <filesystem>
#include <fstream>
#include <iostream>
#include <sstream>

using namespace whilec;
namespace fs = std::filesystem;

int main(int argc, char **argv)
{
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);

    // Read input file or stdin
    std::string code;
    if (argc >= 2)
    {
        std::ifstream in(argv[1]);
        if (!in)
        {
            std::cerr << "Failed to open file: " << argv[1] << "\n";
            return 1;
        }
        std::stringstream buffer;
        buffer << in.rdbuf();
        code = buffer.str();
    }
    else
    {
        std::stringstream buffer;
        buffer << std::cin.rdbuf();
        code = buffer.str();
    }

    if (code.empty())
    {
        std::cerr << "ERROR (input file has no contents)\n";
        return 1;
    }

    try
    {
        Lexer lx(std::move(code));
        Parser ps(lx);
        auto prog = ps.parseProgram();
        std::cout << "OK: parse succeeded.\n";

        // === NEW: label the AST ===
        Labeler lab;
        lab.run(prog.get());
        std::cout << "AST labeled with unique program-point labels.\n";

        // === NEW: output labeled WHILE source ===
        std::ofstream labeledOut("labeled_program.while");
        prettyPrintLabeled(prog.get(), labeledOut);
        labeledOut.close();
        std::cout << "Labeled program written to labeled_program.while\n";

        // Ensure output directories exist
        fs::create_directories("dotfiles");
        fs::create_directories("assemblycode");

        // DOT output (AST)
        DotEmitter de;
        de.emit(prog.get(), "dotfiles/ast.dot");
        std::cout << "AST DOT written to dotfiles/ast.dot\n";

        // CFG output
        CFG cfg = buildCFG(prog.get());
        emitCFGDot(cfg, "dotfiles/cfg.dot");
        std::cout << "CFG DOT written to dotfiles/cfg.dot\n";

        // Assembly output
        auto sym = buildSymbolTable(*prog);
        std::ofstream asmOut("assemblycode/out_program.s");
        generate_pseudo_rv(cfg, sym, asmOut);
        std::cout << "Assembly written to assemblycode/out_program.s\n";

        return 0;
    }
    catch (const std::exception &e)
    {
        std::cerr << e.what() << "\n";
        std::cerr << "Parse failed.\n";
        return 2;
    }
}
