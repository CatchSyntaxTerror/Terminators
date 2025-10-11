#pragma once
#include <memory>
#include <string>

namespace whilec
{

    struct Node
    {
        virtual ~Node() = default;
    };

    struct Program : Node
    {
        std::unique_ptr<Node> cmd;
        explicit Program(std::unique_ptr<Node> c);
    };

    struct Seq : Node
    {
        std::unique_ptr<Node> left, right;
        Seq(std::unique_ptr<Node> l, std::unique_ptr<Node> r);
    };

    struct Assign : Node
    {
        std::string name;
        std::unique_ptr<Node> expr;
        Assign(std::string n, std::unique_ptr<Node> e);
    };

    struct Skip : Node
    {
    };

    struct If : Node
    {
        std::unique_ptr<Node> cond, then_cmd, else_cmd;
        If(std::unique_ptr<Node> c, std::unique_ptr<Node> t, std::unique_ptr<Node> e);
    };

    struct While : Node
    {
        std::unique_ptr<Node> cond, body;
        While(std::unique_ptr<Node> c, std::unique_ptr<Node> b);
    };

    // Arithmetic
    struct Int : Node
    {
        long long val;
        explicit Int(long long v);
    };

    struct Var : Node
    {
        std::string name;
        explicit Var(std::string n);
    };

    struct ABin : Node
    {
        std::string op; // "+", "-", "*"
        std::unique_ptr<Node> left, right;
        ABin(std::string o, std::unique_ptr<Node> l, std::unique_ptr<Node> r);
    };

    // Boolean
    struct Bool : Node
    {
        bool val;
        explicit Bool(bool v);
    };

    struct Not : Node
    {
        std::unique_ptr<Node> bexp;
        explicit Not(std::unique_ptr<Node> e);
    };

    struct BBin : Node
    {
        std::string op; // "and" / "or"
        std::unique_ptr<Node> left, right;
        BBin(std::string o, std::unique_ptr<Node> l, std::unique_ptr<Node> r);
    };

    struct Rel : Node
    {
        std::string op; // "=", "<", "<=", ">", ">="
        std::unique_ptr<Node> left, right;
        Rel(std::string o, std::unique_ptr<Node> l, std::unique_ptr<Node> r);
    };

}
