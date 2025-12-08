#include "symtab.hpp"
#include <algorithm>
#include <stdexcept>
#include <unordered_set>

namespace whilec
{

    namespace
    {
        void collectNamesOrdered(const Node *n,
                                 std::vector<std::string> &names,
                                 std::unordered_set<std::string> &seen)
        {
            if (!n)
                return;

            if (auto p = dynamic_cast<const Program *>(n))
            {
                collectNamesOrdered(p->cmd.get(), names, seen);
            }
            else if (auto q = dynamic_cast<const Seq *>(n))
            {
                collectNamesOrdered(q->left.get(), names, seen);
                collectNamesOrdered(q->right.get(), names, seen);
            }
            else if (auto a = dynamic_cast<const Assign *>(n))
            {
                if (!seen.count(a->name))
                {
                    names.push_back(a->name);
                    seen.insert(a->name);
                }
                collectNamesOrdered(a->expr.get(), names, seen);
            }
            else if (dynamic_cast<const Skip *>(n))
            {
                // nothing
            }
            else if (auto i = dynamic_cast<const If *>(n))
            {
                collectNamesOrdered(i->cond.get(), names, seen);
                collectNamesOrdered(i->then_cmd.get(), names, seen);
                collectNamesOrdered(i->else_cmd.get(), names, seen);
            }
            else if (auto w = dynamic_cast<const While *>(n))
            {
                collectNamesOrdered(w->cond.get(), names, seen);
                collectNamesOrdered(w->body.get(), names, seen);
            }
            else if (auto v = dynamic_cast<const Var *>(n))
            {
                if (!seen.count(v->name))
                {
                    names.push_back(v->name);
                    seen.insert(v->name);
                }
            }
            else if (auto ab = dynamic_cast<const ABin *>(n))
            {
                collectNamesOrdered(ab->left.get(), names, seen);
                collectNamesOrdered(ab->right.get(), names, seen);
            }
            else if (auto nb = dynamic_cast<const Not *>(n))
            {
                collectNamesOrdered(nb->bexp.get(), names, seen);
            }
            else if (auto bb = dynamic_cast<const BBin *>(n))
            {
                collectNamesOrdered(bb->left.get(), names, seen);
                collectNamesOrdered(bb->right.get(), names, seen);
            }
            else if (auto r = dynamic_cast<const Rel *>(n))
            {
                collectNamesOrdered(r->left.get(), names, seen);
                collectNamesOrdered(r->right.get(), names, seen);
            }
            // Int, Bool, etc. — nothing to collect
        }
    }

    int SymbolTable::indexOf(const std::string &name) const
    {
        auto it = toIndex_.find(name);
        if (it == toIndex_.end())
            throw std::runtime_error("Unknown variable: " + name);
        return it->second;
    }

    SymbolTable buildSymbolTable(const Node &root)
    {
        std::vector<std::string> ordered;
        std::unordered_set<std::string> seen;
        collectNamesOrdered(&root, ordered, seen);

        SymbolTable sym;
        sym.names_ = std::move(ordered);
        std::sort(sym.names_.begin(), sym.names_.end());
        for (int i = 0; i < (int)sym.names_.size(); ++i)
        {
            sym.toIndex_[sym.names_[i]] = i;
        }

        return sym;
    }

}
