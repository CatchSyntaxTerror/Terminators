#pragma once
#include "ast.hpp"
#include <string>
#include <unordered_map>
#include <vector>

namespace whilec
{

    class SymbolTable
    {
    public:
        int indexOf(const std::string &name) const;
        const std::vector<std::string> &names() const { return names_; }

    private:
        std::vector<std::string> names_;
        std::unordered_map<std::string, int> toIndex_;

        friend SymbolTable buildSymbolTable(const Node &root);
    };

    // Build alphabetical name→index mapping by scanning the AST.
    SymbolTable buildSymbolTable(const Node &root);

}
