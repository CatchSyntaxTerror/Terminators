#include "ast.hpp"

namespace whilec
{

    Program::Program(std::unique_ptr<Node> c) : cmd(std::move(c)) {}
    Seq::Seq(std::unique_ptr<Node> l, std::unique_ptr<Node> r) : left(std::move(l)), right(std::move(r)) {}
    Assign::Assign(std::string n, std::unique_ptr<Node> e) : name(std::move(n)), expr(std::move(e)) {}
    If::If(std::unique_ptr<Node> c, std::unique_ptr<Node> t, std::unique_ptr<Node> e) : cond(std::move(c)), then_cmd(std::move(t)), else_cmd(std::move(e)) {}
    While::While(std::unique_ptr<Node> c, std::unique_ptr<Node> b) : cond(std::move(c)), body(std::move(b)) {}
    Int::Int(long long v) : val(v) {}
    Var::Var(std::string n) : name(std::move(n)) {}
    ABin::ABin(std::string o, std::unique_ptr<Node> l, std::unique_ptr<Node> r) : op(std::move(o)), left(std::move(l)), right(std::move(r)) {}
    Bool::Bool(bool v) : val(v) {}
    Not::Not(std::unique_ptr<Node> e) : bexp(std::move(e)) {}
    BBin::BBin(std::string o, std::unique_ptr<Node> l, std::unique_ptr<Node> r) : op(std::move(o)), left(std::move(l)), right(std::move(r)) {}
    Rel::Rel(std::string o, std::unique_ptr<Node> l, std::unique_ptr<Node> r) : op(std::move(o)), left(std::move(l)), right(std::move(r)) {}

}
