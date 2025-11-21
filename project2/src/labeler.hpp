#pragma once
#include "ast.hpp"

namespace whilec {

struct Labeler {
    int counter = 1;
    inline int next() { return counter++; }

    void run(Node* n);
    void visit(Node* n);
};

} // namespace whilec
