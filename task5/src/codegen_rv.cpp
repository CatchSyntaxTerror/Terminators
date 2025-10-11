#include "codegen_rv.hpp"
#include <stdexcept>
#include <string>

namespace whilec
{

    namespace
    {

        // computes adress of variable and stores value in t1
        static void emitAddrOf(const std::string &name, const SymbolTable &sym, std::ostream &out)
        {
            int idx = sym.indexOf(name);
            out << "  li   t1, " << idx << "\n";
            out << "  slli t1, t1, 3\n";
            out << "  add  t1, a0, t1\n";
        }

        // Evaluate arithmetic expr into t0
        static void evalAExp(const Node *e, const SymbolTable &sym, std::ostream &out)
        {
            // assign variable to int "x := 2"
            if (auto k = dynamic_cast<const Int *>(e))
            {
                out << "  li   t0, " << k->val << "\n";
                return;
            }
            // assign variable to variable "x := y"
            if (auto v = dynamic_cast<const Var *>(e))
            {
                emitAddrOf(v->name, sym, out);
                out << "  ld   t0, 0(t1)\n";
                return;
            }
            throw std::runtime_error("NYI: expressions other than Int or Var");
        }

        // Assign(name, expr): eval expr -> t0; store into name
        static void emitAssign(const Assign *a, const SymbolTable &sym, std::ostream &out)
        {
            // t0 := value(expr)
            evalAExp(a->expr.get(), sym, out);
            // t1 := &vars[index(name)]
            emitAddrOf(a->name, sym, out);
            // *t1 := t0
            out << "  sd   t0, 0(t1)\n";
        }

        static void genCmd(const Node *n, const SymbolTable &sym, std::ostream &out)
        {
            if (!n)
                return;
            if (auto s = dynamic_cast<const Seq *>(n))
            {
                genCmd(s->left.get(), sym, out);
                genCmd(s->right.get(), sym, out);
            }
            else if (auto a = dynamic_cast<const Assign *>(n))
            {
                emitAssign(a, sym, out);
            }
            else if (dynamic_cast<const Skip *>(n))
            {
                // no-op
            }
            else if (dynamic_cast<const If *>(n) || dynamic_cast<const While *>(n))
            {
                throw std::runtime_error("(Error) control flow not supported yet");
            }
            else
            {
                throw std::runtime_error("Unexpected node in command position");
            }
        }

    }

    void generate_riscv(const Program &prog, const SymbolTable &sym, std::ostream &out)
    {
        out << "  .text\n";
        out << "  .globl program\n";
        out << "program:\n";
        genCmd(prog.cmd.get(), sym, out);
        out << "  ret\n";
    }

}
