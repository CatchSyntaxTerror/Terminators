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
L_test_0:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_1
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_0
L_end_1:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_2
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_3
L_else_2:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_3:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_4:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_5
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_6:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_7
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_6
L_end_7:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_8:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_9
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_10:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_11
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_10
L_end_11:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_12
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_13
L_else_12:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_13:
  j    L_test_8
L_end_9:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_14
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_15
L_else_14:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_15:
  j    L_test_4
L_end_5:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_16:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_17
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_16
L_end_17:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_18
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_19
L_else_18:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_19:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_20:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_21
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_22:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_23
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_22
L_end_23:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_24:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_25
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_26:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_27
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_26
L_end_27:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_28
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_29
L_else_28:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_29:
  j    L_test_24
L_end_25:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_30
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_31
L_else_30:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_31:
  j    L_test_20
L_end_21:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_32:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_33
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_32
L_end_33:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_34
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_35
L_else_34:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_35:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_36:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_37
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_38:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_39
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_38
L_end_39:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_40:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_41
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_42:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_43
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_42
L_end_43:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_44
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_45
L_else_44:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_45:
  j    L_test_40
L_end_41:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_46
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_47
L_else_46:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_47:
  j    L_test_36
L_end_37:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_48:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_49
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_48
L_end_49:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_50
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_51
L_else_50:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_51:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_52:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_53
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_54:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_55
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_54
L_end_55:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_56:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_57
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_58:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_59
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_58
L_end_59:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_60
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_61
L_else_60:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_61:
  j    L_test_56
L_end_57:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_62
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_63
L_else_62:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_63:
  j    L_test_52
L_end_53:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_64:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_65
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_64
L_end_65:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_66
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_67
L_else_66:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_67:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_68:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_69
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_70:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_71
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_70
L_end_71:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_72:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_73
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_74:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_75
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_74
L_end_75:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_76
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_77
L_else_76:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_77:
  j    L_test_72
L_end_73:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_78
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_79
L_else_78:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_79:
  j    L_test_68
L_end_69:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_80:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_81
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_80
L_end_81:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_82
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_83
L_else_82:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_83:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_84:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_85
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_86:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_87
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_86
L_end_87:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_88:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_89
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_90:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_91
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_90
L_end_91:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_92
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_93
L_else_92:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_93:
  j    L_test_88
L_end_89:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_94
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_95
L_else_94:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_95:
  j    L_test_84
L_end_85:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_96:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_97
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_96
L_end_97:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_98
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_99
L_else_98:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_99:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_100:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_101
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_102:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_103
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_102
L_end_103:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_104:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_105
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_106:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_107
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_106
L_end_107:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_108
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_109
L_else_108:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_109:
  j    L_test_104
L_end_105:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_110
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_111
L_else_110:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_111:
  j    L_test_100
L_end_101:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_112:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_113
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_112
L_end_113:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_114
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_115
L_else_114:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_115:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_116:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_117
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_118:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_119
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_118
L_end_119:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_120:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_121
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_122:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_123
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_122
L_end_123:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_124
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_125
L_else_124:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_125:
  j    L_test_120
L_end_121:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_126
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_127
L_else_126:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_127:
  j    L_test_116
L_end_117:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_128:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_129
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_128
L_end_129:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_130
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_131
L_else_130:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_131:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_132:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_133
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_134:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_135
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_134
L_end_135:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_136:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_137
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_138:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_139
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_138
L_end_139:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_140
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_141
L_else_140:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_141:
  j    L_test_136
L_end_137:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_142
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_143
L_else_142:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_143:
  j    L_test_132
L_end_133:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
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
L_test_144:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_145
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_144
L_end_145:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_146
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_147
L_else_146:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_147:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_148:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_149
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_150:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_151
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_150
L_end_151:
  li   t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_152:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_153
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_154:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_155
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_154
L_end_155:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_156
  li   t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_157
L_else_156:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_157:
  j    L_test_152
L_end_153:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_158
  li   t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_159
L_else_158:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_159:
  j    L_test_148
L_end_149:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  ret
