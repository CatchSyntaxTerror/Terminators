#include <sys/stat.h>
#include <bits/stdc++.h>
using namespace std;

long get_file_size_stat( char *filename)
{
    struct stat st;
    if (stat(filename, &st) == 0)
    {
        return st.st_size;
    }
    else
    {
        return -1;
    }
}

struct Block
{
    uint32_t *data = nullptr;
    uint32_t size = 0;
};

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

    void is_id_activate(uint32_t id)
    {
        if ((size_t)id >= arrays.size() || !active[id])
        {
            fprintf(stderr, "you are using inactive array id!");
            exit(1);
        }
    }

    void is_id_offset(uint32_t id, uint32_t offset)
    {
        if (offset >= arrays[id].size)
        {
            fprintf(stderr, "array index is out of bounds");
            exit(1);
        }
    }

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
                if (newPtr == nullptr)
                {
                    fprintf(stderr, "out of memory");
                    exit(1);
                }
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
                {
                    fprintf(stderr, "out of memory");
                    exit(1);
                }
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
        {
            printf("can not allocate 0");
            exit(1);
        }
        return id;
    }

    void free_arr(uint32_t id)
    {
        if (id == 0)
        {
            printf("can not deallocate array 0");
            exit(1);
        }
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
        {
            return;
        }
        is_id_activate(id);

        Block &old_ = arrays[id];
        Block &new_ = arrays[0];

        uint32_t *tmp = nullptr;
        if (old_.size > 0)
        {
            tmp = static_cast<uint32_t *>(malloc(old_.size * sizeof(uint32_t)));
            if (tmp == nullptr)
            {
                fprintf(stderr, "out of memory");
                exit(1);
            }
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

    FILE *fp = NULL;
    if (path != NULL)
    {
        fp = fopen(path, "rb");
        // printf("successfully open the um file!\n");
    }
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
    else if (size % 4 != 0)
    {
        fprintf(stderr, "program file size is not divisible by 4");
        return 1;
    }
    // printf("size is %ld\n", size);

    uint32_t words_num = (uint32_t)(size / 4);

    Block prog0;
    prog0.size = words_num;
    if (words_num > 0)
    {
        prog0.data = static_cast<uint32_t *>(malloc((size_t)words_num * sizeof(uint32_t)));
        if (prog0.data == nullptr)
        {
            fprintf(stderr, "out of memory");
            return 1;
        }
    }
    else
    {
        prog0.data = nullptr;
    }

    // for (uint32_t i = 0; i < words_num; i++)
    // {
    //     int A = fgetc(fp);
    //     int B = fgetc(fp);
    //     int C = fgetc(fp);
    //     int D = fgetc(fp);

    //     if (A == EOF || B == EOF || C == EOF || D == EOF)
    //     {
    //         printf("incomplete");
    //         return 1;
    //     }
    //     uint32_t word = (uint32_t(A) << 24) | (uint32_t(B) << 16) | (uint32_t(C) << 8) | uint32_t(D);

    //     prog0.data[i] = word;
    // }

    // fclose(fp);
    /*
        Replace the byte wise fgetc loop with a one-time read fread
        and assemble in batches
    */
    uint8_t *buf = (uint8_t*)malloc((size_t)size);
    if (!buf) { 
        fprintf(stderr, "out of memory\n"); 
        return 1; 
    }
    
    size_t r = fread(buf, 1, (size_t)size, fp);
    if (r != (size_t)size) { 
        fprintf(stderr, "failed to read file\n"); 
        free(buf); 
        return 1; 
    }

    for (uint32_t i = 0; i < words_num; ++i) {
        uint32_t base = 4 * i;
        uint32_t word = ((uint32_t)buf[base] << 24)
                    | ((uint32_t)buf[base+1] << 16)
                    | ((uint32_t)buf[base+2] << 8)
                    |  (uint32_t)buf[base+3];
        prog0.data[i] = word;
    }
    free(buf);

    MemoryManager manager(prog0);
    prog0.data = nullptr;
    prog0.size = 0;

    // general registers
    uint32_t regs[8] = {0};
    uint32_t counter = 0;

    // optimize
    uint32_t *array0 = manager.arrays[0].data;
    uint32_t array0_size = manager.arrays[0].size;

    while (true)
    {
        if (counter >= array0_size)
        {
            fprintf(stderr, "the program counter is outside the array 0");
            return 1;
        }
        uint32_t instruction = array0[counter];
        uint32_t opcode = instruction >> 28;

        // special operation
        if (opcode == 13)
        {
            uint32_t A = (instruction >> 25) & 0x7u;
            uint32_t value = instruction & 0x1FFFFFFu;
            regs[A] = value;
            counter++;
            continue;
        }

        uint32_t A = (instruction >> 6) & 0x7u;
        uint32_t B = (instruction >> 3) & 0x7u;
        uint32_t C = instruction & 0x7u;

        uint32_t id, offset, n, v;
        // other operations
        switch (opcode)
        {
        case 0: // conditional move
            if (regs[C] != 0)
            {
                regs[A] = regs[B];
            }
            counter++;

            break;
        case 1: // Array index
            offset = regs[C];
            id = regs[B];
            manager.is_id_activate(id);
            manager.is_id_offset(id, offset);
            regs[A] = manager.arrays[id].data[offset];
            counter++;
            break;
        case 2: // array update
            id = regs[A];
            offset = regs[B];
            manager.is_id_activate(id);
            manager.is_id_offset(id, offset);
            manager.arrays[id].data[offset] = regs[C];
            counter++;
            break;
        case 3: // addition
            regs[A] = (uint32_t)(regs[B] + regs[C]);
            counter++;
            break;
        case 4: // multiplication
            regs[A] = (uint32_t)(regs[B] * regs[C]);
            counter++;
            break;
        case 5: // division
            if (regs[C] == 0)
            {
                fprintf(stderr, "division by zero is not allowed");
                return 1;
            }
            regs[A] = (uint32_t)(regs[B] / regs[C]);
            counter++;
            break;
        case 6: // notand
            regs[A] = ~(regs[B] & regs[C]);
            counter++;
            break;
        case 7: // halt
            return 0;
            break;
        case 8: // allocation
            n = regs[C];
            id = manager.alloc_arr(n);
            regs[B] = id;
            counter++;
            break;
        case 9: // deallocation
            id = regs[C];
            manager.free_arr(id);
            counter++;
            break;
        case 10: // output
            v = regs[C];
            if (v > 255u || v < 0)
            {
                fprintf(stderr, "output value is out of the range [0,255]");
                return 1;
            }
            if (putchar((unsigned char)v) == EOF)
            {
                fprintf(stderr, "output error");
                return 1;
            }
            counter++;

            break;
        case 11: // input
        {
            int ch = getchar();
            if (ch == EOF)
            {
                regs[C] = 0xFFFFFFFFu;
            }
            else if (ch > 255 || ch < 0)
            {
                fprintf(stderr, "input is out of the range");
                return 1;
            }
            regs[C] = (uint32_t)(unsigned char)ch;
            counter++;
        }
        break;
        case 12: // load program
            id = regs[B];
            if (id != 0)
            {
                manager.load_from_id(id);
                // update cached pointer & size
                array0 = manager.arrays[0].data;
                array0_size = manager.arrays[0].size;
            }
            counter = regs[C];
            break;

        default:
            fprintf(stderr, "invalide opcode");
            return 1;
            break;
        }
    }
}
