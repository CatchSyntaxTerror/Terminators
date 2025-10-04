# Terminators: Improving the Emulator
**Authors: ** Youssef Amin, Yue Hu, Zhuo Li \
After evaluating the performance of our implementations, we selected Yue Hu’s emulator, originally submitted for Warmup Exercise 3, as the baseline moving forward.

## Usage 
- Compile: `g++ -O3 um_dispatch.cpp -o e`\
- Run sandmark: `./e sandmark.um`

## Improvements 
The changes below reduce per-instruction overhead, memory indirection, and syscall frequency, while preserving the exact UM semantics.

- Introduced a precomputed GO-TO dispatch table to minimize control-flow overhead, eliminating the runtime cost of repetitive switch case evaluations and significantly improving execution speed.

- compiling with the -O3 optimization flag further enhances performance by enabling aggressive inlining, loop unrolling, and vectorization.

## Results 

The benchmarks clearly demonstrate that both the **dispatch table optimization** and the **`-O3` compile flag** provide significant performance improvements, though their impact varies by machine.  

#### b146-46  
- Original runtime was ~47s.  
- Switching to the dispatch table reduced this to ~37s (≈ **1.3× faster**).  
- With `-O3`, runtime dropped dramatically to ~11s (≈ **4.3× faster** than the original).  
- This shows the combined effect of optimized control-flow and compiler-level optimizations working in synergy.  

#### risc-machine-2  
- Original runtime was ~4m46s.  
- The dispatch table alone performed slightly worse (~5m15s), suggesting architectural differences where branch dispatch wasn’t the main bottleneck.  
- With `-O3`, runtime improved significantly to ~2m19s (≈ **2× faster** than the original).  

#### Overall  
- On architectures like **b146-46**, the dispatch table plus `-O3` yields substantial gains by minimizing control-flow overhead and exploiting compiler optimizations.  
- On **risc-machine-2**, most of the benefit comes from `-O3`, indicating that instruction scheduling and low-level optimizations matter more than dispatch style.  

**Conclusion:** The combined approach of a computed GO-TO dispatch table and compiler optimization provides consistent, tangible performance improvements, though the magnitude depends on the underlying hardware architecture.  

## TestRuns
### Benchmark Results  

| Machine        | Compile Option            | Input        | Real Time | User Time | Sys Time |
|----------------|---------------------------|--------------|-----------|-----------|----------|
| b146-46        | g++ -O3 um_dispatch.cpp   | sandmark.um  | 0m10.993s | 0m10.979s | 0m0.012s |
| risc-machine-2 | g++ -O3 emulator.cpp      | sandmark.um  | 2m18.757s | 2m18.725s | 0m0.020s |
| b146-46        | g++ um_dispatch.cpp       | sandmark.um  | 0m37.568s | 0m37.556s | 0m0.008s |
| risc-machine-2 | g++ um_dispatch.cpp       | sandmark.um  | 5m15.332s | 5m15.262s | 0m0.008s |
| b146-46        | g++ emulator.cpp          | sandmark.um  | 0m47.369s | 0m47.362s | 0m0.004s |
| risc-machine-2 | g++ emulator.cpp          | sandmark.um  | 4m45.703s | 4m45.631s | 0m0.000s |



## umix.um
umix is a is like the Unix operating system that supports essential commands such as mkdir, ls, , and pwd for managing and navigating files. below is the test run of umix.
```
youssefisawesome@b146-46:~/Terminators/Terminators/Yue$ ./e umix.um


12:00:00 1/1/19100
Welcome to Universal Machine IX (UMIX).

This machine is a shared resource. Please do not log
in to multiple simultaneous UMIX servers. No game playing
is allowed.

Please log in (use 'guest' for visitor access).
;login: guest
logged in as guest
INTRO.LOG=200@3038|70f135d810a36771143150c56b999c5


You have new mail. Type 'mail' to view.
% mail
First unread message:
---------------------

Date: Fri, 1 Jan 19100 00:00:00 -0400
From: Administrator <root@localhost>
To: guest@cbv.net
Subject: guest account misuse

To whom it may concern:

Guest access is provided as a courtesy to the community. We have
recently observed an increase in abuse using the guest account. For
example, the following sequence of commands obviously represents an
attempt to gain unauthorized access to the account "howie":

  cd code
  /bin/umodem hack.bas STOP
  /bin/qbasic hack.bas
  ls /home
  ./hack.exe howie

Moreover, the file that you uploaded with umodem appears to be
corrupted and did not compile.

Please have respect for your fellow users,
Admin

% ls
code/
a.out*
% mkdir testdir
% ls
testdir/
code/
a.out*
% cd testdir/
% ls
% mkdir subdir1
% mkdir subdir2
% help
For information on a specific command, type
  help cmd
UMIX Commands:
  ls
  rm
  cat
  more
  cdup
  mkdir
  cd
  run
  pwd
  logout
  % ls
code/
a.out*
% mkdir testdir
% cd testdir/
% ls
% mkdir subdir1
% mkdir subdir2
% ls
subdir2/
subdir1/
% logout
youssefisawesome@b146-46:~/Terminators/Terminators/Yue$
```

## AI Usage 
We used AI to format our findings into the table above.
- https://chatgpt.com/share/68d0372e-8d8c-800a-9335-9a9add250e1a 

## Sources
- Computed GO-TO: https://eli.thegreenplace.net/2012/07/12/computed-goto-for-efficient-dispatch-tables