#pragma once

#include "cfg.hpp"
#include "symtab.hpp"
#include "dead_code_elimination.hpp"

#include <vector>

namespace whilec {

    // regAlloc[i] = k → variable i uses s{k}
    // regAlloc[i] = -1 → spilled to memory
    using RegAllocMap = std::vector<int>;

    // Build interference graph from liveness and assign registers (1..numRegisters)
    // Unassigned variables become spills (-1).
    RegAllocMap allocateRegisters(const CFG& cfg,
                                  const SymbolTable& sym,
                                  const LivenessInfo& liv,
                                  int numRegisters = 11);

}
