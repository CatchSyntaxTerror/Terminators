#include "register_allocation.hpp"

#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <algorithm>
#include <numeric>

namespace whilec {

using InterfGraph = std::vector<std::unordered_set<int>>;

// Build simple interference graph: vars live together in OUT sets interfere.
static InterfGraph buildInterferenceGraph(const CFG& cfg,
                                          const SymbolTable& sym,
                                          const LivenessInfo& liv)
{
    const auto& names = sym.names();
    int nvars = names.size();

    InterfGraph graph(nvars);
    std::unordered_map<std::string,int> varIndex;

    // Name → index
    for (int i = 0; i < nvars; ++i)
        varIndex[names[i]] = i;

    // Create edges from OUT sets
    for (const auto& kv : cfg.nodes) {
        int label = kv.first;
        auto it = liv.out.find(label);
        if (it == liv.out.end()) continue;

        // Convert OUT names → indices
        std::vector<int> live;
        for (const auto& name : it->second)
            if (varIndex.count(name)) live.push_back(varIndex[name]);

        std::sort(live.begin(), live.end());
        live.erase(std::unique(live.begin(), live.end()), live.end());

        // Add undirected edges among all live vars
        for (int i = 0; i < (int)live.size(); ++i)
            for (int j = i + 1; j < (int)live.size(); ++j) {
                graph[live[i]].insert(live[j]);
                graph[live[j]].insert(live[i]);
            }
    }

    return graph;
}

// Greedy coloring: assign up to numRegisters registers; others spill (-1).
RegAllocMap allocateRegisters(const CFG& cfg,
                              const SymbolTable& sym,
                              const LivenessInfo& liv,
                              int numRegisters)
{
    const auto& names = sym.names();
    int nvars = names.size();

    InterfGraph graph = buildInterferenceGraph(cfg, sym, liv);
    RegAllocMap color(nvars, -1);

    // Order vars by descending degree
    std::vector<int> vars(nvars);
    std::iota(vars.begin(), vars.end(), 0);

    std::sort(vars.begin(), vars.end(),
              [&](int a, int b) {
                  return graph[a].size() > graph[b].size();
              });

    // Greedy assignment
    for (int v : vars) {
        std::vector<bool> used(numRegisters + 1, false);

        // Mark neighbor colors
        for (int nb : graph[v]) {
            int c = color[nb];
            if (c > 0 && c <= numRegisters)
                used[c] = true;
        }

        // Pick first free register
        int chosen = -1;
        for (int c = 1; c <= numRegisters; ++c)
            if (!used[c]) { chosen = c; break; }

        color[v] = chosen;   // -1 means spilled
    }

    return color;
}

}
