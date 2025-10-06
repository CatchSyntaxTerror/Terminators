# WHILE Language Syntax Error Tests

This directory contains WHILE programs intentionally written with **syntax errors** to test the parser’s error detection and reporting capabilities.  
Each file represents a common type of syntactic mistake the parser should recognize and handle gracefully.

---

##  Categories of Syntax Errors

### `missing_bracket.while`
Tests detection of unbalanced or missing square or round brackets in boolean or arithmetic expressions.

### `missing_do.while`
Checks for missing `do` keywords in `while` loop declarations (`while <cond> do <body> od`).

### `unfinished_body.while`
Simulates incomplete program structures such as unterminated loops or `if` statements with no closing keyword (`fi` or `od`).

### `missing_semicolon.while`
Ensures the parser flags missing semicolons between sequential commands.

### `missing_operand.while`
Validates handling of arithmetic expressions missing an operand, such as `x := 3 +`.

### `missing_colon.while`
Tests recognition of malformed assignment statements missing the full `:=` operator.

note: there are 27 tests for sytactical errors
---

## Purpose

These tests confirm that the parser:
- Accurately reports syntax errors with meaningful messages and line numbers.  
- Differentiates between various error types.  
- Does not crash or misinterpret partial input after encountering invalid syntax.

---

## Usage

Run any test file through the parser:

```
./while_parser filename.while
```

Expected output will include an explicit error message, for example:

```
PARSE ERROR (line 4): expected token THEN, got ID (lexeme='x')
Parse failed.
```

---

Each category in this folder corresponds to a family of similar syntactic issues (27 total), ensuring broad coverage of all grammar and structural rules in the WHILE language.
