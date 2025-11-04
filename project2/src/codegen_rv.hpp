#pragma once
#include "ast.hpp"
#include "symtab.hpp"
#include <ostream>

namespace whilec
{

    // Generate minimal RISC-V for Task 5:
    // Currently handles Assign(name, Int(k)) and Assign(name, Var(x)), as well as sequencing (Seq) and skip.
    void generate_riscv(const Program &prog, const SymbolTable &sym, std::ostream &out);
}
