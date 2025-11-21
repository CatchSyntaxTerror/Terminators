  .text
  .globl program
program:
  mv   t2, a0
  # s1 <- input (x)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (y)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (z)
  ld   s3, 0(t2)
  addi t2, t2, 8
  j    L0

L0:
  # ℓ=0  assign
  li   t0, 4
  mv   s1, t0
  j    L1

L1:
  # ℓ=1  if
  mv   t0, s1
  mv   t1, t0
  li   t0, 3
  slt  t0, t0, t1
  xori t0, t0, 1
  beqz t0, L3   # false → else
  j    L2       # true → then

L2:
  # ℓ=2  assign
  li   t0, 10
  mv   s2, t0
  j    L4

L3:
  # ℓ=3  assign
  li   t0, 20
  mv   s2, t0
  j    L4

L4:
  # ℓ=4  assign
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s3, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (x) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (y) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (z) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  ret
