# Task6 — Automated Assembly Sanity Tests & Stress Evaluation
  Authors: Zhuo Li, Yue Hu, Youssef Amin

  This task introduces **automated tests** for the WHILE compiler using **Google Test (GTest)**.
  
  Zhuo added the gtest program
  ```
    test_codegen.cpp
  ```

  The test harness:
  - Automatically discovers all `.while` programs from:
    - `task5/tests/`
    - and `task3/`
  - Compiles each file with the compiler `./bin/whilec`
  - Verifies that the generated RISC-V assembly (`out_program.s`) contains expected instruction patterns
  - Reports each `.while` file as a **separate GTest test case**, with its own runtime and result.

  This allows quick verification of correctness and stability after every code change.

---

## Requirements
- C++17 compatible compiler (g++, clang++)
- Optional: Graphviz for `make dot`

## Build and Run
```bash
cd task5
make          # builds bin/whilec
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
./bin/unit_tests --gtest_list_tests
```

## stress test on Risc V:
### To compile and run a single test - stress_square.while:
```bash
./bin/unit_tests --gtest_filter=*/stress_square

gcc -O2 -o wh build/tests/stress_square.c build/tests/stress_square.s

./wh 100000
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
real    1m16.376s
user    1m16.347s
sys     0m0.017s
```

### stress_gcd_sub
```bash
time ./wh 1 100000000
real    0m0.959s
user    0m0.949s
sys     0m0.009s
```

### stress_gcd_mod
```bash
time ./wh 102334155 102334156
real    0m0.688s
user    0m0.683s
sys     0m0.005s
```

### stress_prime_count
```bash
time ./wh 10000
real    0m3.321s
user    0m3.309s
sys     0m0.000s
```
### stress_factorial_addition:
```bash
time ./wh 12
real    0m2.960s
user    0m2.954s
sys     0m0.004s
```

### stress_factorial_addition:
```bash
time ./wh 13
real    0m38.434s
user    0m38.426s
sys     0m0.000s
```

### collatz:
```bash
time ./wh 77031
real    0m1.461s
user    0m1.456s
sys     0m0.005s
```

### madprime:
```bash
time ./wh 524287
real    0m0.035s
user    0m0.026s
sys     0m0.008s
```

### sumfactors:
```bash
time ./wh 1200
real    0m2.894s
user    0m2.888s
sys     0m0.004s
```

## countTriangularNumbers:
```bash
time ./wh 0 1000000
real    0m11.726s
user    0m11.721s
sys     0m0.005s
```