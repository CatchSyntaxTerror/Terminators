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

L1:
  li   t0, 0
  mv   s1, t0

L2:
  li   t0, 1
  mv   s4, t0

L3:
  li   t0, 2
  mv   s5, t0

L4:
  li   t0, 0
  mv   s3, t0

L5:
  mv   t0, s1
  mv   t1, t0
  mv   t0, s2
  slt  t0, t1, t0
  beqz t0, L12   # exit
  j    L6           # true -> body

L6:

L7:

L8:

L9:

L10:
  mv   t0, s3
  mv   t1, t0
  mv   t0, s4
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s5
  add  t0, t1, t0
  mv   s3, t0

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
  # skip dead-at-exit: i
  addi t2, t2, 8
  # skip dead-at-exit: input
  addi t2, t2, 8
  # skip dead-at-exit: junk1
  addi t2, t2, 8
  # skip dead-at-exit: junk2
  addi t2, t2, 8
  # skip dead-at-exit: junk3
  addi t2, t2, 8
  # skip dead-at-exit: junk4
  addi t2, t2, 8
  # skip dead-at-exit: n
  addi t2, t2, 8
  # exit-live (output) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # skip dead-at-exit: sum
  addi t2, t2, 8
  # skip dead-at-exit: x
  addi t2, t2, 8
  # skip dead-at-exit: y
  addi t2, t2, 8
  # restore used s-registers
  ld   s1, 0(sp)
  ld   s2, 8(sp)
  ld   s3, 16(sp)
  ld   s4, 24(sp)
  ld   s5, 32(sp)
  addi sp, sp, 40
  ret
