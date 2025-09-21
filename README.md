# Compiling Construction Project

## Contributors
- Youssef Amin  
- Zhuo Li  
- Yue Hu  

## Overview
This repository contains our group project for **Compiling Construction** at the University of New Mexico.  
The focus of this project is the design and testing of emulators that replicate a memory model, alongside benchmarking and test programs to evaluate performance across different architectures.

Our testing has been conducted on the CS Department machines at UNM:
- `b146`: Standard Linux workstation
- `risc-machine-2`: RISC-V machine (resource-constrained, significantly smaller)

By comparing results across these environments, we aim to understand how different architectures handle emulation workloads and performance bottlenecks.
 

## Running the Project
Typical workflow involves:

1. Compile an emulator (example using `g++`):  
    g++ -O3 emulator.cpp -o emulator

2. Run with a `.um` file input:  
    ./emulator sandmark.um

3. Benchmark with `time` (Linux example):  
    time ./emulator sandmark.um

### Expected Results
- On `b146` (x86-64): Lower runtime due to stronger hardware  
- On `risc-machine-2` (RISC-V): Noticeably slower, reflecting architectural constraints  

## Example Benchmark Results

**b146 – g++ -O3 dispatch table**
    
    real    0m10.993s
    user    0m10.979s
    sys     0m0.012s

**risc-machine-2 – g++ -O3 dispatch table**
    
    real    2m18.757s
    user    2m18.725s
    sys     0m0.020s


## Notes
- This repository is a work-in-progress as we continue exploring optimizations and verifying emulator correctness.  
- Results may vary depending on compiler flags, machine load, and hardware differences.  
