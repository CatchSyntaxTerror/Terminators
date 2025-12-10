  .text
  .globl program
program:
  # save s-registers
  addi sp, sp, -88
  sd s1, 0(sp)
  sd s2, 8(sp)
  sd s3, 16(sp)
  sd s4, 24(sp)
  sd s5, 32(sp)
  sd s6, 40(sp)
  sd s7, 48(sp)
  sd s8, 56(sp)
  sd s9, 64(sp)
  sd s10, 72(sp)
  sd s11, 80(sp)
  mv   t2, a0
  # s1 <- input (n)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (input)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (i)
  ld   s3, 0(t2)
  addi t2, t2, 8
  # s4 <- input (x)
  ld   s4, 0(t2)
  addi t2, t2, 8
  # s5 <- input (y)
  ld   s5, 0(t2)
  addi t2, t2, 8
  # s6 <- input (sum)
  ld   s6, 0(t2)
  addi t2, t2, 8
  # s7 <- input (junk1)
  ld   s7, 0(t2)
  addi t2, t2, 8
  # s8 <- input (junk2)
  ld   s8, 0(t2)
  addi t2, t2, 8
  # s9 <- input (junk3)
  ld   s9, 0(t2)
  addi t2, t2, 8
  # s10 <- input (junk4)
  ld   s10, 0(t2)
  addi t2, t2, 8
  # s11 <- input (output)
  ld   s11, 0(t2)
  addi t2, t2, 8
  j    L0

L0:
  # ℓ=0  assign
  mv   t0, s2
  mv   s1, t0

L1:
  # ℓ=1  assign
  li   t0, 0
  mv   s3, t0

L2:
  # ℓ=2  assign
  li   t0, 1
  mv   s4, t0

L3:
  # ℓ=3  assign
  li   t0, 2
  mv   s5, t0

L4:
  # ℓ=4  assign
  li   t0, 0
  mv   s6, t0

L5:
  # ℓ=5  while
  mv   t0, s3
  mv   t1, t0
  mv   t0, s1
  slt  t0, t1, t0
  beqz t0, L12   # exit
  j    L6           # true → body

L6:
  # ℓ=6  assign
  mv   t0, s4
  mv   t1, t0
  mv   t0, s4
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s5
  mv   t1, t0
  mv   t0, s5
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s3
  mv   t1, t0
  mv   t0, s3
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s7, t0

L7:
  # ℓ=7  assign
  mv   t0, s4
  mv   t1, t0
  mv   t0, s5
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s3
  add  t0, t1, t0
  mv   s8, t0

L8:
  # ℓ=8  assign
  mv   t0, s4
  mv   t1, t0
  mv   t0, s5
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 1234
  add  t0, t1, t0
  mv   s9, t0

L9:
  # ℓ=9  assign
  mv   t0, s4
  mv   t1, t0
  mv   t0, s4
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s5
  mv   t1, t0
  mv   t0, s5
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s5
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s10, t0

L10:
  # ℓ=10  assign
  mv   t0, s6
  mv   t1, t0
  mv   t0, s4
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s5
  add  t0, t1, t0
  mv   s6, t0

L11:
  # ℓ=11  assign
  mv   t0, s3
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s3, t0
  j    L5

L12:
  # ℓ=12  assign
  mv   t0, s6
  mv   s11, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (n) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (input) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (i) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (x) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (y) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (sum) <- s6
  sd   s6, 0(t2)
  addi t2, t2, 8
  # output (junk1) <- s7
  sd   s7, 0(t2)
  addi t2, t2, 8
  # output (junk2) <- s8
  sd   s8, 0(t2)
  addi t2, t2, 8
  # output (junk3) <- s9
  sd   s9, 0(t2)
  addi t2, t2, 8
  # output (junk4) <- s10
  sd   s10, 0(t2)
  addi t2, t2, 8
  # output (output) <- s11
  sd   s11, 0(t2)
  addi t2, t2, 8
  # restore s-registers
  ld s1, 0(sp)
  ld s2, 8(sp)
  ld s3, 16(sp)
  ld s4, 24(sp)
  ld s5, 32(sp)
  ld s6, 40(sp)
  ld s7, 48(sp)
  ld s8, 56(sp)
  ld s9, 64(sp)
  ld s10, 72(sp)
  ld s11, 80(sp)
  addi sp, sp, 88
  ret
