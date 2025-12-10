# Task5 & 6 & 10 & 11 — Testing, Liveness-Aware Input Inference, and Performance Evaluation
  Authors: Zhuo Li
  
  This `README` file describes the **automated testing system** used for validating our WHILE compiler including:
  - **Task 5**: Automated testing infastructure
  - **Task 6**: Performance comparison with Project 1
  - **Task 10**: Inference the input-variable based on the liveness analysis result
  - **Task 11**: Final performace evaluation

All commands below are running under the `project2/src` folder.
<html ><hr> </html>

We implemented the GoogleTest test suite:
```
  auto_test.cpp
```
The test framework performs the following:
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
    - Load/store for variable initialization: `ld` or `sd sX`
    - Control-flow instructions when the source contains `if`/`while`

  This allows quick verification of correctness and stability after every code change.
  
  Comparing to phase 2, after the dead code analysis and liveness analysis, we now know exactly which variables are live at program entry. By outputing these variables into the file `liveness_entry.txt`, the test harness can then read the file and accept only the live-in variables rather than all variables.

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
../tests/test_runner --gtest_list_tests
```
### To compile and run a single test - stress_square.while:
```bash
../tests/test_runner --gtest_filter=*/stress_square

gcc -o wh build/stress_square.c build/stress_square.s

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

## Performace Evaluation - Task 6
### stress_square:
```bash
time ./wh 0 100000 0 0 0 0 
real    0m40.665s
user    0m40.649s
sys     0m0.008s
```

### stress_gcd_sub
```bash
time ./wh 0 1 0 1000000000 0
real    0m5.733s
user    0m5.726s
sys     0m0.005s
```

### stress_gcd_mod
```bash
time ./wh 0 102334155 0 102334156 0 0
real    0m0.370s
user    0m0.365s
sys     0m0.005s
```

### stress_prime_count
```bash
time ./wh 0 10000 0 0 0 0 0 0 0
real    0m1.509s
user    0m1.499s
sys     0m0.009s
```
### stress_factorial:
```bash
time ./wh 0 12 0 0 0 0 0
real    0m1.399s
user    0m1.394s
sys     0m0.005s
```

### stress_factorial:
```bash
time ./wh 0 13 0 0 0 0 0
real    0m18.148s
user    0m18.144s
sys     0m0.001s
```

### closest_prime:
```bash
time ./wh 0 387096383 0 0 0 0 0 0 0
real    2m33.711s
user    2m33.650s
sys     0m0.036s
```

### dead_while:
```bash
time ./wh 0 1000000000 0 0 0 0 0 0 0 0 0
real    0m17.416s
user    0m17.406s
sys     0m0.009s
```
## Performace Evaluation - Task 11
### stress_square:
```bash
time ./wh 100000
real    0m40.645s
user    0m40.562s
sys     0m0.001s
```

### stress_gcd_sub
```bash
time ./wh 1 1000000000
real    0m5.013s
user    0m5.008s
sys     0m0.005s
```

### stress_gcd_mod
```bash
time ./wh 102334155 102334156
real    0m0.370s
user    0m0.369s
sys     0m0.000s
```

### stress_prime_count
```bash
time ./wh 10000
real    0m1.505s
user    0m1.499s
sys     0m0.005s
```
### stress_factorial:
```bash
time ./wh 12
real    0m1.399s
user    0m1.398s
sys     0m0.001s
```

### stress_factorial:
```bash
time ./wh 13
real    0m18.151s
user    0m18.135s
sys     0m0.013s
```
### closest_prime:
```bash
time ./wh 387096383
real    2m33.619s
user    2m33.613s
sys     0m0.004s
```
### dead_while
```bash
time ./wh 1000000000
real    0m4.776s
user    0m4.774s
sys     0m0.001s
```