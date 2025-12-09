  .text
  .globl program
program:
  # save used s-registers
  addi sp, sp, -32
  sd   s1, 0(sp)
  sd   s2, 8(sp)
  sd   s3, 16(sp)
  sd   s4, 24(sp)
  mv   t2, a0
  addi t2, t2, 8
  addi t2, t2, 8
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
  j    L0

L0:
  mv   t0, s1
  mv   s3, t0
  j    L1

L1:
  mv   t0, s3
  mv   s1, t0
  j    L2

L2:
  j    L3

L3:
  li   t0, 0
  mv   s2, t0
  j    L4

L4:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s3
  slt  t0, t1, t0
  beqz t0, L15   # exit
  j    L5           # true -> body

L5:
  j    L6

L6:
  j    L7

L7:
  j    L8

L8:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  slt  t0, t0, t1
  beqz t0, L10   # false -> else
  j    L9       # true -> then

L9:
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s1, t0
  j    L11

L10:
  j    L11

L11:
  mv   t0, s1
  mv   t1, t0
  mv   t0, s1
  add  t0, t1, t0
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s4, t0
  j    L12

L12:
  j    L13

L13:
  mv   t0, s4
  mv   s1, t0
  j    L14

L14:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s2, t0
  j    L4

L15:
  mv   t0, s1
  mv   s1, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (a) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (b) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (i) <- s2
  sd   s2, 0(t2)
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
  # output (n) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (next) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (output) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # restore used s-registers
  ld   s1, 0(sp)
  ld   s2, 8(sp)
  ld   s3, 16(sp)
  ld   s4, 24(sp)
  addi sp, sp, 32
  ret
