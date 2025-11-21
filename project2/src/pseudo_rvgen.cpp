#include "pseudo_rvgen.hpp"
#include <algorithm>
#include <stdexcept>

namespace whilec
{

    namespace
    {

        // Maps variables to s registers
        static std::string regForVar(const std::string &name, const SymbolTable &sym)
        {
            int idx = sym.indexOf(name);
            return "s" + std::to_string(idx + 1);
        }

        static void evalAExp(const Node *e, const SymbolTable &sym, std::ostream &out);
        static void evalBExp(const Node *e, const SymbolTable &sym, std::ostream &out);

        // normalizes t0
        static void normalize01(std::ostream &out)
        {
            out << "  snez t0, t0\n";
        }

        static void evalAExp(const Node *e, const SymbolTable &sym, std::ostream &out)
        {

            if (auto k = dynamic_cast<const Int *>(e))
            {
                out << "  li   t0, " << k->val << "\n";
                return;
            }

            if (auto v = dynamic_cast<const Var *>(e))
            {
                out << "  mv   t0, " << regForVar(v->name, sym) << "\n";
                return;
            }

            if (auto b = dynamic_cast<const ABin *>(e))
            {
                evalAExp(b->left.get(), sym, out);
                out << "  mv   t1, t0\n";
                evalAExp(b->right.get(), sym, out);

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

            throw std::runtime_error("Unknown arithmetic expression type");
        }

        static void evalBExp(const Node *e, const SymbolTable &sym, std::ostream &out)
        {

            if (auto b = dynamic_cast<const Bool *>(e))
            {
                out << "  li   t0, " << (b->val ? 1 : 0) << "\n";
                return;
            }

            if (auto u = dynamic_cast<const Not *>(e))
            {
                evalBExp(u->bexp.get(), sym, out);
                normalize01(out);
                out << "  xori t0, t0, 1\n";
                return;
            }

            if (auto bb = dynamic_cast<const BBin *>(e))
            {
                evalBExp(bb->left.get(), sym, out);
                out << "  mv   t1, t0\n";
                evalBExp(bb->right.get(), sym, out);
                out << "  snez t1, t1\n";
                out << "  snez t0, t0\n";

                if (bb->op == "and")
                {
                    out << "  and  t0, t1, t0\n";
                    return;
                }
                if (bb->op == "or")
                {
                    out << "  or   t0, t1, t0\n";
                    return;
                }

                throw std::runtime_error("Unsupported boolean op: " + bb->op);
            }

            if (auto r = dynamic_cast<const Rel *>(e))
            {
                evalAExp(r->left.get(), sym, out);
                out << "  mv   t1, t0\n";
                evalAExp(r->right.get(), sym, out);

                if (r->op == "=")
                {
                    out << "  sub  t0, t1, t0\n";
                    out << "  seqz t0, t0\n";
                    return;
                }
                if (r->op == "<")
                {
                    out << "  slt  t0, t1, t0\n";
                    return;
                }
                if (r->op == "<=")
                {
                    out << "  slt  t0, t0, t1\n";
                    out << "  xori t0, t0, 1\n";
                    return;
                }
                if (r->op == ">")
                {
                    out << "  slt  t0, t0, t1\n";
                    return;
                }
                if (r->op == ">=")
                {
                    out << "  slt  t0, t1, t0\n";
                    out << "  xori t0, t0, 1\n";
                    return;
                }

                throw std::runtime_error("Unsupported relation op: " + r->op);
            }

            evalAExp(e, sym, out);
            normalize01(out);
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

    }

    // Generates risc-v pseudo code
    void generate_pseudo_rv(const CFG &cfg, const SymbolTable &sym, std::ostream &out)
    {

        const auto &names = sym.names();
        const int nvars = names.size();
        const std::string END_LABEL = "L_end";

        // Prologue
        out << "  .text\n";
        out << "  .globl program\n";
        out << "program:\n";

        out << "  mv   t2, a0\n";
        for (int i = 0; i < nvars; ++i)
        {
            out << "  # s" << (i + 1) << " <- input (" << names[i] << ")\n";
            out << "  ld   s" << (i + 1) << ", 0(t2)\n";

            out << "  addi t2, t2, 8\n";
        }

        if (!cfg.entry)
            throw std::runtime_error("generate_pseudo_rv: CFG has no entry");

        out << "  j    L" << cfg.entry->label << "\n\n";

        // Sorted block traversal
        std::vector<const CFGNode *> nodes;
        for (const auto &kv : cfg.nodes)
            nodes.push_back(kv.second.get());

        std::sort(nodes.begin(), nodes.end(),
                  [](const CFGNode *a, const CFGNode *b)
                  { return a->label < b->label; });

        // Emit each block
        for (const CFGNode *node : nodes)
        {

            const Node *ast = node->ast;
            if (!ast)
                continue;

            out << "L" << node->label << ":\n";
            out << "  # ℓ=" << node->label << "  " << nodeKind(ast) << "\n";

            // Assign
            if (auto a = dynamic_cast<const Assign *>(ast))
            {
                evalAExp(a->expr.get(), sym, out);
                out << "  mv   " << regForVar(a->name, sym) << ", t0\n";
            }

            // Skip
            else if (dynamic_cast<const Skip *>(ast))
            {
                // nothing
            }

            // If
            else if (auto i = dynamic_cast<const If *>(ast))
            {
                if (node->succ.size() != 2)
                    throw std::runtime_error("If requires exactly two successors");

                const CFGNode *thenNode = node->succ[0];
                const CFGNode *elseNode = node->succ[1];

                evalBExp(i->cond.get(), sym, out);

                out << "  beqz t0, L" << elseNode->label << "   # false → else\n";
                out << "  j    L" << thenNode->label << "       # true → then\n";
            }

            // While
            else if (auto w = dynamic_cast<const While *>(ast))
            {

                if (node->succ.empty())
                    throw std::runtime_error("While header missing successors");

                const CFGNode *body = node->succ[0];
                const CFGNode *after = (node->succ.size() >= 2 ? node->succ[1] : nullptr);

                evalBExp(w->cond.get(), sym, out);

                if (after)
                    out << "  beqz t0, L" << after->label << "   # exit\n";
                else
                    out << "  beqz t0, " << END_LABEL << "       # exit\n";

                out << "  j    L" << body->label << "           # true → body\n";
            }

            // assign/skip
            if (dynamic_cast<const Assign *>(ast) || dynamic_cast<const Skip *>(ast))
            {

                if (node->succ.empty())
                {
                    out << "  j    " << END_LABEL << "\n";
                }
                else if (node->succ.size() == 1)
                {
                    out << "  j    L" << node->succ[0]->label << "\n";
                }
                else
                {
                    throw std::runtime_error("Assign/Skip should have ≤1 successor");
                }
            }

            out << "\n";
        }

        out << END_LABEL << ":\n";
        out << "  mv   t2, a0\n";

        for (int i = 0; i < nvars; ++i)
        {
            out << "  # output (" << names[i] << ") <- s" << (i + 1) << "\n";
            out << "  sd   s" << (i + 1) << ", 0(t2)\n";

            out << "  addi t2, t2, 8\n";
        }

        out << "  ret\n";
    }

}
