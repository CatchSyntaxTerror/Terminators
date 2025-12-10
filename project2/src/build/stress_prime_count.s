  .text
  .globl program
program:
  # save used s-registers
  addi sp, sp, -48
  sd   s1, 0(sp)
  sd   s2, 8(sp)
  sd   s3, 16(sp)
  sd   s4, 24(sp)
  sd   s5, 32(sp)
  sd   s6, 40(sp)
  mv   t2, a0
  addi t2, t2, 8
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
  mv   t0, s2
  mv   s2, t0
  j    L3

L3:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  slt  t0, t0, t1
  beqz t0, L19   # exit
  j    L4           # true -> body

L4:
  li   t0, 1
  mv   s5, t0
  j    L5

L5:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s3, t0
  j    L6

L6:
  mv   t0, s3
  mv   t1, t0
  li   t0, 1
  slt  t0, t0, t1
  beqz t0, L15   # exit
  j    L7           # true -> body

L7:
  mv   t0, s2
  mv   s6, t0
  j    L8

L8:
  mv   t0, s3
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s4, t0
  j    L9

L9:
  mv   t0, s6
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  beqz t0, L11   # exit
  j    L10           # true -> body

L10:
  mv   t0, s6
  mv   t1, t0
  mv   t0, s3
  sub  t0, t1, t0
  mv   s6, t0
  j    L9

L11:
  mv   t0, s6
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L13   # false -> else
  j    L12       # true -> then

L12:
  li   t0, 0
  mv   s5, t0
  j    L14

L13:
  j    L14

L14:
  mv   t0, s3
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s3, t0
  j    L6

L15:
  mv   t0, s5
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L17   # false -> else
  j    L16       # true -> then

L16:
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s1, t0
  j    L18

L17:
  j    L18

L18:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s2, t0
  j    L3

L19:
  mv   t0, s1
  mv   s1, t0
  j    L_end

L_end:
  mv   t2, a0
  # skip dead-at-exit: c
  addi t2, t2, 8
  # skip dead-at-exit: count
  addi t2, t2, 8
  # skip dead-at-exit: d
  addi t2, t2, 8
  # skip dead-at-exit: dm1
  addi t2, t2, 8
  # skip dead-at-exit: input
  addi t2, t2, 8
  # skip dead-at-exit: isprime
  addi t2, t2, 8
  # skip dead-at-exit: n
  addi t2, t2, 8
  # exit-live (output) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # skip dead-at-exit: rem
  addi t2, t2, 8
  # restore used s-registers
  ld   s1, 0(sp)
  ld   s2, 8(sp)
  ld   s3, 16(sp)
  ld   s4, 24(sp)
  ld   s5, 32(sp)
  ld   s6, 40(sp)
  addi sp, sp, 48
  ret
