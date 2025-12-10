  .text
  .globl program
program:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_0:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 1
  sub t0, t1, t0
  seqz t0, t0
  snez t0, t0
  addi sp, sp, -8
  sd   t0, 0(sp)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 0
  sub t0, t1, t0
  seqz t0, t0
  snez t0, t0
  ld   t1, 0(sp)
  addi sp, sp, 8
  or  t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  beqz t0, L_end_1
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 2
  sub t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_0
L_end_1:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 1
  sub t0, t1, t0
  seqz t0, t0
  beqz t0, L_else_2
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 2
  sub t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_3
L_else_2:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 1
  sub t0, t1, t0
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_end_3:
  li   t2, 1
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li t0, 0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_4:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 2
  slt t0, t1, t0
  xori t0, t0, 1
  snez t0, t0
  addi sp, sp, -8
  sd   t0, 0(sp)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 0
  sub t0, t1, t0
  seqz t0, t0
  snez t0, t0
  ld   t1, 0(sp)
  addi sp, sp, 8
  and t0, t1, t0
  beqz t0, L_end_5
  li t0, 1
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_6:
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mul t0, t1, t0
  mv t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  slt t0, t0, t1
  xori t0, t0, 1
  beqz t0, L_end_7
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 1
  add t0, t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_6
L_end_7:
  li t0, 3
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li t0, 0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_8:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  slt t0, t0, t1
  xori t0, t0, 1
  snez t0, t0
  addi sp, sp, -8
  sd   t0, 0(sp)
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 0
  sub t0, t1, t0
  seqz t0, t0
  snez t0, t0
  ld   t1, 0(sp)
  addi sp, sp, 8
  and t0, t1, t0
  beqz t0, L_end_9
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_10:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 0
  slt t0, t0, t1
  beqz t0, L_end_11
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  sub t0, t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_10
L_end_11:
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 0
  sub t0, t1, t0
  seqz t0, t0
  beqz t0, L_else_12
  li t0, 1
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_13
L_else_12:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 2
  add t0, t1, t0
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
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  slt t0, t0, t1
  beqz t0, L_else_14
  li t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_end_15
L_else_14:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 2
  sub t0, t1, t0
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
  ld t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  ret
