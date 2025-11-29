#pragma once
#include "ast.hpp"
#include <ostream>

namespace whilec {

void prettyPrintLabeled(Node* n, std::ostream& out, int indent = 0);
void prettyPrintSingleLine(const Node* n, std::ostream& out);

}
