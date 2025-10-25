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
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_0:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  li   t2, 2
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
  j    L_test_0
L_end_1:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_2
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
  j    L_end_3
L_else_2:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_3:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_4:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 4
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
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_6:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_7
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_6
L_end_7:
  li   t0, 3
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_8:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  li   t2, 7
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
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_10:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_end_11
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_10
L_end_11:
  li   t2, 2
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
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_13
L_else_12:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_13:
  j    L_test_8
L_end_9:
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_14
  li   t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_15
L_else_14:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_15:
  j    L_test_4
L_end_5:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 9
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
  li   t0, 2
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 15
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 9
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 13
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 10
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_16:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_17
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_18
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_19
L_else_18:
L_end_19:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_20
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_21
L_else_20:
L_end_21:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_22
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_23
L_else_22:
L_end_23:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_24
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_25
L_else_24:
L_end_25:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_26
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_27
L_else_26:
L_end_27:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_28
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_29
L_else_28:
L_end_29:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_30
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_31
L_else_30:
L_end_31:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_32
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_33
L_else_32:
L_end_33:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_34
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_35
L_else_34:
L_end_35:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_36
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_37
L_else_36:
L_end_37:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_38
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_39
L_else_38:
L_end_39:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_40
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_41
L_else_40:
L_end_41:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_42
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_43
L_else_42:
L_end_43:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_44
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_45
L_else_44:
L_end_45:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_46
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_47
L_else_46:
L_end_47:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_48
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_49
L_else_48:
L_end_49:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_50
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_51
L_else_50:
L_end_51:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_52
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_53
L_else_52:
L_end_53:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_54
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_55
L_else_54:
L_end_55:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_56
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_57
L_else_56:
L_end_57:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_58
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_59
L_else_58:
L_end_59:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_60
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_61
L_else_60:
L_end_61:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_62
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_63
L_else_62:
L_end_63:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_64
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_65
L_else_64:
L_end_65:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_66
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_67
L_else_66:
L_end_67:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_68
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_69
L_else_68:
L_end_69:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_70
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_71
L_else_70:
L_end_71:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_72
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_73
L_else_72:
L_end_73:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_74
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_75
L_else_74:
L_end_75:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_76
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_77
L_else_76:
L_end_77:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_78
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_79
L_else_78:
L_end_79:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_80
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_81
L_else_80:
L_end_81:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_82
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_83
L_else_82:
L_end_83:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_84
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_85
L_else_84:
L_end_85:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_86
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_87
L_else_86:
L_end_87:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_88
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_89
L_else_88:
L_end_89:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_90
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_91
L_else_90:
L_end_91:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_92
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_93
L_else_92:
L_end_93:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_94
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_95
L_else_94:
L_end_95:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_96
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_97
L_else_96:
L_end_97:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_98
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_99
L_else_98:
L_end_99:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_100
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_101
L_else_100:
L_end_101:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_102
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_103
L_else_102:
L_end_103:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_104
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_105
L_else_104:
L_end_105:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_106
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_107
L_else_106:
L_end_107:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 1
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_108
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_109
L_else_108:
L_end_109:
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 49
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_110
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_111
L_else_110:
L_end_111:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_112
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_113
L_else_112:
L_end_113:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_114
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_115
L_else_114:
L_end_115:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 3
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_116
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_117
L_else_116:
L_end_117:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 4
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_118
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_119
L_else_118:
L_end_119:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 5
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_120
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_121
L_else_120:
L_end_121:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 6
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_122
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_123
L_else_122:
L_end_123:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 7
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_124
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_125
L_else_124:
L_end_125:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 8
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_126
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_127
L_else_126:
L_end_127:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 9
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_128
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_129
L_else_128:
L_end_129:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 10
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_130
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_131
L_else_130:
L_end_131:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 11
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_132
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_133
L_else_132:
L_end_133:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 12
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_134
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_135
L_else_134:
L_end_135:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 13
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_136
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_137
L_else_136:
L_end_137:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 14
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_138
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_139
L_else_138:
L_end_139:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 15
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_140
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_141
L_else_140:
L_end_141:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 16
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_142
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_143
L_else_142:
L_end_143:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 17
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_144
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_145
L_else_144:
L_end_145:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 18
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_146
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_147
L_else_146:
L_end_147:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 19
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_148
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_149
L_else_148:
L_end_149:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 20
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_150
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_151
L_else_150:
L_end_151:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 21
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_152
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_153
L_else_152:
L_end_153:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 22
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_154
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_155
L_else_154:
L_end_155:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 23
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_156
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_157
L_else_156:
L_end_157:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 24
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_158
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_159
L_else_158:
L_end_159:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 25
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_160
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_161
L_else_160:
L_end_161:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 26
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_162
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_163
L_else_162:
L_end_163:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 27
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_164
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_165
L_else_164:
L_end_165:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 28
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_166
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_167
L_else_166:
L_end_167:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 29
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_168
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_169
L_else_168:
L_end_169:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 30
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_170
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_171
L_else_170:
L_end_171:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 31
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_172
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_173
L_else_172:
L_end_173:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 32
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_174
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_175
L_else_174:
L_end_175:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 33
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  snez t0, t0
  beqz t0, L_else_176
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_177
L_else_176:
L_end_177:
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 42
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 43
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 44
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 45
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 46
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 47
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 48
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_16
L_end_17:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_178:
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_179
  li   t0, 0
  li   t2, 53
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 2
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_180:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_181
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 54
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 53
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_182
  j    L_end_183
L_else_182:
L_test_184:
  li   t2, 54
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  slt  t0, t1, t0
  xori t0, t0, 1
  snez t0, t0
  beqz t0, L_end_185
  li   t2, 54
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_186
  li   t2, 53
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 53
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_187
L_else_186:
L_end_187:
  li   t2, 54
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 54
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_184
L_end_185:
L_end_183:
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_180
L_end_181:
  li   t2, 53
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  snez t0, t0
  beqz t0, L_else_188
  j    L_end_189
L_else_188:
  li   t0, 1
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_189:
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_178
L_end_179:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  ret
