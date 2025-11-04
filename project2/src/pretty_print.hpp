#pragma once
#include "ast.hpp"
#include <ostream>

namespace whilec {

/// Pretty-print a labeled AST as a WHILE program with labels inserted as comments.
/// `indent` controls initial indentation (in two-space units).
void prettyPrintLabeled(Node* n, std::ostream& out, int indent = 0);

} // namespace whilec
