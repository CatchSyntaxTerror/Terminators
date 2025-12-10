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
  # s1 <- input (n)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (input)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (count)
  ld   s3, 0(t2)
  addi t2, t2, 8
  # s4 <- input (c)
  ld   s4, 0(t2)
  addi t2, t2, 8
  # s5 <- input (isprime)
  ld   s5, 0(t2)
  addi t2, t2, 8
  # s6 <- input (d)
  ld   s6, 0(t2)
  addi t2, t2, 8
  # s7 <- input (rem)
  ld   s7, 0(t2)
  addi t2, t2, 8
  # s8 <- input (dm1)
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
  # ℓ=1  assign
  li   t0, 0
  mv   s3, t0

L2:
  # ℓ=2  assign
  mv   t0, s1
  mv   s4, t0

L3:
  # ℓ=3  while
  mv   t0, s4
  mv   t1, t0
  li   t0, 1
  slt  t0, t0, t1
  beqz t0, L19   # exit
  j    L4           # true → body

L4:
  # ℓ=4  assign
  li   t0, 1
  mv   s5, t0

L5:
  # ℓ=5  assign
  mv   t0, s4
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s6, t0

L6:
  # ℓ=6  while
  mv   t0, s6
  mv   t1, t0
  li   t0, 1
  slt  t0, t0, t1
  beqz t0, L15   # exit
  j    L7           # true → body

L7:
  # ℓ=7  assign
  mv   t0, s4
  mv   s7, t0

L8:
  # ℓ=8  assign
  mv   t0, s6
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s8, t0

L9:
  # ℓ=9  while
  mv   t0, s7
  mv   t1, t0
  mv   t0, s8
  slt  t0, t0, t1
  beqz t0, L11   # exit
  j    L10           # true → body

L10:
  # ℓ=10  assign
  mv   t0, s7
  mv   t1, t0
  mv   t0, s6
  sub  t0, t1, t0
  mv   s7, t0
  j    L9

L11:
  # ℓ=11  if
  mv   t0, s7
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L13   # false → else
  j    L12       # true → then

L12:
  # ℓ=12  assign
  li   t0, 0
  mv   s5, t0
  j    L14

L13:
  # ℓ=13  skip

L14:
  # ℓ=14  assign
  mv   t0, s6
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s6, t0
  j    L6

L15:
  # ℓ=15  if
  mv   t0, s5
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L17   # false → else
  j    L16       # true → then

L16:
  # ℓ=16  assign
  mv   t0, s3
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s3, t0
  j    L18

L17:
  # ℓ=17  skip

L18:
  # ℓ=18  assign
  mv   t0, s4
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s4, t0
  j    L3

L19:
  # ℓ=19  assign
  mv   t0, s3
  mv   s9, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (n) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (input) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (count) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (c) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (isprime) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (d) <- s6
  sd   s6, 0(t2)
  addi t2, t2, 8
  # output (rem) <- s7
  sd   s7, 0(t2)
  addi t2, t2, 8
  # output (dm1) <- s8
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
