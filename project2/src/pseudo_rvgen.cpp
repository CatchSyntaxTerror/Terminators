#include "pseudo_rvgen.hpp"
#include <algorithm>
#include <stdexcept>
#include <unordered_set>

namespace whilec
{
    namespace
    {
        // Forward decls
        static void evalAExp(const Node *e,
                             const SymbolTable &sym,
                             const RegAllocMap &alloc,
                             std::ostream &out);
        static void evalBExp(const Node *e,
                             const SymbolTable &sym,
                             const RegAllocMap &alloc,
                             std::ostream &out);

        // Load variable into t0, respecting spills.
        static void loadVar(const std::string &name,
                            const SymbolTable &sym,
                            const RegAllocMap &alloc,
                            std::ostream &out)
        {
            int idx = sym.indexOf(name);
            int r = alloc[idx];

            if (r > 0)
            {
                out << "  mv   t0, s" << r << "\n";
            }
            else
            {
                out << "  li   t2, " << idx << "\n";
                out << "  slli t2, t2, 3\n";
                out << "  add  t2, a0, t2\n";
                out << "  ld   t0, 0(t2)\n";
            }
        }

        // Store t0 into variable, respecting spills.
        static void storeVar(const std::string &name,
                             const SymbolTable &sym,
                             const RegAllocMap &alloc,
                             std::ostream &out)
        {
            int idx = sym.indexOf(name);
            int r = alloc[idx];

            if (r > 0)
            {
                out << "  mv   s" << r << ", t0\n";
            }
            else
            {
                out << "  li   t2, " << idx << "\n";
                out << "  slli t2, t2, 3\n";
                out << "  add  t2, a0, t2\n";
                out << "  sd   t0, 0(t2)\n";
            }
        }

        // ===== arithmetic expressions =====
        static void evalAExp(const Node *e,
                             const SymbolTable &sym,
                             const RegAllocMap &alloc,
                             std::ostream &out)
        {
            if (auto k = dynamic_cast<const Int *>(e))
            {
                out << "  li   t0, " << k->val << "\n";
                return;
            }

            if (auto v = dynamic_cast<const Var *>(e))
            {
                loadVar(v->name, sym, alloc, out);
                return;
            }

            if (auto b = dynamic_cast<const ABin *>(e))
            {
                evalAExp(b->left.get(), sym, alloc, out);
                out << "  mv   t1, t0\n";
                evalAExp(b->right.get(), sym, alloc, out);

                if (b->op == "+")
                {
                    out << "  add  t0, t1, t0\n";
                    return;
                }
                if (b->op == "-")
                {
                    out << "  sub  t0, t1, t0\n";
                    return;
                }
                if (b->op == "*")
                {
                    out << "  mul  t0, t1, t0\n";
                    return;
                }

                throw std::runtime_error("Unsupported arithmetic op: " + b->op);
            }

            throw std::runtime_error("Unsupported arithmetic expression node");
        }

        static void evalBExp(const Node *e,
                             const SymbolTable &sym,
                             const RegAllocMap &alloc,
                             std::ostream &out)
        {
            // ===== Boolean literal =====
            if (auto b = dynamic_cast<const Bool *>(e))
            {
                out << "  li   t0, " << (b->val ? 1 : 0) << "\n";
                return;
            }

            // ===== NOT =====
            if (auto u = dynamic_cast<const Not *>(e))
            {
                evalBExp(u->bexp.get(), sym, alloc, out);
                out << "  snez t0, t0\n";    // normalize to 0/1
                out << "  xori t0, t0, 1\n"; // flip
                return;
            }

            // ===== Binary boolean operators (AND / OR) =====
            if (auto bb = dynamic_cast<const BBin *>(e))
            {
                // ---- evaluate left into t0 ----
                evalBExp(bb->left.get(), sym, alloc, out);
                out << "  snez t0, t0\n";   // normalize left bool

                // push left_bool on stack
                out << "  addi sp, sp, -8\n";
                out << "  sd   t0, 0(sp)\n";

                // ---- evaluate right into t0 ----
                evalBExp(bb->right.get(), sym, alloc, out);
                out << "  snez t0, t0\n";   // normalize right bool

                // pop left_bool into t1
                out << "  ld   t1, 0(sp)\n";
                out << "  addi sp, sp, 8\n";

                if (bb->op == "and")
                {
                    out << "  and  t0, t1, t0\n"; // t0 = left & right
                    return;
                }

                if (bb->op == "or")
                {
                    out << "  or   t0, t1, t0\n"; // t0 = left | right
                    return;
                }

                throw std::runtime_error("Unsupported boolean op: " + bb->op);
            }

            // ===== Relational operators (=,<,<=,>,>=) =====
            if (auto r = dynamic_cast<const Rel *>(e))
            {
                evalAExp(r->left.get(), sym, alloc, out);  // t0 = left
                out << "  mv   t1, t0\n";                  // t1 = left
                evalAExp(r->right.get(), sym, alloc, out); // t0 = right

                if (r->op == "=")
                {
                    out << "  sub  t0, t1, t0\n";
                    out << "  seqz t0, t0\n";
                    return;
                }
                if (r->op == "<")
                {
                    out << "  slt  t0, t1, t0\n"; // left < right
                    return;
                }
                if (r->op == "<=")
                {
                    out << "  slt  t0, t0, t1\n"; // right < left
                    out << "  xori t0, t0, 1\n";  // not(right<left)
                    return;
                }
                if (r->op == ">")
                {
                    out << "  slt  t0, t0, t1\n"; // right < left
                    return;
                }
                if (r->op == ">=")
                {
                    out << "  slt  t0, t1, t0\n"; // left < right
                    out << "  xori t0, t0, 1\n";  // not(left<right)
                    return;
                }

                throw std::runtime_error("Unsupported relation op: " + r->op);
            }

            // ===== fallback: treat arithmetic as boolean =====
            evalAExp(e, sym, alloc, out);
            out << "  snez t0, t0\n";
        }

        static std::string nodeKind(const Node *n)
        {
            if (dynamic_cast<const Assign *>(n))
                return "assign";
            if (dynamic_cast<const If *>(n))
                return "if";
            if (dynamic_cast<const While *>(n))
                return "while";
            if (dynamic_cast<const Skip *>(n))
                return "skip";
            return "cmd";
        }

    } // namespace

    void generate_pseudo_rv(const CFG &cfg,
                            const SymbolTable &sym,
                            const std::unordered_set<int> &deadLabels,
                            const RegAllocMap &alloc,
                            const LivenessInfo &liv,
                            std::ostream &out)
    {
        const auto &names = sym.names();
        const int nvars = static_cast<int>(names.size());
        const std::string END_LABEL = "L_end";

        // Which s-registers are actually used?
        std::vector<bool> usedS(12, false); // indexes 1..11
        for (int i = 0; i < nvars; ++i)
        {
            int r = alloc[i];
            if (r > 0 && r <= 11)
                usedS[r] = true;
        }

        std::vector<int> usedRegs;
        for (int r = 1; r <= 11; ++r)
            if (usedS[r])
                usedRegs.push_back(r);

        int numUsed = static_cast<int>(usedRegs.size());

        // Prologue
        out << "  .text\n";
        out << "  .globl program\n";
        out << "program:\n";

        if (numUsed > 0)
        {
            out << "  # save used s-registers\n";
            out << "  addi sp, sp, -" << (numUsed * 8) << "\n";
            for (int i = 0; i < numUsed; ++i)
            {
                int r = usedRegs[i];
                out << "  sd   s" << r << ", " << (i * 8) << "(sp)\n";
            }
        }

        // Load initial values for variables that are live at entry and have a register.
        out << "  mv   t2, a0\n";
        if (!cfg.entry)
            throw std::runtime_error("generate_pseudo_rv: CFG has no entry");
        int entryLabel = cfg.entry->label;
        const auto &liveInEntry = liv.in.at(entryLabel);
        for (int i = 0; i < nvars; ++i)
        {
            int r = alloc[i];
            const std::string &name = names[i];

            if (r > 0 && liveInEntry.count(name))
            {
                out << "  # s" << r << " <- input (" << names[i] << ")\n";
                out << "  ld   s" << r << ", 0(t2)\n";
            }

            // increment t2
            out << "  addi t2, t2, 8\n";
        }

        out << "  j    L" << cfg.entry->label << "\n\n";

        // Sorted block traversal
        std::vector<const CFGNode *> nodes;
        nodes.reserve(cfg.nodes.size());
        for (const auto &kv : cfg.nodes)
            nodes.push_back(kv.second.get());

        std::sort(nodes.begin(), nodes.end(),
                  [](const CFGNode *a, const CFGNode *b)
                  { return a->label < b->label; });

        // Emit each block
        for (size_t i = 0; i < nodes.size(); ++i)
        {
            const CFGNode *node = nodes[i];
            const CFGNode *fallthrough = (i + 1 < nodes.size() ? nodes[i + 1] : nullptr);

            const Node *ast = node->ast;
            if (!ast)
                continue;

            out << "L" << node->label << ":\n";
            const std::string kind = nodeKind(ast);
            (void)kind; // currently unused, but kept for clarity

            // Assign
            if (auto a = dynamic_cast<const Assign *>(ast))
            {
                // Skip the actual assignment if this label is dead
                if (!deadLabels.count(node->label))
                {
                    evalAExp(a->expr.get(), sym, alloc, out);
                    storeVar(a->name, sym, alloc, out);
                }
            }
            // Skip
            else if (dynamic_cast<const Skip *>(ast))
            {
                // no-op
            }
            // If
            else if (auto i = dynamic_cast<const If *>(ast))
            {
                if (node->succ.size() != 2)
                    throw std::runtime_error("If requires exactly two successors");

                const CFGNode *thenNode = node->succ[0];
                const CFGNode *elseNode = node->succ[1];

                evalBExp(i->cond.get(), sym, alloc, out);
                out << "  beqz t0, L" << elseNode->label << "   # false -> else\n";
                out << "  j    L" << thenNode->label << "       # true -> then\n";
            }
            // While
            else if (auto w = dynamic_cast<const While *>(ast))
            {
                if (node->succ.empty())
                    throw std::runtime_error("While header missing successors");

                const CFGNode *body = node->succ[0];
                const CFGNode *after = (node->succ.size() >= 2 ? node->succ[1] : nullptr);

                evalBExp(w->cond.get(), sym, alloc, out);

                if (after)
                    out << "  beqz t0, L" << after->label << "   # exit\n";
                else
                    out << "  beqz t0, " << END_LABEL << "       # exit\n";

                out << "  j    L" << body->label << "           # true -> body\n";
            }

            // Control-flow after simple commands (assign/skip)
            if (dynamic_cast<const Assign *>(ast) || dynamic_cast<const Skip *>(ast))
            {
                if (node->succ.empty())
                {
                    out << "  j    " << END_LABEL << "\n";
                }
                else if (node->succ.size() == 1)
                {
                    const CFGNode *succ = node->succ[0];

                    if (succ == fallthrough)
                    {
                        // do nothing, let it fall through to next block
                    }
                    else
                        out << "  j    L" << node->succ[0]->label << "\n";
                }
                else
                {
                    throw std::runtime_error("Assign/Skip should have <=1 successor");
                }
            }

            out << "\n";
        }

        // ===== Epilogue at END_LABEL: only write back exit-live vars =====
        out << END_LABEL << ":\n";
        out << "  mv   t2, a0\n";

        std::unordered_set<std::string> liveAtExit;
        for (const auto &kv : cfg.nodes)
        {
            const CFGNode *node = kv.second.get();
            if (node->succ.empty())
            {
                int lbl = kv.first;
                auto it = liv.out.find(lbl);
                if (it != liv.out.end())
                {
                    for (const auto &v : it->second)
                        liveAtExit.insert(v);
                }
            }
        }

        if (liveAtExit.empty())
        {
            for (const auto &nm : names)
            {
                if (nm == "output")
                {
                    liveAtExit.insert(nm);
                    break;
                }
            }
        }

        for (int i = 0; i < nvars; ++i)
        {
            const std::string &var = names[i];
            int r = alloc[i];

            if (!liveAtExit.empty() && !liveAtExit.count(var))
            {
                out << "  # skip dead-at-exit: " << var << "\n";
                out << "  addi t2, t2, 8\n";
                continue;
            }

            if (r > 0)
            {
                out << "  # exit-live (" << var << ") <- s" << r << "\n";
                out << "  sd   s" << r << ", 0(t2)\n";
            }

            out << "  addi t2, t2, 8\n";
        }

        if (numUsed > 0)
        {
            out << "  # restore used s-registers\n";
            for (int i = 0; i < numUsed; ++i)
            {
                int r = usedRegs[i];
                out << "  ld   s" << r << ", " << (i * 8) << "(sp)\n";
            }
            out << "  addi sp, sp, " << (numUsed * 8) << "\n";
        }

        out << "  ret\n";
    }

}