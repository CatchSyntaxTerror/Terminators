# Task5 & 6 — Testing and performance evaluation
  Authors: Zhuo Li
  
  This task introduces **automated tests** for the WHILE compiler using **Google Test (GTest)**.
  
  Zhuo added the gtest program
  ```
    auto_test.cpp
  ```

  The test harness:
  - Automatically discovers all `.while` programs from:
    - `WhileFiles/`
  - Compiles each file with the compiler `./whilec`
  - Verifies that the compiler generated:
    - `/assemblycode/out_program.s`
    - `labeled_program.while`
    - `dotfiles/ast.dot`
    - `dotfiles/cfg.dot`
  - Validates the pseudo RISC-V assembly, which ensures:
    - Correct prologue: `mv t2, a0`
    - Load/store for variable initialization: `ld sX, offset(t2)`, `sd sX, offset(t2)`

  This allows quick verification of correctness and stability after every code change.

---

## Requirements
- C++17 compatible compiler (g++, clang++)
- Optional: Graphviz for `make dot`

## Build and Run Tests
```bash
make          # builds /whilec
make test     # builds and runs all gtest cases
```

## Clean Up Repository
```bash
make clean
make clean-test
```

## Interpreting GTest Output
```bash
AllWhileFiles/WhileFileTest.GenerateAsmAndSanityCheck/stress_loop_countdown (25 ms)
```
- AllWhileFiles/WhileFileTest → test suite

- GenerateAsmAndSanityCheck → test function name

- /stress_loop_countdown → name of the .while file

- (25 ms) → time spent compiling and validating this .while file

### To list all test names:
```bash
./test_runner --gtest_list_tests
```

## Performace Evaluation
Task 6 compares the performace between register-based RISC-V (Project 2) with memory-based RISC-V (Project 1)

### Stress Test on Risc V:
#### To compile and run a single test - stress_square.while:
```bash
./bin/unit_tests --gtest_filter=*/stress_square

gcc -O2 -o wh build/tests/stress_square.c build/tests/stress_square.s

./wh 0 100000 0 0 0 0 
```
#### Output of the example:
```bash
Initial state:
v0=0
v1=100000
v2=0
v3=0
v4=0
v5=0
Final state:
v0=0
v1=100000
v2=100000
v3=10000000000
v4=0
v5=10000000000
```
### To time on Risc V:
```bash
time ./wh 100000
real    0m42.945s
user    0m42.941s
sys     0m0.000s
```

### stress_gcd_sub
```bash
time ./wh 0 1 0 100000000 0
real    0m0.505s
user    0m0.503s
sys     0m0.001s
```

### stress_gcd_mod
```bash
time ./wh 0 102334155 0 102334156 0 0
real    0m0.321s
user    0m0.320s
sys     0m0.000s
```

### stress_prime_count
```bash
time ./wh 0 10000 0 0 0 0 0 0 0
real    0m1.573s
user    0m1.568s
sys     0m0.004s
```
### stress_factorial:
```bash
time ./wh 0 12 0 0 0 0 0
real    0m1.482s
user    0m1.477s
sys     0m0.005s
```

### stress_factorial:
```bash
time ./wh 0 13 0 0 0 0 0
real    0m19.218s
user    0m19.210s
sys     0m0.004s
```