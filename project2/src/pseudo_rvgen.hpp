#pragma once
#include "ast.hpp"
#include "cfg.hpp"
#include "symtab.hpp"
#include "register_allocation.hpp"
#include <ostream>
#include <unordered_set>

namespace whilec
{
    // Generate pseudo RISC-V code from the CFG using
    // dead-code information and register allocation.
    void generate_pseudo_rv(const CFG &cfg,
                            const SymbolTable &sym,
                            const std::unordered_set<int> &deadLabels,
                            const RegAllocMap &regAlloc,
                            std::ostream &out);
}
