#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <string>
#include <iostream>
using namespace std;

using u32 = uint32_t;

#if defined(__GNUC__)
#  define LIKELY(x)   __builtin_expect(!!(x), 1)
#  define UNLIKELY(x) __builtin_expect(!!(x), 0)
#else
#  define LIKELY(x)   (x)
#  define UNLIKELY(x) (x)
#endif


struct UM {

    u32 R[8] = {0};                 // Registers
    vector<vector<u32>> arrays;      // Memory segments 
    vector<u32> free_ids;            // Reusable segment IDs
    u32 pc = 0;                      // Program counter
    bool halted = false;             // Halt flag
    vector<uint8_t> active;          // Active

    [[noreturn]] void fail(const string& msg) {
        fprintf(stderr, "UM Fail: %s\n", msg.c_str());
        exit(1);
    }

    void load_program(const string& path) {
        FILE* f = fopen(path.c_str(), "rb");
        if (!f) fail("cannot open program file: " + path);

        vector<u32> prog;
        prog.reserve(1<<16);
        unsigned char b[4];
        while (true) {
            size_t got = fread(b, 1, 4, f);
            if (got == 0) break;
            if (got != 4) { fclose(f); fail("program file size not divisible by 4"); }
            u32 w = (static_cast<u32>(b[0])<<24) | (static_cast<u32>(b[1])<<16)
                  | (static_cast<u32>(b[2])<<8)  |  static_cast<u32>(b[3]); // Big-endian
            prog.push_back(w);
        }
        fclose(f);

        arrays.clear();
        active.clear();
        free_ids.clear();
        arrays.push_back(std::move(prog));
        active.push_back(1);
        pc = 0;
        halted = false;
        memset(R, 0, sizeof(R));
    }

    u32 alloc_array(u32 size) {
        size_t len = (size_t)size;
        u32 id;
        if (!free_ids.empty()) {
            id = free_ids.back(); free_ids.pop_back();
            size_t idx = (size_t)id;
            if (idx >= arrays.size()) fail("internal: recycled id out of range");
            if (active[idx])          fail("internal: recycled id still active");
            arrays[idx].assign(len, 0);
            active[idx] = 1;
        } else {
            id = (u32)arrays.size();
            arrays.emplace_back(len, 0);
            active.push_back(1);
        }
        if (id == 0) fail("internal: allocated id 0 (forbidden)");
        return id;
    }

    void free_array(u32 id) {
        if (id == 0) fail("attempt to deallocate array 0");
        size_t uid = (size_t)id;
        if (uid >= arrays.size() || !active[uid]) fail("deallocate a non-active array");
        active[uid] = 0;
        arrays[uid].clear();     
        free_ids.push_back(id);
    }

    // decoder
    //[ opcode:4 ][ ....unused/reserved.... ][ A:3 ][ B:3 ][ C:3 ]
    // 31       28 27                       9 8   6  5   3  2   0
    static inline u32 OP(u32 w) { return w >> 28 ; }
    static inline u32 A(u32 w) { return (w >> 6) & 7u; }
    static inline u32 B(u32 w) { return (w >> 3) & 7u; }
    static inline u32 C(u32 w) { return (w >> 0) & 7u; }

    void run() {
        u32 r[8]; memcpy(r, R, sizeof(R));
        size_t local_pc = pc;

        if (UNLIKELY(arrays.empty() || !active[0])) fail("program segment inactive");
        u32* prog_ptr = arrays[0].data();
        size_t prog_len = arrays[0].size();

        while (!halted) {
            if (UNLIKELY(local_pc >= prog_len)) fail("PC out of bounds");
            u32 instr = prog_ptr[local_pc++];
            u32 op = instr >> 28;

            if (op == 13) {
                // Load Value
                u32 a = (instr >> 25) & 7u;
                r[a] = instr & 0x1FFFFFFu;
                continue;
            }

            u32 a = (instr >> 6) & 7u;
            u32 b = (instr >> 3) & 7u;
            u32 c = (instr >> 0) & 7u;

            switch (op) {
                case 0: // Conditional Move
                    if (r[c] != 0) r[a] = r[b];
                    break;

                case 1: { // Array Index
                    u32 sid = r[b], off = r[c];
                    size_t uid = (size_t)sid, uoff = (size_t)off;
                    if (UNLIKELY(uid >= arrays.size() || !active[uid] || uoff >= arrays[uid].size()))
                        fail("array index out of bounds/inactive");
                    r[a] = arrays[uid][uoff];
                } break;

                case 2: { // Array Amendment
                    u32 sid = r[a], off = r[b];
                    size_t uid = (size_t)sid, uoff = (size_t)off;
                    if (UNLIKELY(uid >= arrays.size() || !active[uid] || uoff >= arrays[uid].size()))
                        fail("array amend out of bounds/inactive");
                    arrays[uid][uoff] = r[c];
                } break;

                case 3: r[a] = r[b] + r[c]; break; // Addition
                case 4: r[a] = r[b] * r[c]; break; // Multiplication
                case 5:
                    if (UNLIKELY(r[c] == 0)) fail("Division by zero");
                    r[a] = (u32)(r[b] / r[c]);
                    break;
                case 6: r[a] = ~(r[b] & r[c]); break; // Not-And
                case 7: halted = true; break;         // Halt

                case 8: { // Allocation
                    u32 id = alloc_array(r[c]);
                    r[b] = id;
                } break;

                case 9: // Deallocation
                    free_array(r[c]);
                    break;

                case 10: { // Output
                    u32 v = r[c];
                    if (UNLIKELY(v > 255u)) fail("Output value out of range");
                    putchar((unsigned char)v);
                    // no fflush here, let the OS handle it
                } break;

                case 11: { // Input
                    // before reading input, flush output buffer
                    fflush(stdout);
                    int ch = getchar();
                    r[c] = (ch == EOF) ? 0xFFFFFFFFu : (u32)(unsigned char)ch;
                } break;

                case 12: { // Load Program Segment 
                    u32 id = r[b], new_pc = r[c];
                    if (id != 0) {
                        size_t uid = (size_t)id;
                        if (UNLIKELY(uid >= arrays.size() || !active[uid]))
                            fail("load program: inactive id");
                        arrays[0] = arrays[uid];       
                    }
                    prog_ptr = arrays[0].data();
                    prog_len = arrays[0].size();
                    local_pc = (size_t)new_pc;        
                } break;

                default:
                    fail("Unknown operation code: " + to_string(op));
            }
        }

        memcpy(R, r, sizeof(R));
        pc = (u32)local_pc;
    }
};

int main(int argc, char** argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <program.um>\n", argv[0]);
        return 1;
    }

    UM um;
    um.load_program(argv[1]);
    um.run();
    return 0;
}
