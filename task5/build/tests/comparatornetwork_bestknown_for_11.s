  .text
  .globl program
program:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_0
  j    L_end_1
L_else_0:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_1:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_2
  j    L_end_3
L_else_2:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_3:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_4
  j    L_end_5
L_else_4:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_5:
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_6
  j    L_end_7
L_else_6:
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_7:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_8
  j    L_end_9
L_else_8:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_9:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_10
  j    L_end_11
L_else_10:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_11:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_12
  j    L_end_13
L_else_12:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_13:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_14
  j    L_end_15
L_else_14:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_15:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_16
  j    L_end_17
L_else_16:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_17:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_18
  j    L_end_19
L_else_18:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_19:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_20
  j    L_end_21
L_else_20:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_21:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_22
  j    L_end_23
L_else_22:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_23:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_24
  j    L_end_25
L_else_24:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_25:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_26
  j    L_end_27
L_else_26:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_27:
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_28
  j    L_end_29
L_else_28:
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_29:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_30
  j    L_end_31
L_else_30:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_31:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_32
  j    L_end_33
L_else_32:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_33:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_34
  j    L_end_35
L_else_34:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_35:
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_36
  j    L_end_37
L_else_36:
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_37:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_38
  j    L_end_39
L_else_38:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_39:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_40
  j    L_end_41
L_else_40:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_41:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_42
  j    L_end_43
L_else_42:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_43:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_44
  j    L_end_45
L_else_44:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_45:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_46
  j    L_end_47
L_else_46:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_47:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_48
  j    L_end_49
L_else_48:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_49:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_50
  j    L_end_51
L_else_50:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_51:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_52
  j    L_end_53
L_else_52:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_53:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_54
  j    L_end_55
L_else_54:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_55:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_56
  j    L_end_57
L_else_56:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_57:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_58
  j    L_end_59
L_else_58:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_59:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_60
  j    L_end_61
L_else_60:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_61:
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_62
  j    L_end_63
L_else_62:
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_63:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_64
  j    L_end_65
L_else_64:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_65:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_66
  j    L_end_67
L_else_66:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_67:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_68
  j    L_end_69
L_else_68:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_69:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  ret
