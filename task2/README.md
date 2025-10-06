# WHILE Language Test Programs

This folder includes WHILE programs used to test the **lexer**, **parser**, and **AST generation** in `parser.cpp`.  
Each file targets specific language constructs such as branching, arithmetic, and boolean logic.

---

## Test Files

### `simple_test.while`
Basic assignments and arithmetic expressions.  
Tests variable initialization, arithmetic precedence, and command sequencing with `;`.

### `simple_branching_test.while`
Simple `if-then-else` structure using relational operators.  
Checks condition parsing and correct handling of comparison symbols (`<`, `>=`, `=`).

### `test_branching.while`
Nested conditional logic with multiple `if` blocks.  
Verifies nested branching, boolean expressions, and correct matching of `fi` tokens.

### `test_logical.while`
Exercises boolean logic and comments.  
Tests `and`, `or`, `not`, nested `[ ... ]` expressions, and both comment types (`--`, `{- ... -}`).

### `test_paren.while`
Focuses on parentheses handling.  
Validates proper grouping in arithmetic and boolean expressions with deep nesting.

---

## Summary

Together, these files test:
- Assignments, sequencing, and loops  
- Arithmetic and boolean precedence  
- Conditionals (`if`, `then`, `else`, `fi`)  
- Logical operators and parentheses  
- Comment and whitespace handling  

Run any test file with:

```
./while_parser filename.while
dot -Tpdf ast.dot -o ast.pdf
```

Expected output:

```
OK: parse succeeded.
DOT written to ast.dot
```
