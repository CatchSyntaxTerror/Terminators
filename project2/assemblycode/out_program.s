  .text
  .globl program
program:
  # save s-registers
  addi sp, sp, -24
  sd s1, 0(sp)
  sd s2, 8(sp)
  sd s3, 16(sp)
  mv   t2, a0
  # s1 <- input (x)
  ld   s1, 0(t2)
  addi t2, t2, 8
  # s2 <- input (y)
  ld   s2, 0(t2)
  addi t2, t2, 8
  # s3 <- input (output)
  ld   s3, 0(t2)
  addi t2, t2, 8
  j    L0

L0:
  # ℓ=0  assign
  li   t0, 1
  mv   s1, t0
  j    L1

L1:
  # ℓ=1  assign
  li   t0, 2
  mv   s2, t0
  j    L2

L2:
  # ℓ=2  assign
  mv   t0, s1
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
  # output (output) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # restore s-registers
  ld s1, 0(sp)
  ld s2, 8(sp)
  ld s3, 16(sp)
  addi sp, sp, 24
  ret
