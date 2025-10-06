# WHILE Language Parser (C++17)

A minimal, hand-written **lexer** and **recursive-descent parser** for the WHILE language, featuring an **Abstract Syntax Tree (AST)** and **Graphviz DOT** export for visualization.

---

## Files

### `parser.cpp`
Implements the full WHILE parser:
- Defines AST node types for programs, commands, arithmetic, and boolean expressions.  
- Implements a lexer that tokenizes input, skipping whitespace and comments (`--` and `{- ... -}`).  
- Uses a recursive descent parser to construct the AST.  
- Includes a `DotEmitter` that outputs the AST as `ast.dot` for visualization with Graphviz.  
- Provides a command-line interface to compile and run the parser.

---

## Build

`parser.cpp` already includes all definitions:  
g++ -std=c++17 -O2 parser.cpp -o while_parser  

---

## Run

To parse a WHILE program:  
./while_parser examples.while  

To generate a PDF of the AST:  
dot -Tpdf ast.dot -o ast.pdf  

Expected output on success:  
OK: parse succeeded.  
DOT written to ast.dot  

Example error output:  
PARSE ERROR (line X): expected token ..., got ... (lexeme='...')  
Parse failed.  

---

## Notes

Recognized keywords:  
if, then, else, fi, while, do, od, skip, true, false, not, and, or  

Supported operators:  
:=, ;, (, ), [, ], +, -, *, =, <, >, <=, >=  

Features:  
- Supports both line comments (-- ...) and block comments ({- ... -}).  
- Handles nested arithmetic and boolean expressions with proper precedence.  

---

## Summary
`parser.cpp` forms a complete WHILE language frontend that scans and tokenizes source code, parses it into an AST, and exports a visual representation through Graphviz.  
This setup can serve as a foundation for extending the WHILE language into a full interpreter or compiler.
