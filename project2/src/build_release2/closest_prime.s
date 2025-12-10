  .text
  .globl program
program:
  # save s-registers
  addi sp, sp, -72
  sd s1, 0(sp)
  sd s2, 8(sp)
  sd s3, 16(sp)
  sd s4, 24(sp)
  sd s5, 32(sp)
  sd s6, 40(sp)
  sd s7, 48(sp)
  sd s8, 56(sp)
  sd s9, 64(sp)
  mv   t2, a0
  # s1 <- input (mod)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (input)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (i)
  ld   s3, 0(t2)
  addi t2, t2, 8
  # s4 <- input (stop1)
  ld   s4, 0(t2)
  addi t2, t2, 8
  # s5 <- input (sqrt)
  ld   s5, 0(t2)
  addi t2, t2, 8
  # s6 <- input (j)
  ld   s6, 0(t2)
  addi t2, t2, 8
  # s7 <- input (stop)
  ld   s7, 0(t2)
  addi t2, t2, 8
  # s8 <- input (closestprime)
  ld   s8, 0(t2)
  addi t2, t2, 8
  # s9 <- input (output)
  ld   s9, 0(t2)
  addi t2, t2, 8
  j    L0

L0:
  # ℓ=0  assign
  mv   t0, s2
  mv   s1, t0

L1:
  # ℓ=1  while
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  addi sp, sp, -8
  sd   t0, 0(sp)
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  ld   t1, 0(sp)
  addi sp, sp, 8
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  beqz t0, L3   # exit
  j    L2           # true → body

L2:
  # ℓ=2  assign
  mv   t0, s1
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s1, t0
  j    L1

L3:
  # ℓ=3  if
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L5   # false → else
  j    L4       # true → then

L4:
  # ℓ=4  assign
  mv   t0, s2
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s2, t0
  j    L6

L5:
  # ℓ=5  assign
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s2, t0

L6:
  # ℓ=6  assign
  mv   t0, s2
  mv   s3, t0

L7:
  # ℓ=7  assign
  li   t0, 0
  mv   s4, t0

L8:
  # ℓ=8  while
  mv   t0, s3
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  snez t0, t0
  addi sp, sp, -8
  sd   t0, 0(sp)
  mv   t0, s4
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  ld   t1, 0(sp)
  addi sp, sp, 8
  and  t0, t1, t0
  beqz t0, L24   # exit
  j    L9           # true → body

L9:
  # ℓ=9  assign
  li   t0, 1
  mv   s5, t0

L10:
  # ℓ=10  while
  mv   t0, s5
  mv   t1, t0
  mv   t0, s5
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s3
  slt  t0, t0, t1
  xori t0, t0, 1
  beqz t0, L12   # exit
  j    L11           # true → body

L11:
  # ℓ=11  assign
  mv   t0, s5
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s5, t0
  j    L10

L12:
  # ℓ=12  assign
  li   t0, 3
  mv   s6, t0

L13:
  # ℓ=13  assign
  li   t0, 0
  mv   s7, t0

L14:
  # ℓ=14  while
  mv   t0, s6
  mv   t1, t0
  mv   t0, s5
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  addi sp, sp, -8
  sd   t0, 0(sp)
  mv   t0, s7
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  ld   t1, 0(sp)
  addi sp, sp, 8
  and  t0, t1, t0
  beqz t0, L21   # exit
  j    L15           # true → body

L15:
  # ℓ=15  assign
  mv   t0, s3
  mv   s1, t0

L16:
  # ℓ=16  while
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  beqz t0, L18   # exit
  j    L17           # true → body

L17:
  # ℓ=17  assign
  mv   t0, s1
  mv   t1, t0
  mv   t0, s6
  sub  t0, t1, t0
  mv   s1, t0
  j    L16

L18:
  # ℓ=18  if
  mv   t0, s1
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L20   # false → else
  j    L19       # true → then

L19:
  # ℓ=19  assign
  li   t0, 1
  mv   s7, t0
  j    L14

L20:
  # ℓ=20  assign
  mv   t0, s6
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  mv   s6, t0
  j    L14

L21:
  # ℓ=21  if
  mv   t0, s6
  mv   t1, t0
  mv   t0, s5
  slt  t0, t0, t1
  beqz t0, L23   # false → else
  j    L22       # true → then

L22:
  # ℓ=22  assign
  li   t0, 1
  mv   s4, t0
  j    L8

L23:
  # ℓ=23  assign
  mv   t0, s3
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s3, t0
  j    L8

L24:
  # ℓ=24  assign
  mv   t0, s3
  mv   s8, t0

L25:
  # ℓ=25  assign
  mv   t0, s8
  mv   s9, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (mod) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (input) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (i) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (stop1) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (sqrt) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (j) <- s6
  sd   s6, 0(t2)
  addi t2, t2, 8
  # output (stop) <- s7
  sd   s7, 0(t2)
  addi t2, t2, 8
  # output (closestprime) <- s8
  sd   s8, 0(t2)
  addi t2, t2, 8
  # output (output) <- s9
  sd   s9, 0(t2)
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
  addi sp, sp, 72
  ret
