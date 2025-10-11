  .text
  .globl program
program:
  li   t0, 5
  li   t1, 0
  slli t1, t1, 3
  add  t1, a0, t1
  sd   t0, 0(t1)
  li   t1, 0
  slli t1, t1, 3
  add  t1, a0, t1
  ld   t0, 0(t1)
  li   t1, 1
  slli t1, t1, 3
  add  t1, a0, t1
  sd   t0, 0(t1)
  ret
