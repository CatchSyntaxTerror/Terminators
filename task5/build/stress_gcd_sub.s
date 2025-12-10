  .text
  .globl program
program:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_0:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_1
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_else_2
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_3
L_else_2:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_3:
  j    L_test_0
L_end_1:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  ret
