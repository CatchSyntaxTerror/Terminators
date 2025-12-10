  .text
  .globl program
program:
  # save used s-registers
  addi sp, sp, -24
  sd   s1, 0(sp)
  sd   s2, 8(sp)
  sd   s3, 16(sp)
  mv   t2, a0
  addi t2, t2, 8
  addi t2, t2, 8
  # s1 <- input (input)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (input2)
  ld   s2, 0(t2)
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  j    L0

L0:
  mv   t0, s1
  mv   s1, t0
  j    L1

L1:
  mv   t0, s2
  mv   s2, t0
  j    L2

L2:
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  xori t0, t0, 1
  beqz t0, L8   # exit
  j    L3           # true -> body

L3:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s1
  slt  t0, t1, t0
  xori t0, t0, 1
  beqz t0, L5   # exit
  j    L4           # true -> body

L4:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s1
  sub  t0, t1, t0
  mv   s2, t0
  j    L3

L5:
  mv   t0, s1
  mv   s3, t0
  j    L6

L6:
  mv   t0, s2
  mv   s1, t0
  j    L7

L7:
  mv   t0, s3
  mv   s2, t0
  j    L2

L8:
  mv   t0, s2
  mv   s1, t0
  j    L_end

L_end:
  mv   t2, a0
  # skip dead-at-exit: a
  addi t2, t2, 8
  # skip dead-at-exit: b
  addi t2, t2, 8
  # skip dead-at-exit: input
  addi t2, t2, 8
  # skip dead-at-exit: input2
  addi t2, t2, 8
  # exit-live (output) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # skip dead-at-exit: t
  addi t2, t2, 8
  # restore used s-registers
  ld   s1, 0(sp)
  ld   s2, 8(sp)
  ld   s3, 16(sp)
  addi sp, sp, 24
  ret
