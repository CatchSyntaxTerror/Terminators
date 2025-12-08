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
  # s2 <- input (input)
  ld   s2, 0(t2)
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  j    L0

L0:
  mv   t0, s2
  mv   s1, t0
  j    L1

L1:
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  beqz t0, L3   # exit
  j    L2           # true -> body

L2:
  mv   t0, s1
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s1, t0
  j    L1

L3:
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L5   # false -> else
  j    L4       # true -> then

L4:
  mv   t0, s2
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s2, t0
  j    L6

L5:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s2, t0
  j    L6

L6:
  mv   t0, s2
  mv   s2, t0
  j    L7

L7:
  li   t0, 0
  mv   s6, t0
  j    L8

L8:
  mv   t0, s2
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  mv   t0, s6
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L24   # exit
  j    L9           # true -> body

L9:
  li   t0, 1
  mv   s4, t0
  j    L10

L10:
  mv   t0, s4
  mv   t1, t0
  mv   t0, s4
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s2
  slt  t0, t0, t1
  xori t0, t0, 1
  beqz t0, L12   # exit
  j    L11           # true -> body

L11:
  mv   t0, s4
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s4, t0
  j    L10

L12:
  li   t0, 3
  mv   s3, t0
  j    L13

L13:
  li   t0, 0
  mv   s5, t0
  j    L14

L14:
  mv   t0, s3
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  mv   t0, s5
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L21   # exit
  j    L15           # true -> body

L15:
  mv   t0, s2
  mv   s1, t0
  j    L16

L16:
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  beqz t0, L18   # exit
  j    L17           # true -> body

L17:
  mv   t0, s1
  mv   t1, t0
  mv   t0, s3
  sub  t0, t1, t0
  mv   s1, t0
  j    L16

L18:
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L20   # false -> else
  j    L19       # true -> then

L19:
  li   t0, 1
  mv   s5, t0
  j    L14

L20:
  mv   t0, s3
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  mv   s3, t0
  j    L14

L21:
  mv   t0, s3
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  beqz t0, L23   # false -> else
  j    L22       # true -> then

L22:
  li   t0, 1
  mv   s6, t0
  j    L8

L23:
  mv   t0, s2
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s2, t0
  j    L8

L24:
  mv   t0, s2
  mv   s1, t0
  j    L25

L25:
  mv   t0, s1
  mv   s1, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (closestprime) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (i) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (input) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (j) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (mod) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (output) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (sqrt) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (stop) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (stop1) <- s6
  sd   s6, 0(t2)
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
