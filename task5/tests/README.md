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
    - and recursively from `../task3/`
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
```

## Interpreting GTest Output
```bash
AllWhileFiles/WhileFileTest.GenerateAsmAndSanityCheck/33 (300 ms)
```
- AllWhileFiles → test suite prefix

- WhileFileTest.GenerateAsmAndSanityCheck → fixture and test name

- /33 → index of the .while file (see below to show filenames)

- (300 ms) → time spent compiling and validating that specific .while file

### To list all test names:
```bash
./bin/unit_tests --gtest_list_tests
```

### To run a single test:
```bash
./bin/unit_tests --gtest_filter="*GenerateAsmAndSanityCheck/*[Any number from 0 to 36]*"
```