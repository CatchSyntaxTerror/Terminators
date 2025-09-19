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

struct Segment {
    u32* data = nullptr;
    u32  len  = 0;
    uint8_t active = 0;
};

struct UM {

    u32 R[8] = {0};                 // Registers
    std::vector<Segment> arrays;      // Memory segments //vector<vector<u32>> 每次索引都要解两层结构；还牵扯 capacity/size 语义。换成自管内存的段，元数据紧凑放在一起，访问更快。
    vector<u32> free_ids;            // Reusable segment IDs
    u32 pc = 0;                      // Program counter
    bool halted = false;             // Halt flag
    vector<uint8_t> active;          // Active
    static constexpr size_t OUTBUF_SIZE = 1 << 16; // 64KB
    unsigned out_sz = 0;
    unsigned char out_buf[OUTBUF_SIZE];

    [[noreturn]] void fail(const string& msg) {
        fprintf(stderr, "UM Fail: %s\n", msg.c_str());
        exit(1);
    }

    inline void out_byte(unsigned v) {
        out_buf[out_sz++] = (unsigned char)v;
        if (UNLIKELY(out_sz == OUTBUF_SIZE)) {
            size_t n = fwrite(out_buf, 1, out_sz, stdout);
            if (n != out_sz) fail("output error");
            out_sz = 0;
        }
    }

    static inline Segment make_segment(size_t n) {
        Segment s;
        s.data = (u32*)std::calloc(n ? n : 1, sizeof(u32)); // 零填充
        if (!s.data) { std::fprintf(stderr,"OOM\n"); std::abort(); }
        s.len  = (u32)n;
        s.active = 1;
        return s;
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
            u32 w = (u32(b[0])<<24) | (u32(b[1])<<16) | (u32(b[2])<<8) | (u32)b[3];
            prog.push_back(w);
        }
        fclose(f);

        for (auto& s : arrays) { if (s.data) std::free(s.data); s = {}; }
        arrays.clear();
        free_ids.clear();

        Segment s0;
        s0.data = (u32*)std::malloc(prog.size()*sizeof(u32));
        if (!s0.data) { std::fprintf(stderr,"OOM\n"); std::abort(); }
        std::memcpy(s0.data, prog.data(), prog.size()*sizeof(u32));
        s0.len = (u32)prog.size();
        s0.active = 1;
        arrays.push_back(s0);

        pc = 0;
        halted = false;
        std::memset(R, 0, sizeof(R));
    }

    u32 alloc_array(u32 size) {
        size_t n = (size_t)size;
        u32 id;
        if (!free_ids.empty()) {
            id = free_ids.back(); free_ids.pop_back();
            if (id >= arrays.size() || arrays[id].active) fail("recycled id still active");
            if (arrays[id].data) { std::free(arrays[id].data); arrays[id].data = nullptr; }
            arrays[id] = make_segment(n);
        } else {
            id = (u32)arrays.size();
            arrays.push_back(make_segment(n));
        }
        if (id == 0) fail("internal: allocated id 0 (forbidden)");
        return id;
    }

    void free_array(u32 id) {
        if (id == 0) fail("attempt to deallocate array 0");
        if (id >= arrays.size() || !arrays[id].active) fail("deallocate a non-active array");
        arrays[id].active = 0;
        if (arrays[id].data) { std::free(arrays[id].data); arrays[id].data = nullptr; }
        arrays[id].len = 0;
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
        struct Decoded {
            uint8_t op, a, b, c;
            u32 imm;  // 仅 op==13 有效
        };

        u32 r[8]; std::memcpy(r, R, sizeof(R));
        size_t local_pc = pc;

        if (UNLIKELY(arrays.empty() || !arrays[0].active)) fail("program segment inactive");
        u32*   prog_ptr = arrays[0].data;
        size_t prog_len = arrays[0].len;

        // 预解码表（局部）
        std::vector<Decoded> dprog;
        dprog.resize(prog_len);

        auto decode_prog = [&](u32* code, size_t len) {
            dprog.resize(len);
            for (size_t i = 0; i < len; ++i) {
                u32 w  = code[i];
                uint8_t op = (uint8_t)(w >> 28);
                Decoded d; d.op = op;
                if (op == 13) {                  // Orthography / Load Value
                    d.a   = (uint8_t)((w >> 25) & 7u);
                    d.b   = 0; d.c = 0;
                    d.imm = (w & 0x1FFFFFFu);
                } else {
                    d.a   = (uint8_t)((w >> 6) & 7u);
                    d.b   = (uint8_t)((w >> 3) & 7u);
                    d.c   = (uint8_t)( w       & 7u);
                    d.imm = 0;
                }
                dprog[i] = d;
            }
        };

        // 初次预解码
        decode_prog(prog_ptr, prog_len);
        Decoded* dp = dprog.data();

        while (!halted) {
            if (UNLIKELY(local_pc >= prog_len)) fail("PC out of bounds");
            const Decoded& d = dp[local_pc++];

            switch (d.op) {
                case 13: { // Orthography / Load Value
                    r[d.a] = d.imm;
                } break;

                case 0: { // Conditional Move
                    if (r[d.c] != 0) r[d.a] = r[d.b];
                } break;

                case 1: { // Array Index (sload)
                    u32 sid = r[d.b], off = r[d.c];
                    if (UNLIKELY(sid >= arrays.size())) fail("array index: seg id OOB");
                    Segment& s = arrays[sid];
                    if (UNLIKELY(!s.active || off >= s.len)) fail("array index out of bounds/inactive");
                    r[d.a] = s.data[off];
                } break;

                case 2: { // Array Amendment (sstore)
                    u32 sid = r[d.a], off = r[d.b];
                    if (UNLIKELY(sid >= arrays.size())) fail("array amend: seg id OOB");
                    Segment& s = arrays[sid];
                    if (UNLIKELY(!s.active || off >= s.len)) fail("array amend out of bounds/inactive");
                    s.data[off] = r[d.c];
                } break;

                case 3: { // Addition
                    r[d.a] = r[d.b] + r[d.c];
                } break;

                case 4: { // Multiplication
                    r[d.a] = r[d.b] * r[d.c];
                } break;

                case 5: { // Division
                    if (UNLIKELY(r[d.c] == 0)) fail("Division by zero");
                    r[d.a] = (u32)(r[d.b] / r[d.c]);
                } break;

                case 6: { // NAND
                    r[d.a] = ~(r[d.b] & r[d.c]);
                } break;

                case 7: { // Halt
                    halted = true;
                } break;

                case 8: { // Allocation
                    u32 id = alloc_array(r[d.c]);
                    r[d.b] = id;
                } break;

                case 9: { // Abandonment (deallocation)
                    free_array(r[d.c]);
                } break;

                case 10: { // Output
                    u32 v = r[d.c];
                    if (UNLIKELY(v > 255u)) fail("Output value out of range");
                    out_byte(v);
                } break;

                case 11: { // Input
                    int ch = getchar();
                    r[d.c] = (ch == EOF) ? 0xFFFFFFFFu : (u32)(unsigned char)ch;
                } break;

                case 12: { // Load Program
                    u32 id = r[d.b], new_pc = r[d.c];
                    if (id != 0) {
                        if (UNLIKELY(id >= arrays.size() || !arrays[id].active))
                            fail("load program: inactive id");
                        Segment& src = arrays[id];
                        if (arrays[0].data) std::free(arrays[0].data);
                        arrays[0].data = (u32*)std::malloc(src.len * sizeof(u32));
                        if (!arrays[0].data) { std::fprintf(stderr,"OOM\n"); std::abort(); }
                        std::memcpy(arrays[0].data, src.data, src.len * sizeof(u32));
                        arrays[0].len = src.len;
                        arrays[0].active = 1;

                        // 更新代码指针
                        prog_ptr = arrays[0].data;
                        prog_len = arrays[0].len;

                        // 关键：重建预解码表
                        decode_prog(prog_ptr, prog_len);
                        dp = dprog.data();
                    }
                    local_pc = (size_t)new_pc;
                } break;

                default:
                    fail("Unknown operation code: " + std::to_string(d.op));
            }
        }

        // flush 输出缓冲
        if (out_sz) {
            size_t n = fwrite(out_buf, 1, out_sz, stdout);
            if (n != out_sz) fail("output error");
            out_sz = 0;
        }

        std::memcpy(R, r, sizeof(R));
        pc = (u32)local_pc;
    }
};

int main(int argc, char** argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <program.um>\n", argv[0]);
        return 1;
    }
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    UM um;
    um.load_program(argv[1]);
    um.run();
    return 0;
}
