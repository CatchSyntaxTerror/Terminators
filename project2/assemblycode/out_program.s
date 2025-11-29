  .text
  .globl program
program:
  # save s-registers
  addi sp, sp, -32
  sd s1, 0(sp)
  sd s2, 8(sp)
  sd s3, 16(sp)
  sd s4, 24(sp)
  mv   t2, a0
  # s1 <- input (n)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (in)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (y)
  ld   s3, 0(t2)
  addi t2, t2, 8
  # s4 <- input (out)
  ld   s4, 0(t2)
  addi t2, t2, 8
  j    L0

L0:
  # ℓ=0  assign
  mv   t0, s2
  mv   s1, t0
  j    L1

L1:
  # ℓ=1  if
  mv   t0, s1
  mv   t1, t0
  li   t0, 100
  slt  t0, t0, t1
  beqz t0, L3   # false → else
  j    L2       # true → then

L2:
  # ℓ=2  assign
  li   t0, 5
  mv   s3, t0
  j    L12

L3:
  # ℓ=3  if
  mv   t0, s1
  mv   t1, t0
  li   t0, 20
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  xori t0, t0, 1
  beqz t0, L11   # false → else
  j    L4       # true → then

L4:
  # ℓ=4  if
  mv   t0, s1
  mv   t1, t0
  li   t0, 41
  slt  t0, t1, t0
  beqz t0, L6   # false → else
  j    L5       # true → then

L5:
  # ℓ=5  assign
  li   t0, 1
  mv   s3, t0
  j    L12

L6:
  # ℓ=6  if
  mv   t0, s1
  mv   t1, t0
  li   t0, 80
  slt  t0, t0, t1
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 100
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L8   # false → else
  j    L7       # true → then

L7:
  # ℓ=7  assign
  li   t0, 4
  mv   s3, t0
  j    L12

L8:
  # ℓ=8  if
  mv   t0, s1
  mv   t1, t0
  li   t0, 51
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 60
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  beqz t0, L10   # false → else
  j    L9       # true → then

L9:
  # ℓ=9  assign
  li   t0, 2
  mv   s3, t0
  j    L12

L10:
  # ℓ=10  assign
  li   t0, 3
  mv   s3, t0
  j    L12

L11:
  # ℓ=11  assign
  li   t0, 0
  mv   s3, t0
  j    L12

L12:
  # ℓ=12  assign
  mv   t0, s3
  mv   s4, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (n) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (in) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (y) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (out) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # restore s-registers
  ld s1, 0(sp)
  ld s2, 8(sp)
  ld s3, 16(sp)
  ld s4, 24(sp)
  addi sp, sp, 32
  ret
