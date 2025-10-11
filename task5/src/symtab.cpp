#include "symtab.hpp"
#include <algorithm>
#include <stdexcept>
#include <unordered_set>

namespace whilec
{

    namespace
    {
        void collectNames(const Node *n, std::unordered_set<std::string> &s)
        {
            if (!n)
                return;
            if (auto p = dynamic_cast<const Program *>(n))
            {
                collectNames(p->cmd.get(), s);
            }
            else if (auto q = dynamic_cast<const Seq *>(n))
            {
                collectNames(q->left.get(), s);
                collectNames(q->right.get(), s);
            }
            else if (auto a = dynamic_cast<const Assign *>(n))
            {
                s.insert(a->name);
                collectNames(a->expr.get(), s);
            }
            else if (dynamic_cast<const Skip *>(n))
            {
                // nothing
            }
            else if (auto i = dynamic_cast<const If *>(n))
            {
                collectNames(i->cond.get(), s);
                collectNames(i->then_cmd.get(), s);
                collectNames(i->else_cmd.get(), s);
            }
            else if (auto w = dynamic_cast<const While *>(n))
            {
                collectNames(w->cond.get(), s);
                collectNames(w->body.get(), s);
            }
            else if (auto v = dynamic_cast<const Var *>(n))
            {
                s.insert(v->name);
            }
            else if (auto ab = dynamic_cast<const ABin *>(n))
            {
                collectNames(ab->left.get(), s);
                collectNames(ab->right.get(), s);
            }
            else if (auto nb = dynamic_cast<const Not *>(n))
            {
                collectNames(nb->bexp.get(), s);
            }
            else if (auto bb = dynamic_cast<const BBin *>(n))
            {
                collectNames(bb->left.get(), s);
                collectNames(bb->right.get(), s);
            }
            else if (auto r = dynamic_cast<const Rel *>(n))
            {
                collectNames(r->left.get(), s);
                collectNames(r->right.get(), s);
            }
            else
            {
                // Int/Bool or unknown: nothing
            }
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
        std::unordered_set<std::string> set;
        collectNames(&root, set);

        SymbolTable sym;
        sym.names_.assign(set.begin(), set.end());
        std::sort(sym.names_.begin(), sym.names_.end());
        sym.names_.erase(std::unique(sym.names_.begin(), sym.names_.end()), sym.names_.end());

        for (int i = 0; i < (int)sym.names_.size(); ++i)
        {
            sym.toIndex_[sym.names_[i]] = i;
        }
        return sym;
    }

}
