  .text
  .globl program
program:
  # save s-registers
  addi sp, sp, -48
  sd s1, 0(sp)
  sd s2, 8(sp)
  sd s3, 16(sp)
  sd s4, 24(sp)
  sd s5, 32(sp)
  sd s6, 40(sp)
  mv   t2, a0
  # s1 <- input (i)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (input)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (j)
  ld   s3, 0(t2)
  addi t2, t2, 8
  # s4 <- input (sum)
  ld   s4, 0(t2)
  addi t2, t2, 8
  # s5 <- input (k)
  ld   s5, 0(t2)
  addi t2, t2, 8
  # s6 <- input (output)
  ld   s6, 0(t2)
  addi t2, t2, 8
  j    L0

L0:
  # ℓ=0  assign
  mv   t0, s2
  mv   s1, t0
  j    L1

L1:
  # ℓ=1  assign
  mv   t0, s2
  mv   s3, t0
  j    L2

L2:
  # ℓ=2  assign
  li   t0, 0
  mv   s4, t0
  j    L3

L3:
  # ℓ=3  while
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  beqz t0, L9   # exit
  j    L4           # true → body

L4:
  # ℓ=4  assign
  mv   t0, s3
  mv   s5, t0
  j    L5

L5:
  # ℓ=5  while
  mv   t0, s5
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  beqz t0, L8   # exit
  j    L6           # true → body

L6:
  # ℓ=6  assign
  mv   t0, s4
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s4, t0
  j    L7

L7:
  # ℓ=7  assign
  mv   t0, s5
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s5, t0
  j    L5

L8:
  # ℓ=8  assign
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s1, t0
  j    L3

L9:
  # ℓ=9  assign
  mv   t0, s4
  mv   s6, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (i) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (input) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (j) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (sum) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (k) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (output) <- s6
  sd   s6, 0(t2)
  addi t2, t2, 8
  # restore s-registers
  ld s1, 0(sp)
  ld s2, 8(sp)
  ld s3, 16(sp)
  ld s4, 24(sp)
  ld s5, 32(sp)
  ld s6, 40(sp)
  addi sp, sp, 48
  ret
