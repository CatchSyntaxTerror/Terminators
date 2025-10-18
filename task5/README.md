# Task5 
  Authors: Zhuo Li, Yue Hu, Youssef Amin
  
  First stage of code generation. Our compiler now converts parsed WHILE programs into RISC-V assembly.\
   It builds a symbol table that assigns each variable a stable, alphabetical slot in memory, and emits\ 
   instructions to load and store 64-bit values using registers `t0` for values, `t1` for addresses, and the base pointer `a0`.\
   At this stage, the backend supports sequential commands `;`, assignments `x := 5` and `x := y`, and skip

  ---
  
  Yue Hu wrote parser.cpp found in task3 folder.\
  Youssef Amin refactored code with header files for easy readability
  ```
  ast.cpp
  ast.hpp
  dot_emitter.cpp
  dot_emitter.hpp
  lexer.cpp
  lexer.hpp
  main.cpp
  parser.cpp
  parser.hpp
  tokens.hpp
  ```

  Youssef added code gen
  ```
  codegen_rv.cpp
  codegen_rv.hpp
  symtab.cpp
  symtab.hpp
  ```
---

## Build

```bash
make
make debug
```

---

## Run

```bash
make run ARGS=task5/test_program.while
# or:
./bin/whilec < task5/test_program.while
```

Outputs:
- `ast.dot` — Graphviz representation of the AST

Optional PDF rendering (requires Graphviz):
 - `dot -Tpdf ast.dot -o ast.pdf`

Test assembly code with main file
-`gcc -O2 main_asm_tester.c asm_program.s -o wh`
-`./wh args ...`

```bash
make dot
```

---

## Project Layout

```
src/        # Lexer, parser, AST, dot emitter, main entry, codegen
bin/        # Compiled binaries
build/      # Intermediate object files
task5/      # Example .while programs and Makefile
```

---

## Requirements

- C++17 compatible compiler (g++, clang++)
- Optional: Graphviz for `make dot`

## Run Assembly Code With c Tester on home machine
### Install QEMU for RISC-V
```
sudo apt update
sudo apt install qemu-user -y
```
### Compile and Run Tests
```
make run ARGS=tests/example1-factorial.while
riscv64-linux-gnu-gcc -O2 -c out_program.s -o factorial.o
riscv64-linux-gnu-gcc -static -O2 tests/test_factorial.c factorial.o -o factorial.elf
qemu-riscv64 ./factorial.elf 5
```
```
make run ARGS=tests/example13-fibonacci.while
riscv64-linux-gnu-gcc -O2 -c out_program.s -o fibonacci.o
riscv64-linux-gnu-gcc -static -O2 tests/test_fibonacci.c fibonacci.o -o fibonacci.elf
qemu-riscv64 ./fibonacci.elf 10
```
### clean up repository
```
rm -f factorial.o fibonacci.o factorial.elf fibonacci.elf out_program.s ast.dot
```