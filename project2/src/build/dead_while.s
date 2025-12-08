  .text
  .globl program
program:
  # save used s-registers
  addi sp, sp, -40
  sd   s1, 0(sp)
  sd   s2, 8(sp)
  sd   s3, 16(sp)
  sd   s4, 24(sp)
  sd   s5, 32(sp)
  mv   t2, a0
  addi t2, t2, 8
  # s1 <- input (input)
  ld   s1, 0(t2)
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  j    L0

L0:
  mv   t0, s1
  mv   s2, t0
  j    L1

L1:
  li   t0, 0
  mv   s1, t0
  j    L2

L2:
  li   t0, 1
  mv   s4, t0
  j    L3

L3:
  li   t0, 2
  mv   s5, t0
  j    L4

L4:
  li   t0, 0
  mv   s3, t0
  j    L5

L5:
  mv   t0, s1
  mv   t1, t0
  mv   t0, s2
  slt  t0, t1, t0
  beqz t0, L12   # exit
  j    L6           # true -> body

L6:
  j    L7

L7:
  j    L8

L8:
  j    L9

L9:
  j    L10

L10:
  mv   t0, s3
  mv   t1, t0
  mv   t0, s4
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s5
  add  t0, t1, t0
  mv   s3, t0
  j    L11

L11:
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s1, t0
  j    L5

L12:
  mv   t0, s3
  mv   s1, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (i) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (input) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (junk1) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (junk2) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (junk3) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (junk4) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (n) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (output) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (sum) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (x) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (y) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # restore used s-registers
  ld   s1, 0(sp)
  ld   s2, 8(sp)
  ld   s3, 16(sp)
  ld   s4, 24(sp)
  ld   s5, 32(sp)
  addi sp, sp, 40
  ret
