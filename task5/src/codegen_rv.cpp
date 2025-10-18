#include "codegen_rv.hpp"
#include <stdexcept>
#include <string>

namespace whilec
{

    namespace
    {
        // labels
        static int g_lbl = 0;
        static std::string fresh(const char *base)
        {
            return std::string(base) + std::to_string(g_lbl++);
        }

        // address of var -> t2 
        static void emitAddrOf(const std::string &name, const SymbolTable &sym, std::ostream &out)
        {
            int idx = sym.indexOf(name);
            out << "  li   t2, " << idx << "\n";
            out << "  slli t2, t2, 3\n";
            out << "  add  t2, a0, t2\n";
        }

        static void evalAExp(const Node *e, const SymbolTable &sym, std::ostream &out);
        static void evalBExp(const Node *e, const SymbolTable &sym, std::ostream &out);

        // normalize t0 to {0,1}
        static void normalize01(std::ostream &out)
        {
            out << "  snez t0, t0\n";
        }

        // expressions -> t0
        static void evalAExp(const Node *e, const SymbolTable &sym, std::ostream &out)
        {
            // Int
            if (auto k = dynamic_cast<const Int *>(e))
            {
                out << "  li   t0, " << k->val << "\n";
                return;
            }
            // Var
            if (auto v = dynamic_cast<const Var *>(e))
            {
                emitAddrOf(v->name, sym, out);
                out << "  ld   t0, 0(t2)\n";
                return;
            }
            // a1 (+|-|*) a2
            if (auto ab = dynamic_cast<const ABin *>(e))
            {
                evalAExp(ab->left.get(), sym, out);
                out << "  mv   t1, t0\n";
                evalAExp(ab->right.get(), sym, out); 

                if (ab->op == "+")      { out << "  add  t0, t1, t0\n"; return; }
                else if (ab->op == "-") { out << "  sub  t0, t1, t0\n"; return; }
                else if (ab->op == "*") { out << "  mul  t0, t1, t0\n"; return; }
                throw std::runtime_error("ABin: unsupported op: " + ab->op);
            }
            // Bool literal
            if (auto b = dynamic_cast<const Bool *>(e))
            {
                out << "  li   t0, " << (b->val ? 1 : 0) << "\n";
                return;
            }
            // not
            if (auto u = dynamic_cast<const Not *>(e))
            {
                evalAExp(u->bexp.get(), sym, out);
                normalize01(out);
                out << "  xori t0, t0, 1\n";
                return;
            }
            // b1 and|or b2
            if (auto bb = dynamic_cast<const BBin *>(e))
            {
                evalAExp(bb->left.get(), sym, out);
                out << "  mv   t1, t0\n";
                evalAExp(bb->right.get(), sym, out);
                out << "  snez t1, t1\n";
                out << "  snez t0, t0\n";
                if (bb->op == "and") { out << "  and  t0, t1, t0\n"; return; }
                if (bb->op == "or")  { out << "  or   t0, t1, t0\n";  return; }
                throw std::runtime_error("BBin: unsupported op: " + bb->op);
            }
            // relations: =, <, <=, >, >=
            if (auto r = dynamic_cast<const Rel *>(e))
            {
                evalAExp(r->left.get(), sym, out);
                out << "  mv   t1, t0\n";
                evalAExp(r->right.get(), sym, out);

                if      (r->op == "=")  { out << "  sub  t0, t1, t0\n"; out << "  seqz t0, t0\n"; return; }
                else if (r->op == "<")  { out << "  slt  t0, t1, t0\n"; return; }
                else if (r->op == "<=") { out << "  slt  t0, t0, t1\n"; out << "  xori t0, t0, 1\n"; return; }
                else if (r->op == ">")  { out << "  slt  t0, t0, t1\n"; return; }
                else if (r->op == ">=") { out << "  slt  t0, t1, t0\n"; out << "  xori t0, t0, 1\n"; return; }
                throw std::runtime_error("Rel: unsupported op: " + r->op);
            }

            throw std::runtime_error("NYI: expression kind");
        }

        static void evalBExp(const Node *e, const SymbolTable &sym, std::ostream &out)
        {
            evalAExp(e, sym, out);
            normalize01(out);
        }

        // assignment
        static void emitAssign(const Assign *a, const SymbolTable &sym, std::ostream &out)
        {
            evalAExp(a->expr.get(), sym, out); 
            emitAddrOf(a->name, sym, out);     
            out << "  sd   t0, 0(t2)\n";
        }

        //commands
        static void genCmd(const Node *n, const SymbolTable &sym, std::ostream &out)
        {
            if (!n) return;

            if (auto s = dynamic_cast<const Seq *>(n))
            {
                genCmd(s->left.get(),  sym, out);
                genCmd(s->right.get(), sym, out);
                return;
            }
            if (auto a = dynamic_cast<const Assign *>(n))
            {
                emitAssign(a, sym, out);
                return;
            }
            if (dynamic_cast<const Skip *>(n))
            {
                return;
            }
            if (auto i = dynamic_cast<const If *>(n))
            {
                std::string L_else = fresh("L_else_");
                std::string L_end  = fresh("L_end_");

                evalBExp(i->cond.get(), sym, out);
                out << "  beqz t0, " << L_else << "\n";
                genCmd(i->then_cmd.get(), sym, out);
                out << "  j    " << L_end << "\n";
                out << L_else << ":\n";
                genCmd(i->else_cmd.get(), sym, out);
                out << L_end  << ":\n";
                return;
            }
            if (auto w = dynamic_cast<const While *>(n))
            {
                std::string L_test = fresh("L_test_");
                std::string L_end  = fresh("L_end_");

                out << L_test << ":\n";
                evalBExp(w->cond.get(), sym, out);
                out << "  beqz t0, " << L_end << "\n";
                genCmd(w->body.get(), sym, out);
                out << "  j    " << L_test << "\n";
                out << L_end  << ":\n";
                return;
            }

            throw std::runtime_error("Unexpected node in command position");
        }

    } // anon

    void generate_riscv(const Program &prog, const SymbolTable &sym, std::ostream &out)
    {
        out << "  .text\n";
        // use this for darkos collatz
        // out << "  .globl example6\n";  
        // out << "example6:\n";
        //use this for all other test harnesses
        out << "  .globl program\n";  
        out << "program:\n";
        genCmd(prog.cmd.get(), sym, out);
        out << "  ret\n";
    }

} 
