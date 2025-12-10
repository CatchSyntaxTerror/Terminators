  .text
  .globl program
program:
  # save s-registers
  addi sp, sp, -40
  sd s1, 0(sp)
  sd s2, 8(sp)
  sd s3, 16(sp)
  sd s4, 24(sp)
  sd s5, 32(sp)
  mv   t2, a0
  # s1 <- input (a)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (input)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (b)
  ld   s3, 0(t2)
  addi t2, t2, 8
  # s4 <- input (input2)
  ld   s4, 0(t2)
  addi t2, t2, 8
  # s5 <- input (output)
  ld   s5, 0(t2)
  addi t2, t2, 8
  j    L0

L0:
  # ℓ=0  assign
  mv   t0, s2
  mv   s1, t0

L1:
  # ℓ=1  assign
  mv   t0, s4
  mv   s3, t0

L2:
  # ℓ=2  while
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  xori t0, t0, 1
  beqz t0, L6   # exit
  j    L3           # true → body

L3:
  # ℓ=3  if
  mv   t0, s1
  mv   t1, t0
  mv   t0, s3
  slt  t0, t1, t0
  xori t0, t0, 1
  beqz t0, L5   # false → else
  j    L4       # true → then

L4:
  # ℓ=4  assign
  mv   t0, s1
  mv   t1, t0
  mv   t0, s3
  sub  t0, t1, t0
  mv   s1, t0
  j    L2

L5:
  # ℓ=5  assign
  mv   t0, s3
  mv   t1, t0
  mv   t0, s1
  sub  t0, t1, t0
  mv   s3, t0
  j    L2

L6:
  # ℓ=6  assign
  mv   t0, s3
  mv   s5, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (a) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (input) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (b) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (input2) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (output) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # restore s-registers
  ld s1, 0(sp)
  ld s2, 8(sp)
  ld s3, 16(sp)
  ld s4, 24(sp)
  ld s5, 32(sp)
  addi sp, sp, 40
  ret
