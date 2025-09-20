#include <sys/stat.h>
#include <bits/stdc++.h>
using namespace std;

long get_file_size_stat(char *filename)
{
    struct stat st;
    if (stat(filename, &st) == 0)
        return st.st_size;

    return -1;
}

struct Block
{
    uint32_t *data = nullptr;
    uint32_t size = 0;
};

#define LIKELY(x) __builtin_expect(!!(x), 1)
#define UNLIKELY(x) __builtin_expect(!!(x), 0)
__attribute__((cold, noinline)) void fatal(const char *msg)
{
    fwrite(msg, 1, strlen(msg), stderr);
    exit(1);
}
class MemoryManager
{
public:
    vector<Block> arrays;
    vector<uint8_t> active;
    vector<uint32_t> free_ids;
    MemoryManager(Block &prog)
    {
        arrays.push_back(prog);
        active.push_back(1);
    }

    inline void is_id_activate(uint32_t id)
    {
#ifndef NDEBUG
        if (UNLIKELY((size_t)id >= arrays.size() || !active[id]))
        {
            fatal("you are using inactive array id!");
        }
#endif
    }
    inline void is_id_offset(uint32_t id, uint32_t offset)
    {
#ifndef NDEBUG

        if (UNLIKELY(offset >= arrays[id].size))
        {
            fatal("array index is out of bounds");
        }
#endif
    }

    // void is_id_activate(uint32_t id)
    // {
    //     if ((size_t)id >= arrays.size() || !active[id])
    //     {
    //         fprintf(stderr, "you are using inactive array id!");
    //         exit(1);
    //     }
    // }

    // void is_id_offset(uint32_t id, uint32_t offset)
    // {
    //     if (offset >= arrays[id].size)
    //     {
    //         fprintf(stderr, "array index is out of bounds");
    //         exit(1);
    //     }
    // }

    uint32_t alloc_arr(uint32_t n)
    {
        uint32_t id;
        if (!free_ids.empty())
        {
            id = free_ids.back();
            free_ids.pop_back();

            uint32_t *newPtr = nullptr;
            if (n > 0)
            {
                // alocate new data
                newPtr = static_cast<uint32_t *>(calloc(n, sizeof(uint32_t)));
                if (!newPtr)
                    fatal("out of memory");
            }
            if (arrays[id].data != nullptr)
            {
                // free old data
                free(arrays[id].data);
            }
            arrays[id].data = newPtr;
            arrays[id].size = n;
            active[id] = 1;
        }
        else
        {
            Block blc;
            if (n > 0)
            {
                blc.data = static_cast<uint32_t *>(calloc(n, sizeof(uint32_t)));
                if (blc.data == nullptr)
                    fatal("out of memory");
                blc.size = n;
            }
            else
            {
                blc.data = nullptr;
                blc.size = 0;
            }
            arrays.push_back(blc);
            active.push_back(1);
            id = (uint32_t)arrays.size() - 1;
        }
        if (id == 0)
            fatal("can't allocate 0");
        return id;
    }

    void free_arr(uint32_t id)
    {
        if (id == 0)
            fatal("can't deallocate array 0");
        is_id_activate(id);
        if (arrays[id].data != nullptr)
        {
            free(arrays[id].data);
            arrays[id].data = nullptr;
        }
        arrays[id].size = 0;
        active[id] = 0;
        free_ids.push_back(id);
    }

    void load_from_id(uint32_t id)
    {
        if (id == 0)
            return;
        is_id_activate(id);

        Block &old_ = arrays[id];
        Block &new_ = arrays[0];

        uint32_t *tmp = nullptr;
        if (old_.size > 0)
        {
            tmp = static_cast<uint32_t *>(malloc(old_.size * sizeof(uint32_t)));
            if (tmp == nullptr)
                fatal("out of memory");
            memcpy(tmp, old_.data, old_.size * sizeof(uint32_t));
        }
        if (new_.data != nullptr)
        {
            free(new_.data);
        }
        new_.data = tmp;
        new_.size = old_.size;
    }
};

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        fprintf(stderr, "Need a um file %s\n", argv[0]);
        return 2;
    }

    // read um file
    char *path = argv[1];

    FILE *fp = fopen(path, "rb");
    if (!fp)
    {
        fprintf(stderr, "failed open the um file!\n");
        return 1;
    }

    long size = get_file_size_stat(path);
    if (size < 0)
    {
        fprintf(stderr, "failed to get the file size: %s\n", path);
        return 1;
    }
    if (size % 4 != 0)
    {
        fprintf(stderr, "program file size is not divisible by 4");
        return 1;
    }

    uint32_t words_num = (uint32_t)(size / 4);

    Block prog0;
    prog0.size = words_num;
    if (words_num > 0)
    {
        prog0.data = (uint32_t *)(malloc((size_t)words_num * sizeof(uint32_t)));
        if (!prog0.data)
            fatal("out of memory");
        size_t r = fread(prog0.data, 4, (size_t)words_num, fp);
        if (r != (size_t)words_num)
        {
            fprintf(stderr, "failed to read file\n");
            free(prog0.data);
            return 1;
        }
        for (uint32_t i = 0; i < words_num; ++i)
        {
            prog0.data[i] = __builtin_bswap32(prog0.data[i]);
        }
    }
    else
    {
        prog0.data = nullptr;
    }
    fclose(fp);

    MemoryManager manager(prog0);
    prog0.data = nullptr;
    prog0.size = 0;

    // general registers
    uint32_t regs[8] = {0};
    uint32_t counter = 0;

    // optimize
    uint32_t *array0 = manager.arrays[0].data;
    uint32_t array0_size = manager.arrays[0].size;

    uint32_t instruction = 0;
    uint32_t opcode = 0;

    // dispatch table
    static void *dispatch_table[] = {
        &&OP0, &&OP1, &&OP2, &&OP3,
        &&OP4, &&OP5, &&OP6, &&OP7,
        &&OP8, &&OP9, &&OP10,
        &&OP11, &&OP12, &&OP13};

// DISPATCH macro
#define DISPATCH()                                               \
    do                                                           \
    {                                                            \
        if (counter >= array0_size)                              \
            fatal("the program counter is outside the array 0"); \
        instruction = array0[counter];                           \
        opcode = instruction >> 28;                              \
        if (UNLIKELY(opcode > 13))                               \
            fatal("invalide opcode");                            \
        goto *dispatch_table[opcode];                            \
    } while (0)

    DISPATCH();

OP13: // 13: load value
{
    uint32_t A = (instruction >> 25) & 0x7u;
    uint32_t value = instruction & 0x1FFFFFFu;
    regs[A] = value;
    counter++;
    DISPATCH();
}

OP0: // 0: conditional move
{
    uint32_t A = (instruction >> 6) & 0x7u;
    uint32_t B = (instruction >> 3) & 0x7u;
    // uint32_t C = instruction & 0x7u;
    if (regs[instruction & 0x7u] != 0)
        regs[A] = regs[B];
    counter++;
    DISPATCH();
}

OP1: // 1: Array index
{
    uint32_t A = (instruction >> 6) & 0x7u;
    // uint32_t B = (instruction >> 3) & 0x7u;
    // uint32_t C = instruction & 0x7u;
    uint32_t offset = regs[instruction & 0x7u];
    uint32_t id = regs[(instruction >> 3) & 0x7u];
    manager.is_id_activate(id);
    manager.is_id_offset(id, offset);
    regs[A] = manager.arrays[id].data[offset];
    counter++;
    DISPATCH();
}

OP2: // 2: Array update
{
    // uint32_t A = (instruction >> 6) & 0x7u;
    // uint32_t B = (instruction >> 3) & 0x7u;
    uint32_t C = instruction & 0x7u;
    uint32_t id = regs[(instruction >> 6) & 0x7u];
    uint32_t offset = regs[(instruction >> 3) & 0x7u];
    manager.is_id_activate(id);
    manager.is_id_offset(id, offset);
    manager.arrays[id].data[offset] = regs[C];
    counter++;
    DISPATCH();
}

OP3: // 3: addition
{
    uint32_t A = (instruction >> 6) & 0x7u;
    uint32_t B = (instruction >> 3) & 0x7u;
    uint32_t C = instruction & 0x7u;
    regs[A] = (uint32_t)(regs[B] + regs[C]);
    counter++;
    DISPATCH();
}

OP4: // 4: multiplication
{
    uint32_t A = (instruction >> 6) & 0x7u;
    uint32_t B = (instruction >> 3) & 0x7u;
    uint32_t C = instruction & 0x7u;
    regs[A] = (uint32_t)(regs[B] * regs[C]);
    counter++;
    DISPATCH();
}

OP5: // 5: division
{
    uint32_t A = (instruction >> 6) & 0x7u;
    uint32_t B = (instruction >> 3) & 0x7u;
    uint32_t C = instruction & 0x7u;
    if (regs[C] == 0)
        fatal("division by zero is not allowed");

    regs[A] = (uint32_t)(regs[B] / regs[C]);
    counter++;
    DISPATCH();
}

OP6: // 6: notand
{
    uint32_t A = (instruction >> 6) & 0x7u;
    uint32_t B = (instruction >> 3) & 0x7u;
    uint32_t C = instruction & 0x7u;
    regs[A] = ~(regs[B] & regs[C]);
    counter++;
    DISPATCH();
}

OP7: // 7: halt
{
    return 0;
}

OP8: // 8: allocation
{
    uint32_t B = (instruction >> 3) & 0x7u;
    uint32_t C = instruction & 0x7u;
    // uint32_t id = manager.alloc_arr(regs[instruction & 0x7u]);
    regs[B] = manager.alloc_arr(regs[C]);
    counter++;
    DISPATCH();
}

OP9: // 9: deallocation
{
    uint32_t C = instruction & 0x7u;
    // uint32_t id = regs[C];
    manager.free_arr(regs[C]);
    counter++;
    DISPATCH();
}

OP10: // 10: output
{
    uint32_t v = regs[instruction & 0x7u];
    if (v > 255u)
        fatal("output value is out of the range [0,255]");
    if (putchar((unsigned char)v) == EOF)
        fatal("output error");
    counter++;
    DISPATCH();
}

OP11: // 11: input
{
    uint32_t C = instruction & 0x7u;
    int ch = getchar();
    regs[C] = (ch == EOF) ? 0xFFFFFFFFu : (uint32_t)(unsigned char)ch;
    counter++;
    DISPATCH();
}

OP12: // 12: load program
{
    // uint32_t B = (instruction >> 3) & 0x7u;
    uint32_t C = instruction & 0x7u;
    uint32_t id = regs[(instruction >> 3) & 0x7u];
    if (id != 0)
    {
        manager.load_from_id(id);
        // update cached pointer & size
        array0 = manager.arrays[0].data;
        array0_size = manager.arrays[0].size;
    }
    counter = regs[C];
    DISPATCH();
}

// end labels
#undef DISPATCH
}
