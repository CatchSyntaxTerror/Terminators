#include "parser.hpp"
#include "dot_emitter.hpp"
#include "symtab.hpp"
#include "codegen_rv.hpp"
#include <fstream>
#include <iostream>
#include <sstream>

using namespace whilec;

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
        DotEmitter de;
        de.emit(prog.get(), "ast.dot");
        std::cout << "DOT written to ast.dot\n";

        // output asm code
        auto sym = buildSymbolTable(*prog);
        std::ofstream asmOut("asm_program.s");
        generate_riscv(*prog, sym, asmOut);
        std::cout << "ASM written to out_program.s\n";
        return 0;
    }
    catch (const std::exception &e)
    {
        std::cerr << e.what() << "\n";
        std::cerr << "Parse failed.\n";
        return 2;
    }
}
