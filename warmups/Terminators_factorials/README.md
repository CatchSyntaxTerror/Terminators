# Terminators: Factorial tests
**Authors: ** Youssef Amin, Yue Hu, Zhuo Li 

## Usage 
- Compile: `g++ -O3 um_dispatch.cpp -o e`\
- Run factorial-program-0.um: `echo 500 | time ./e factorial-program-0.um`
- Run factorial-program-10.um: ` echo 10000 | time ./e factorial-program-10.um`

### Conclusion

From these runs, we can see a clear performance gap between the two environments. On the **b146-46 (x86-64)** machine, the baseline `factorial-program-0.um` completed in about **8 seconds**, while the optimized `factorial-program-10.um` ran in about **5 seconds**.  

On the smaller **risc-machine-2 (RISC-V)** system, the same baseline program required over **two minutes (126s)**, while the optimized version ran in about **one minute (62s)**.  

These results highlight two key findings:  
1. **Architecture differences matter**: the x86-64 machine consistently outperformed the RISC-V machine, sometimes by more than an order of magnitude.  
2. **Optimizations are critical**: regardless of architecture, the optimized factorial program showed speedups, though the effect was far more pronounced on x86-64.  

In short, both hardware architecture and program design significantly affect performance.  


## TestRuns

| Machine        | Program                        | Input  | User Time | System Time | Elapsed   | CPU | Max Resident (KB) | Pagefaults (maj+min) |
|----------------|--------------------------------|--------|-----------|-------------|-----------|-----|-------------------|-----------------------|
| b146-46        | factorial-program-0.um         | 500    | 8.16      | 0.00        | 0:08.23   | 99% | 3928              | 2 + 216               |
| b146-46        | factorial-program-10.um        | 10000  | 4.76      | 0.00        | 0:04.77   | 99% | 4040              | 0 + 232               |
| risc-machine-2 | factorial-program-0.um         | 500    | 126.28    | 0.02        | 2:06.34   | 99% | 2816              | 2 + 196               |
| risc-machine-2 | factorial-program-10.um        | 10000  | 61.68     | 0.00        | 1:01.68   | 99% | 2944              | 0 + 213               |

# Data
The code output is saved in factorial_b146-46.log and factorial_risc.log

# AI Usage
We used AI to format our findings into the table above.
- https://chatgpt.com/c/68d05497-be18-8322-acd7-0f19ea89efbc