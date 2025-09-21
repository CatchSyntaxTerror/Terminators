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
    u32 R[8] = {0};                // Registers
    std::vector<Segment> arrays;   // Memory segments
    std::vector<u32> free_ids;     // Reusable segment IDs
    u32 pc = 0;                    // Program counter
    bool halted = false;           // Halt flag

    [[noreturn]] void fail(const string& msg) {
        std::fprintf(stderr, "UM Fail: %s\n", msg.c_str());
        std::exit(1);
    }

    static inline Segment make_segment(size_t n) {
        Segment s;
        s.data = (u32*)std::calloc(n ? n : 1, sizeof(u32)); // zero-filled
        if (!s.data && n) { std::fprintf(stderr,"OOM\n"); std::abort(); }
        s.len  = (u32)n;
        s.active = 1;
        return s;
    }

    void load_program(const string& path) {
        FILE* f = std::fopen(path.c_str(), "rb");
        if (!f) fail("cannot open program file: " + path);

        std::vector<u32> prog;
        prog.reserve(1<<16);
        unsigned char b[4];
        for (;;) {
            size_t got = std::fread(b, 1, 4, f);
            if (got == 0) break;
            if (got != 4) { std::fclose(f); fail("program file size not divisible by 4"); }
            u32 w = (u32(b[0])<<24) | (u32(b[1])<<16) | (u32(b[2])<<8) | (u32)b[3];
            prog.push_back(w);
        }
        std::fclose(f);

        for (auto& s : arrays) { if (s.data) std::free(s.data); s = {}; }
        arrays.clear();
        free_ids.clear();

        Segment s0;
        s0.data = (u32*)std::malloc(prog.size()*sizeof(u32));
        if (!s0.data && !prog.empty()) { std::fprintf(stderr,"OOM\n"); std::abort(); }
        if (!prog.empty()) std::memcpy(s0.data, prog.data(), prog.size()*sizeof(u32));
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

    // decoding helpers
    static inline u32 OP(u32 w)  { return w >> 28; }
    static inline u32 A13(u32 w) { return (w >> 25) & 7u; } // for op=13
    static inline u32 Aa (u32 w) { return (w >> 6)  & 7u; }
    static inline u32 Bb (u32 w) { return (w >> 3)  & 7u; }
    static inline u32 Cc (u32 w) { return (w >> 0)  & 7u; }

    void run() {
        u32 r[8]; std::memcpy(r, R, sizeof(R));
        size_t local_pc = pc;

        if (UNLIKELY(arrays.empty() || !arrays[0].active)) fail("program segment inactive");
        u32*   prog_ptr = arrays[0].data;
        size_t prog_len = arrays[0].len;

#if defined(__GNUC__)
        // computed-goto jump table
        static void* jt[14] = {
            &&L0, &&L1, &&L2, &&L3, &&L4, &&L5, &&L6, &&L7,
            &&L8, &&L9, &&L10, &&L11, &&L12, &&L13
        };
#       define DISPATCH() do { \
            if (UNLIKELY(local_pc >= prog_len)) fail("PC out of bounds"); \
            instr = prog_ptr[local_pc++]; \
            goto *jt[instr >> 28]; \
        } while (0)

        u32 instr = 0;
        DISPATCH();

L13: { // Load Value
            r[A13(instr)] = (instr & 0x1FFFFFFu);
            DISPATCH();
        }
L0:  { // Conditional Move
            u32 a=Aa(instr), b=Bb(instr), c=Cc(instr);
            if (r[c]) r[a]=r[b];
            DISPATCH();
        }
L1:  { // Array Index
            u32 a=Aa(instr), b=Bb(instr), c=Cc(instr);
            u32 sid=r[b], off=r[c];
            if (UNLIKELY(sid>=arrays.size())) fail("array index: seg id out of range");
            Segment& s = arrays[sid];
            if (UNLIKELY(!s.active || off>=s.len)) fail("array index out of bounds/inactive");
            r[a]=s.data[off];
            DISPATCH();
        }
L2:  { // Array Amendment
            u32 a=Aa(instr), b=Bb(instr), c=Cc(instr);
            u32 sid=r[a], off=r[b];
            if (UNLIKELY(sid>=arrays.size())) fail("array amend: seg id out of range");
            Segment& s = arrays[sid];
            if (UNLIKELY(!s.active || off>=s.len)) fail("array amend out of bounds/inactive");
            s.data[off]=r[c];
            DISPATCH();
        }
L3:  { // Addition
            u32 a=Aa(instr), b=Bb(instr), c=Cc(instr);
            r[a]=r[b]+r[c];
            DISPATCH();
        }
L4:  { // Multiplication
            u32 a=Aa(instr), b=Bb(instr), c=Cc(instr);
            r[a]=r[b]*r[c];
            DISPATCH();
        }
L5:  { // Division
            u32 a=Aa(instr), b=Bb(instr), c=Cc(instr);
            if (UNLIKELY(r[c]==0)) fail("Division by zero");
            r[a]=(u32)(r[b]/r[c]);
            DISPATCH();
        }
L6:  { // NAND
            u32 a=Aa(instr), b=Bb(instr), c=Cc(instr);
            r[a]=~(r[b]&r[c]);
            DISPATCH();
        }
L7:  { // Halt
            halted = true;
            goto END;
        }
L8:  { // Allocation
            u32 b=Bb(instr), c=Cc(instr);
            r[b]=alloc_array(r[c]);
            DISPATCH();
        }
L9:  { // Abandonment
            u32 c=Cc(instr);
            free_array(r[c]);
            DISPATCH();
        }
L10: { // Output
            u32 c=Cc(instr);
            u32 v=r[c];
            if (UNLIKELY(v>255u)) fail("Output value out of range");
            putchar((unsigned char)v);
            DISPATCH();
        }
L11: { // Input
            u32 c=Cc(instr);
            int ch = getchar();
            r[c]=(ch==EOF)?0xFFFFFFFFu:(u32)(unsigned char)ch;
            DISPATCH();
        }
L12: { // Load Program
            u32 b=Bb(instr), c=Cc(instr);
            u32 id=r[b], new_pc=r[c];
            if (id!=0) {
                if (UNLIKELY(id>=arrays.size() || !arrays[id].active))
                    fail("load program: inactive id");
                Segment& src = arrays[id];
                if (arrays[0].data) std::free(arrays[0].data);
                arrays[0].data = (u32*)std::malloc(src.len*sizeof(u32));
                if (!arrays[0].data && src.len) { std::fprintf(stderr,"OOM\n"); std::abort(); }
                if (src.len) std::memcpy(arrays[0].data, src.data, src.len*sizeof(u32));
                arrays[0].len   = src.len;
                arrays[0].active= 1;
                prog_ptr = arrays[0].data;
                prog_len = arrays[0].len;
            }
            local_pc = (size_t)new_pc;
            DISPATCH();
        }

END:
        std::memcpy(R, r, sizeof(R));
        pc = (u32)local_pc;

#else
        // switch-based fallback
        while (!halted) {
            if (UNLIKELY(local_pc >= prog_len)) fail("PC out of bounds");
            u32 instr = prog_ptr[local_pc++];
            u32 op = instr >> 28;

            if (op == 13) { R[A13(instr)] = (instr & 0x1FFFFFFu); continue; }

            u32 a=Aa(instr), b=Bb(instr), c=Cc(instr);
            switch (op) {
                case 0: if (R[c]) R[a]=R[b]; break;
                case 1: {
                    u32 sid=R[b], off=R[c];
                    if (UNLIKELY(sid>=arrays.size())) fail("array index: seg id OOR");
                    Segment& s=arrays[sid];
                    if (UNLIKELY(!s.active||off>=s.len)) fail("array index OOB/inactive");
                    R[a]=s.data[off];
                } break;
                case 2: {
                    u32 sid=R[a], off=R[b];
                    if (UNLIKELY(sid>=arrays.size())) fail("array amend: seg id OOR");
                    Segment& s=arrays[sid];
                    if (UNLIKELY(!s.active||off>=s.len)) fail("array amend OOB/inactive");
                    s.data[off]=R[c];
                } break;
                case 3: R[a]=R[b]+R[c]; break;
                case 4: R[a]=R[b]*R[c]; break;
                case 5: if (UNLIKELY(R[c]==0)) fail("Division by zero"); R[a]=R[b]/R[c]; break;
                case 6: R[a]=~(R[b]&R[c]); break;
                case 7: halted=true; break;
                case 8: R[b]=alloc_array(R[c]); break;
                case 9: free_array(R[c]); break;
                case 10:{
                    u32 v=R[c];
                    if (UNLIKELY(v>255u)) fail("Output value out of range");
                    putchar((unsigned char)v);
                } break;
                case 11:{
                    int ch=getchar();
                    R[c]=(ch==EOF)?0xFFFFFFFFu:(u32)(unsigned char)ch;
                } break;
                case 12:{
                    u32 id=R[b], new_pc=R[c];
                    if (id!=0){
                        if (UNLIKELY(id>=arrays.size()||!arrays[id].active))
                            fail("load program inactive");
                        Segment& src=arrays[id];
                        if (arrays[0].data) std::free(arrays[0].data);
                        arrays[0].data=(u32*)std::malloc(src.len*sizeof(u32));
                        if (!arrays[0].data && src.len) { std::fprintf(stderr,"OOM\n"); std::abort(); }
                        if (src.len) std::memcpy(arrays[0].data, src.data, src.len*sizeof(u32));
                        arrays[0].len=src.len; arrays[0].active=1;
                        prog_ptr=arrays[0].data; prog_len=arrays[0].len;
                    }
                    local_pc=new_pc;
                } break;
                default: fail("Unknown opcode");
            }
        }
        std::memcpy(R, R, sizeof(R)); // (we could just leave R as-is)
        pc = (u32)local_pc;
#endif
    }
};

int main(int argc, char** argv) {
    if (argc != 2) {
        std::fprintf(stderr, "Usage: %s <program.um>\n", argv[0]);
        return 1;
    }
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    UM um;
    um.load_program(argv[1]);
    um.run();
    return 0;
}
