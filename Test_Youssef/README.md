# Emulator
**Author: ** Youssef Amin

## Usage 
Compile: `g++ emulator.cpp -o e`\
Run sandmark: `./e sandmark.um`

# Results
```
youssefisawesome@b146-46:~/Emulator$ time ./e sandmark.um

real    0m49.995s
user    0m49.784s
sys     0m0.209s
```

## Description
This project implements a simple emulator.
It emulates a memory model with:
- seamingly infinite 32 bit words.
these words are held in arrays. with the "0" array always holding the current program being run.
- eight registers for holding values. These values are used to index memory and do simple algebraic expressions.
- I/O the machine can read and write single byte characters

## Improvements 
- To improve speed:
  - added checks to opperation methods to see if it was necessary to actually execute them. 
  - Implemented a stack for grabbing free ID's instead of continuously making new ones
  - cleaned up conditional statements
  - I'm concidering using a dispatch table to improve speed because of the 
  branch misdirect penalty with switch statments.

## AI Usage 
- After my embarassing failure I felt it unwise to use AI to help me.
- I lacked the fundamental knowledge to take shortcuts and am better off now that I have a better understanding of the material.
- I did however use the AI overview feature provided by google when I wasnt sure about what to `#include<>` for the methods I was using.

## TestRuns
- b146-46 
```
real    0m49.995s
user    0m49.784s
sys     0m0.209s
```
- risc-machine-2 \
 ```
 real    5m9.890s
user    5m9.807s
sys     0m0.008s
```