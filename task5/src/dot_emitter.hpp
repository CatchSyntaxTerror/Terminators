#pragma once
#include "ast.hpp"
#include <string>
#include <vector>

namespace whilec
{

    class DotEmitter
    {
    public:
        void emit(const Node *root, const std::string &filename = "ast.dot");

    private:
        std::vector<std::string> out_;
        int counter_ = 0;

        std::string nid();
        static std::string esc(const std::string &s);
        std::string walk(const Node *node);
    };

}
