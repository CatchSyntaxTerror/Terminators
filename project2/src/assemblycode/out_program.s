  .text
  .globl program
program:
  # save s-registers
  addi sp, sp, -56
  sd s1, 0(sp)
  sd s2, 8(sp)
  sd s3, 16(sp)
  sd s4, 24(sp)
  sd s5, 32(sp)
  sd s6, 40(sp)
  sd s7, 48(sp)
  mv   t2, a0
  # s1 <- input (x)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (input)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (y)
  ld   s3, 0(t2)
  addi t2, t2, 8
  # s4 <- input (z)
  ld   s4, 0(t2)
  addi t2, t2, 8
  # s5 <- input (t)
  ld   s5, 0(t2)
  addi t2, t2, 8
  # s6 <- input (i)
  ld   s6, 0(t2)
  addi t2, t2, 8
  # s7 <- input (output)
  ld   s7, 0(t2)
  addi t2, t2, 8
  j    L0

L0:
  # ℓ=0  assign
  mv   t0, s2
  mv   s1, t0
  j    L1

L1:
  # ℓ=1  assign
  mv   t0, s1
  mv   s3, t0
  j    L2

L2:
  # ℓ=2  assign
  li   t0, 1
  mv   s4, t0
  j    L3

L3:
  # ℓ=3  while
  mv   t0, s3
  mv   t1, t0
  li   t0, 1
  slt  t0, t0, t1
  beqz t0, L11   # exit
  j    L4           # true → body

L4:
  # ℓ=4  assign
  li   t0, 0
  mv   s5, t0
  j    L5

L5:
  # ℓ=5  assign
  mv   t0, s4
  mv   s6, t0
  j    L6

L6:
  # ℓ=6  while
  mv   t0, s6
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  beqz t0, L9   # exit
  j    L7           # true → body

L7:
  # ℓ=7  assign
  mv   t0, s5
  mv   t1, t0
  mv   t0, s3
  add  t0, t1, t0
  mv   s5, t0
  j    L8

L8:
  # ℓ=8  assign
  mv   t0, s6
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s6, t0
  j    L6

L9:
  # ℓ=9  assign
  mv   t0, s5
  mv   s4, t0
  j    L10

L10:
  # ℓ=10  assign
  mv   t0, s3
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s3, t0
  j    L3

L11:
  # ℓ=11  assign
  mv   t0, s4
  mv   s7, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (x) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (input) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (y) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (z) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (t) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (i) <- s6
  sd   s6, 0(t2)
  addi t2, t2, 8
  # output (output) <- s7
  sd   s7, 0(t2)
  addi t2, t2, 8
  # restore s-registers
  ld s1, 0(sp)
  ld s2, 8(sp)
  ld s3, 16(sp)
  ld s4, 24(sp)
  ld s5, 32(sp)
  ld s6, 40(sp)
  ld s7, 48(sp)
  addi sp, sp, 56
  ret
