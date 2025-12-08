#include "dead_code_elimination.hpp"
#include "ast.hpp"
#include <unordered_set>
#include <unordered_map>

namespace whilec
{

    namespace
    {

        // Collect all variables used inside an expression or condition
        void collectVars(const Node *n, std::unordered_set<std::string> &vars)
        {
            if (!n)
                return;

            if (auto v = dynamic_cast<const Var *>(n))
            {
                vars.insert(v->name);
            }
            else if (auto ab = dynamic_cast<const ABin *>(n))
            {
                collectVars(ab->left.get(), vars);
                collectVars(ab->right.get(), vars);
            }
            else if (auto nb = dynamic_cast<const Not *>(n))
            {
                collectVars(nb->bexp.get(), vars);
            }
            else if (auto bb = dynamic_cast<const BBin *>(n))
            {
                collectVars(bb->left.get(), vars);
                collectVars(bb->right.get(), vars);
            }
            else if (auto r = dynamic_cast<const Rel *>(n))
            {
                collectVars(r->left.get(), vars);
                collectVars(r->right.get(), vars);
            }
            // Int, Bool → no vars to collect
        }

        // Compute gen and kill sets for a single CFG node
        void computeGenKillForNode(const CFGNode *node,
                                   std::unordered_set<std::string> &gen,
                                   std::unordered_set<std::string> &kill)
        {
            gen.clear();
            kill.clear();
            const Node *ast = node->ast;
            if (!ast)
                return;

            // Assignment x := a
            if (auto a = dynamic_cast<const Assign *>(ast))
            {
                kill.insert(a->name);
                collectVars(a->expr.get(), gen);
                return;
            }

            // Skip: nothing
            if (dynamic_cast<const Skip *>(ast))
            {
                return;
            }

            // If [b]_ℓ then ...
            if (auto i = dynamic_cast<const If *>(ast))
            {
                collectVars(i->cond.get(), gen);
                return;
            }

            // While [b]_ℓ do ...
            if (auto w = dynamic_cast<const While *>(ast))
            {
                collectVars(w->cond.get(), gen);
                return;
            }
        }

    }

    // liveness analysis
    LivenessInfo computeLiveness(const CFG &cfg,
                                 const std::unordered_set<std::string> &exitLive)
    {
        LivenessInfo liv;

        // Initialize in/out sets
        for (const auto &kv : cfg.nodes)
        {
            int label = kv.first;
            liv.in[label] = {};
            liv.out[label] = {};
        }

        // Precompute gen/kill for each label
        std::unordered_map<int, std::unordered_set<std::string>> gen, kill;
        for (const auto &kv : cfg.nodes)
        {
            int label = kv.first;
            const CFGNode *node = kv.second.get();
            std::unordered_set<std::string> g, k;
            computeGenKillForNode(node, g, k);
            gen[label] = std::move(g);
            kill[label] = std::move(k);
        }

        // Initialize exit liveness:
        // nodes with no successors inherit exitLive
        for (const auto &kv : cfg.nodes)
        {
            int label = kv.first;
            const CFGNode *node = kv.second.get();
            if (node->succ.empty())
            {
                liv.out[label] = exitLive;
            }
        }

        // Fixpoint iteration
        bool changed = true;
        while (changed)
        {
            changed = false;

            for (const auto &kv : cfg.nodes)
            {
                int label = kv.first;
                const CFGNode *node = kv.second.get();

                auto &inSet = liv.in[label];
                auto &outSet = liv.out[label];

                // OUT[n] = ⋃ IN[s] for all successors s
                std::unordered_set<std::string> newOut;
                for (const CFGNode *succ : node->succ)
                {
                    int sLabel = succ->label;
                    for (const auto &v : liv.in[sLabel])
                    {
                        newOut.insert(v);
                    }
                }

                // IN[n] = gen[n] ∪ (OUT[n] \ kill[n])
                std::unordered_set<std::string> newIn = gen[label];
                for (const auto &v : newOut)
                {
                    if (!kill[label].count(v))
                    {
                        newIn.insert(v);
                    }
                }

                // Detect changes
                if (newOut != outSet || newIn != inSet)
                {
                    outSet = std::move(newOut);
                    inSet = std::move(newIn);
                    changed = true;
                }
            }
        }

        return liv;
    }

    // dead code detection
    std::unordered_set<int>
    findDeadAssignments(const CFG &cfg, const LivenessInfo &liv)
    {
        std::unordered_set<int> deadLabels;

        for (const auto &kv : cfg.nodes)
        {
            int label = kv.first;
            const CFGNode *node = kv.second.get();
            const Node *ast = node->ast;
            if (!ast)
                continue;

            if (auto a = dynamic_cast<const Assign *>(ast))
            {
                const auto &outSet = liv.out.at(label);
                
                // output := make must never be removed
                if (a->name == "output") {
                    continue;
                }
                // Dead assignment rule:
                // If x ∉ OUT[label], then x := a is dead
                if (!outSet.count(a->name))
                {
                    deadLabels.insert(label);
                }
            }
        }

        return deadLabels;
    }

}