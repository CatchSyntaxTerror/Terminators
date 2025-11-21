#pragma once
#include "ast.hpp"
#include "cfg.hpp"
#include "symtab.hpp"
#include <ostream>

namespace whilec
{

    // Generate pseudo RISC-V code from the CFG
    void generate_pseudo_rv(const CFG &cfg, const SymbolTable &sym, std::ostream &out);

}
