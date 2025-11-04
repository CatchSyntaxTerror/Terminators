# Project 2

## Task 1

```
ast.*
dot_emitter.*
lexer.*
parser.*
codegen_rv.*
symtab.*
tokens.hpp
main.cpp
```

---

## Task 2

### Labeler Module

This module recursively traverses the **Abstract Syntax Tree (AST)** and assigns a unique integer label to every executable node.  
The label numbers start from **1** and increase sequentially.  
Labels are assigned to the following statement nodes:

- **Assign**
- **Skip**
- **If**
- **While**

For **If** and **While** nodes, the label represents their **conditional test point**.  
The label information is stored in each node’s `label` field for later use in **pretty-printing** and **visualization**.

---

### Pretty Printer Module

This module generates **human-readable source code** from the AST structure.  
For each node that has a label, it outputs the label in the following format:

```while
/*ℓ=k*/ <statement>
```

It also supports **indentation** and **keyword-based formatting**, such as:

- `if ... then ... else ... fi`
- `while ... do ... od`

By combining the output from the **Labeler**, the Pretty Printer produces a WHILE program where every program point has a **unique label**.

---

## Run

```bash
g++ -std=c++17 -O2 src/*.cpp -o compiler
```

**Outputs:**
- `ast.dot`
- `labeled_program.while`

**Optional PDF rendering (requires Graphviz):**
```bash
dot -Tpdf ast.dot -o ast.pdf
```
