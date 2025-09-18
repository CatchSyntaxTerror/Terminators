#include <cstdint>
#include <climits>
#include <iostream>
#include <cstring>
#include <stack>
#include <fstream>
using namespace std;

/**
 * This is to be a simple Compiler
 * Author: Youssef Amin
 *
 * Q from Darko: how would you implement if then else in assembly code
 *
 * TODO: Speed up anyway you can!
 * * Possibly use dispatch: https://eli.thegreenplace.net/2012/07/12/computed-goto-for-efficient-dispatch-tables?
 * * C++ documentation: https://devdocs.io/cpp/
 */

uint32_t MAX_WORDS = 1000000;
uint32_t REG[8]{};
uint32_t **RAM = new uint32_t *[MAX_WORDS]();
uint32_t RAM0_LENGTH = 0;
uint32_t LEN[100000]{};

stack<uint32_t> FREE_IDS;
uint32_t NEW_ID = 1;

/**
 * This method loads the 0 array in RAM with the program.
 */
int readFile(const char *filename)
{
    uint32_t words = 0;
    uint32_t cap = 0;

    std::ifstream in(filename, std::ios::binary);
    if (!in)
    {
        std::cerr << "Could not open program file: " << filename << "\n";
        return 1;
    }

    auto grow = [&](size_t one = 1)
    {
        if (words + one <= cap)
            return;
        size_t new_cap = (cap == 0 ? 16 : cap * 2);
        while (new_cap < words + one)
            new_cap *= 2;

        uint32_t *copy_arr = new uint32_t[new_cap];
        for (uint32_t i = 0; i < words; i++)
            copy_arr[i] = RAM[0][i];
        delete[] RAM[0];
        RAM[0] = copy_arr;
        cap = new_cap;
    };

    for (;;)
    {
        int a = in.get();
        if (a == EOF)
            break;
        int b = in.get();
        int c = in.get();
        int d = in.get();
        if (b == EOF || c == EOF || d == EOF)
        {
            std::cerr << "Program file not divisible by 4\n";
            return 1;
        }

        uint32_t word = ((uint32_t)a << 24) |
                        ((uint32_t)b << 16) |
                        ((uint32_t)c << 8) |
                        (uint32_t)d;

        grow();
        RAM[0][words++] = word;
    }

    RAM0_LENGTH = words;
    LEN[0] = RAM0_LENGTH;
    return 0;
}

/**
 * Just to see what i'm dealing with
 */
void printRAM0()
{
    for (uint32_t i = 0; i < RAM0_LENGTH && i < 8; ++i)
    {
        cout << "RAM[0][" << i << "] = 0x" << std::hex << RAM[0][i] << std::dec << "\n";
    }
}

// The following methods (opcode0 -> opcode13) carry out opperation codes

// Conditional Move
void opcode0(uint32_t A, uint32_t B, uint32_t C)
{
    if (REG[C])
        REG[A] = REG[B];
}

// Array Index
void opcode1(uint32_t A, uint32_t B, uint32_t C)
{
    REG[A] = RAM[REG[B]][REG[C]];
}

// Array Update
void opcode2(uint32_t A, uint32_t B, uint32_t C)
{
    RAM[REG[A]][REG[B]] = REG[C];
}

// Addition
void opcode3(uint32_t A, uint32_t B, uint32_t C)
{
    REG[A] = REG[B] + REG[C];
}

// Multiplication
void opcode4(uint32_t A, uint32_t B, uint32_t C)
{
    REG[A] = REG[B] * REG[C];
}

// Division
int opcode5(uint32_t A, uint32_t B, uint32_t C)
{
    if (!REG[C])
        return 1;
    REG[A] = REG[B] / REG[C];
    return 0;
}

// Nand
void opcode6(uint32_t A, uint32_t B, uint32_t C)
{
    uint32_t b = REG[B] ^ 0xFFFFFFFF;
    uint32_t c = REG[C] ^ 0xFFFFFFFF;
    REG[A] = b | c;
}

// Allocation
void opcode8(uint32_t A, uint32_t B, uint32_t C)
{
    uint32_t *newArr = new uint32_t[REG[C]]();
    if (FREE_IDS.empty())
    {
        RAM[NEW_ID] = newArr;
        LEN[NEW_ID] = REG[C];
        REG[B] = NEW_ID;
        NEW_ID++;
    }
    else
    {
        RAM[FREE_IDS.top()] = newArr;
        LEN[FREE_IDS.top()] = REG[C];
        REG[B] = FREE_IDS.top();
        FREE_IDS.pop();
    }
}
// Deallocation
void opcode9(uint32_t C)
{
    if (REG[C] == 0)
        return;
    delete[] RAM[REG[C]];
    RAM[REG[C]] = nullptr;
    LEN[REG[C]] = 0;
    FREE_IDS.push(REG[C]);
}

// Output
void opcode10(uint32_t C)
{
    if (REG[C] <= 255 && REG[C] >= 0)
        putchar(static_cast<char>(REG[C]));
}

// Input
void opcode11(uint32_t C)
{
    // fread?
    int a = getchar();
    if (a == EOF)
    {
        REG[C] = 0xFFFFFFFF;
    }
    else if (a >= 0 && a <= 255)
    {
        REG[C] = ((uint32_t)a) & 0xff;
    }
}

// Load prog
void opcode12(uint32_t B)
{
    if (REG[B] != 0)
    {
        uint32_t len = LEN[REG[B]];
        auto *dup = new uint32_t[len];
        memcpy(dup, RAM[REG[B]], len * sizeof(uint32_t));
        delete[] RAM[0];
        RAM[0] = dup;
        LEN[0] = RAM0_LENGTH = len;
    }
}

void opcode13(uint32_t word)
{
    uint32_t A = (word >> 25) & 0x7;
    uint32_t val = word & 0x1FFFFFF;
    REG[A] = val;
}
/**
 * Main method loops through the '0' array
 * carries out opperations based on opcode;
 */
int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        std::cerr << "you need to pass in a file dude";
        return 1;
    }

    if (readFile(argv[1]) != 0)
        return 1;
    size_t pc = 0;

    while (pc < RAM0_LENGTH)
    {
        uint32_t word = RAM[0][pc];
        uint32_t op_code = (word >> 28) & 0xF;
        uint32_t A = (word >> 6) & 0x7;
        uint32_t B = (word >> 3) & 0x7;
        uint32_t C = word & 0x7;

        switch (op_code)
        {
        case 0:
        {
            opcode0(A, B, C);
            break;
        }
        case 1:
        {
            opcode1(A, B, C);
            break;
        }
        case 2:
        {
            opcode2(A, B, C);
            break;
        }
        case 3:
        {
            opcode3(A, B, C);
            break;
        }
        case 4:
        {
            opcode4(A, B, C);
            break;
        }
        case 5:
        {
            if (opcode5(A, B, C))
            {
                cout << "You cant devide by 0" << endl;
                return 1;
            };
            break;
        }
        case 6:
        {
            opcode6(A, B, C);
            break;
        }
        case 7:
        {
            // Halt
            return 0;
            break;
        }
        case 8:
        {
            opcode8(A, B, C);
            break;
        }
        case 9:
        {
            opcode9(C);
            break;
        }
        case 10:
        {
            opcode10(C);
            break;
        }
        case 11:
        {
            opcode11(C);
            break;
        }
        case 12:
        {
            opcode12(B);
            pc = REG[C];
            continue;
        }
        case 13:
        {
            opcode13(word);
            break;
        }
        }
        pc++;
    }
    delete[] RAM[0];
    delete[] RAM;
    return 0;
}