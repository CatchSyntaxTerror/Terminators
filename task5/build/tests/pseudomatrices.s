  .text
  .globl program
program:
  li   t0, 0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_0:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 3
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_1
  li   t0, 0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_2:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 3
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_3
  li   t0, 0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_4:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 3
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_5
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_6
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_8
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_9
L_else_8:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_10
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_11
L_else_10:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_12
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_13
L_else_12:
  li   t0, 0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_13:
L_end_11:
L_end_9:
  j    L_end_7
L_else_6:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_14
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_16
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_17
L_else_16:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_18
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_19
L_else_18:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_20
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_21
L_else_20:
  li   t0, 0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_21:
L_end_19:
L_end_17:
  j    L_end_15
L_else_14:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_22
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_24
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_25
L_else_24:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_26
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_27
L_else_26:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_28
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_29
L_else_28:
  li   t0, 0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_29:
L_end_27:
L_end_25:
  j    L_end_23
L_else_22:
  li   t0, 0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_23:
L_end_15:
L_end_7:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_30
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_32
  li   t2, 24
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_33
L_else_32:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_34
  li   t2, 25
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_35
L_else_34:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_36
  li   t2, 26
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_37
L_else_36:
  li   t0, 0
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_37:
L_end_35:
L_end_33:
  j    L_end_31
L_else_30:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_38
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_40
  li   t2, 27
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_41
L_else_40:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_42
  li   t2, 28
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_43
L_else_42:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_44
  li   t2, 29
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_45
L_else_44:
  li   t0, 0
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_45:
L_end_43:
L_end_41:
  j    L_end_39
L_else_38:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_46
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_48
  li   t2, 30
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_49
L_else_48:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_50
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_51
L_else_50:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_52
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_53
L_else_52:
  li   t0, 0
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_53:
L_end_51:
L_end_49:
  j    L_end_47
L_else_46:
  li   t0, 0
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_47:
L_end_39:
L_end_31:
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 23
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_4
L_end_5:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_54
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_56
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_57
L_else_56:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_58
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_59
L_else_58:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_60
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_61
L_else_60:
L_end_61:
L_end_59:
L_end_57:
  j    L_end_55
L_else_54:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_62
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_64
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_65
L_else_64:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_66
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_67
L_else_66:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_68
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_69
L_else_68:
L_end_69:
L_end_67:
L_end_65:
  j    L_end_63
L_else_62:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_70
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_72
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_73
L_else_72:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_74
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_75
L_else_74:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_76
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_77
L_else_76:
L_end_77:
L_end_75:
L_end_73:
  j    L_end_71
L_else_70:
L_end_71:
L_end_63:
L_end_55:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_2
L_end_3:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_0
L_end_1:
  li   t0, 0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t0, 0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_78:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 3
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_79
  li   t0, 0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_80:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 3
  slt  t0, t1, t0
  snez t0, t0
  beqz t0, L_end_81
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_82
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_84
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_85
L_else_84:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_86
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_87
L_else_86:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_88
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_89
L_else_88:
  li   t0, 0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_89:
L_end_87:
L_end_85:
  j    L_end_83
L_else_82:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_90
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_92
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_93
L_else_92:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_94
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_95
L_else_94:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_96
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_97
L_else_96:
  li   t0, 0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_97:
L_end_95:
L_end_93:
  j    L_end_91
L_else_90:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_98
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_100
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_101
L_else_100:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_102
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_103
L_else_102:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  seqz t0, t0
  snez t0, t0
  beqz t0, L_else_104
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_105
L_else_104:
  li   t0, 0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_105:
L_end_103:
L_end_101:
  j    L_end_99
L_else_98:
  li   t0, 0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_99:
L_end_91:
L_end_83:
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  add  t0, t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_80
L_end_81:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_78
L_end_79:
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  ret
