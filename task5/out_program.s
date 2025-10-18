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
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 100
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_0
  li   t0, 5
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_1
L_else_0:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 20
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_else_2
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 41
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_4
  li   t0, 1
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_5
L_else_4:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 80
  slt  t0, t0, t1
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 100
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_6
  li   t0, 4
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_7
L_else_6:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 51
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 60
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  beqz t0, L_else_8
  li   t0, 2
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_9
L_else_8:
  li   t0, 3
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_9:
L_end_7:
L_end_5:
  j    L_end_3
L_else_2:
  li   t0, 0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_3:
L_end_1:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  ret
