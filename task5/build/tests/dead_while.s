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
  li t0, 0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li t0, 1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li t0, 2
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li t0, 0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
L_test_0:
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  slt t0, t1, t0
  beqz t0, L_end_1
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mul t0, t1, t0
  mv t1, t0
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
  add t0, t1, t0
  mv t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mul t0, t1, t0
  add t0, t1, t0
  li   t2, 6
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  add t0, t1, t0
  mv t1, t0
  li   t2, 0
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  add t0, t1, t0
  mv t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  add t0, t1, t0
  li   t2, 7
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 3
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
  li t0, 1234
  add t0, t1, t0
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mul t0, t1, t0
  mv t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mul t0, t1, t0
  mv t1, t0
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
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mul t0, t1, t0
  add t0, t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li   t2, 3
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  add t0, t1, t0
  mv t1, t0
  li   t2, 4
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  add t0, t1, t0
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  mv t1, t0
  li t0, 1
  add t0, t1, t0
  li   t2, 2
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L_test_0
L_end_1:
  li   t2, 5
  slli t2, t2, 3
  add  t2, a0, t2
  ld t0, 0(t2)
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  ret
