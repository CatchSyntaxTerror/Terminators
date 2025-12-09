  .text
  .globl program
program:
  # save used s-registers
  addi sp, sp, -88
  sd   s1, 0(sp)
  sd   s2, 8(sp)
  sd   s3, 16(sp)
  sd   s4, 24(sp)
  sd   s5, 32(sp)
  sd   s6, 40(sp)
  sd   s7, 48(sp)
  sd   s8, 56(sp)
  sd   s9, 64(sp)
  sd   s10, 72(sp)
  sd   s11, 80(sp)
  mv   t2, a0
  # s4 <- input (W)
  ld   s4, 0(t2)
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  j    L0

L0:
  mv   t0, s4
  mv   s1, t0
  j    L1

L1:
  mv   t0, s1
  mv   s2, t0
  j    L2

L2:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  mv   t1, t0
  mv   t0, s2
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  or   t0, t1, t0
  snez t0, t0
  xori t0, t0, 1
  beqz t0, L4   # exit
  j    L3           # true -> body

L3:
  mv   t0, s2
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s2, t0
  j    L2

L4:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L6   # false -> else
  j    L5       # true -> then

L5:
  mv   t0, s1
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s1, t0
  j    L7

L6:
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s1, t0
  j    L7

L7:
  mv   t0, s1
  mv   s1, t0
  j    L8

L8:
  li   t0, 0
  mv   s6, t0
  j    L9

L9:
  mv   t0, s1
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  mv   t1, t0
  mv   t0, s6
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L25   # exit
  j    L10           # true -> body

L10:
  li   t0, 1
  mv   s4, t0
  j    L11

L11:
  mv   t0, s4
  mv   t1, t0
  mv   t0, s4
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  slt  t0, t0, t1
  xori t0, t0, 1
  beqz t0, L13   # exit
  j    L12           # true -> body

L12:
  mv   t0, s4
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s4, t0
  j    L11

L13:
  li   t0, 3
  mv   s3, t0
  j    L14

L14:
  li   t0, 0
  mv   s5, t0
  j    L15

L15:
  mv   t0, s3
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  mv   t1, t0
  mv   t0, s5
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L22   # exit
  j    L16           # true -> body

L16:
  mv   t0, s1
  mv   s2, t0
  j    L17

L17:
  mv   t0, s2
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  beqz t0, L19   # exit
  j    L18           # true -> body

L18:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s3
  sub  t0, t1, t0
  mv   s2, t0
  j    L17

L19:
  mv   t0, s2
  mv   t1, t0
  li   t0, 0
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L21   # false -> else
  j    L20       # true -> then

L20:
  li   t0, 1
  mv   s5, t0
  j    L15

L21:
  mv   t0, s3
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  mv   s3, t0
  j    L15

L22:
  mv   t0, s3
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  beqz t0, L24   # false -> else
  j    L23       # true -> then

L23:
  li   t0, 1
  mv   s6, t0
  j    L9

L24:
  mv   t0, s1
  mv   t1, t0
  li   t0, 2
  sub  t0, t1, t0
  mv   s1, t0
  j    L9

L25:
  mv   t0, s1
  mv   s1, t0
  j    L26

L26:
  li   t0, 0
  mv   s2, t0
  j    L27

L27:
  mv   t0, s1
  mv   s4, t0
  j    L28

L28:
  j    L29

L29:
  li   t0, 0
  mv   s1, t0
  j    L30

L30:
  j    L31

L31:
  li   t0, 9
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L32

L32:
  j    L33

L33:
  li   t0, 10
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L34

L34:
  li   t0, 0
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L35

L35:
  li   t0, 0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L36

L36:
  li   t0, 0
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L37

L37:
  li   t0, 0
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L38

L38:
  li   t0, 0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L39

L39:
  li   t0, 0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L40

L40:
  li   t0, 0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L41

L41:
  li   t0, 0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L42

L42:
  li   t0, 0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L43

L43:
  li   t0, 0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L44

L44:
  li   t0, 0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L45

L45:
  li   t0, 0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L46

L46:
  li   t0, 0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L47

L47:
  li   t0, 0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L48

L48:
  li   t0, 0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L49

L49:
  li   t0, 0
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L50

L50:
  li   t0, 0
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L51

L51:
  li   t0, 0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L52

L52:
  li   t0, 0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L53

L53:
  li   t0, 0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L54

L54:
  li   t0, 0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L55

L55:
  li   t0, 0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L56

L56:
  li   t0, 0
  mv   s3, t0
  j    L57

L57:
  li   t0, 0
  mv   s5, t0
  j    L58

L58:
  li   t0, 0
  mv   s6, t0
  j    L59

L59:
  li   t0, 0
  mv   s7, t0
  j    L60

L60:
  li   t0, 0
  mv   s8, t0
  j    L61

L61:
  li   t0, 0
  mv   s9, t0
  j    L62

L62:
  li   t0, 0
  mv   s10, t0
  j    L63

L63:
  li   t0, 0
  mv   s11, t0
  j    L64

L64:
  li   t0, 0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L65

L65:
  li   t0, 0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L66

L66:
  li   t0, 0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L67

L67:
  li   t0, 0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L68

L68:
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  beqz t0, L424   # exit
  j    L69           # true -> body

L69:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L70

L70:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L72   # false -> else
  j    L71       # true -> then

L71:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L73

L72:
  j    L73

L73:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L74

L74:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L76   # false -> else
  j    L75       # true -> then

L75:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L77

L76:
  j    L77

L77:
  j    L78

L78:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L79

L79:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L81   # false -> else
  j    L80       # true -> then

L80:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L82

L81:
  j    L82

L82:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L83

L83:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L85   # false -> else
  j    L84       # true -> then

L84:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L86

L85:
  j    L86

L86:
  j    L87

L87:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L88

L88:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L90   # false -> else
  j    L89       # true -> then

L89:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L91

L90:
  j    L91

L91:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L92

L92:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L94   # false -> else
  j    L93       # true -> then

L93:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L95

L94:
  j    L95

L95:
  j    L96

L96:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L97

L97:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L99   # false -> else
  j    L98       # true -> then

L98:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L100

L99:
  j    L100

L100:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L101

L101:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L103   # false -> else
  j    L102       # true -> then

L102:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L104

L103:
  j    L104

L104:
  j    L105

L105:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L106

L106:
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L108   # false -> else
  j    L107       # true -> then

L107:
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L109

L108:
  j    L109

L109:
  j    L110

L110:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L111

L111:
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L113   # false -> else
  j    L112       # true -> then

L112:
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L114

L113:
  j    L114

L114:
  j    L115

L115:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L116

L116:
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L118   # false -> else
  j    L117       # true -> then

L117:
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L119

L118:
  j    L119

L119:
  j    L120

L120:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L121

L121:
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s3
  slt  t0, t0, t1
  beqz t0, L123   # false -> else
  j    L122       # true -> then

L122:
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s3, t0
  j    L124

L123:
  j    L124

L124:
  j    L125

L125:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L126

L126:
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s5
  slt  t0, t0, t1
  beqz t0, L128   # false -> else
  j    L127       # true -> then

L127:
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s5, t0
  j    L129

L128:
  j    L129

L129:
  j    L130

L130:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L131

L131:
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s6
  slt  t0, t0, t1
  beqz t0, L133   # false -> else
  j    L132       # true -> then

L132:
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s6, t0
  j    L134

L133:
  j    L134

L134:
  j    L135

L135:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L136

L136:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s7
  slt  t0, t0, t1
  beqz t0, L138   # false -> else
  j    L137       # true -> then

L137:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s7, t0
  j    L139

L138:
  j    L139

L139:
  j    L140

L140:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L141

L141:
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s8
  slt  t0, t0, t1
  beqz t0, L143   # false -> else
  j    L142       # true -> then

L142:
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s8, t0
  j    L144

L143:
  j    L144

L144:
  j    L145

L145:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L146

L146:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s9
  slt  t0, t0, t1
  beqz t0, L148   # false -> else
  j    L147       # true -> then

L147:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s9, t0
  j    L149

L148:
  j    L149

L149:
  j    L150

L150:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L151

L151:
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s10
  slt  t0, t0, t1
  beqz t0, L153   # false -> else
  j    L152       # true -> then

L152:
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s10, t0
  j    L154

L153:
  j    L154

L154:
  j    L155

L155:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L156

L156:
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s11
  slt  t0, t0, t1
  beqz t0, L158   # false -> else
  j    L157       # true -> then

L157:
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s11, t0
  j    L159

L158:
  j    L159

L159:
  j    L160

L160:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L161

L161:
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L163   # false -> else
  j    L162       # true -> then

L162:
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L164

L163:
  j    L164

L164:
  j    L165

L165:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L166

L166:
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L168   # false -> else
  j    L167       # true -> then

L167:
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 50
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L169

L168:
  j    L169

L169:
  j    L170

L170:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L171

L171:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L173   # false -> else
  j    L172       # true -> then

L172:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L174

L173:
  j    L174

L174:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L175

L175:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s8
  slt  t0, t0, t1
  beqz t0, L177   # false -> else
  j    L176       # true -> then

L176:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s8, t0
  j    L178

L177:
  j    L178

L178:
  j    L179

L179:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L180

L180:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L182   # false -> else
  j    L181       # true -> then

L181:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L183

L182:
  j    L183

L183:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L184

L184:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s9
  slt  t0, t0, t1
  beqz t0, L186   # false -> else
  j    L185       # true -> then

L185:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s9, t0
  j    L187

L186:
  j    L187

L187:
  j    L188

L188:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L189

L189:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L191   # false -> else
  j    L190       # true -> then

L190:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L192

L191:
  j    L192

L192:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L193

L193:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s10
  slt  t0, t0, t1
  beqz t0, L195   # false -> else
  j    L194       # true -> then

L194:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s10, t0
  j    L196

L195:
  j    L196

L196:
  j    L197

L197:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L198

L198:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L200   # false -> else
  j    L199       # true -> then

L199:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L201

L200:
  j    L201

L201:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L202

L202:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s11
  slt  t0, t0, t1
  beqz t0, L204   # false -> else
  j    L203       # true -> then

L203:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s11, t0
  j    L205

L204:
  j    L205

L205:
  j    L206

L206:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L207

L207:
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L209   # false -> else
  j    L208       # true -> then

L208:
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L210

L209:
  j    L210

L210:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L211

L211:
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L213   # false -> else
  j    L212       # true -> then

L212:
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L214

L213:
  j    L214

L214:
  j    L215

L215:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L216

L216:
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L218   # false -> else
  j    L217       # true -> then

L217:
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L219

L218:
  j    L219

L219:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L220

L220:
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L222   # false -> else
  j    L221       # true -> then

L221:
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L223

L222:
  j    L223

L223:
  j    L224

L224:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L225

L225:
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L227   # false -> else
  j    L226       # true -> then

L226:
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L228

L227:
  j    L228

L228:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L229

L229:
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L231   # false -> else
  j    L230       # true -> then

L230:
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L232

L231:
  j    L232

L232:
  j    L233

L233:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L234

L234:
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L236   # false -> else
  j    L235       # true -> then

L235:
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L237

L236:
  j    L237

L237:
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L238

L238:
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
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
  beqz t0, L240   # false -> else
  j    L239       # true -> then

L239:
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L241

L240:
  j    L241

L241:
  j    L242

L242:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L243

L243:
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t0, t1
  beqz t0, L245   # false -> else
  j    L244       # true -> then

L244:
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L246

L245:
  j    L246

L246:
  j    L247

L247:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L248

L248:
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s3
  slt  t0, t0, t1
  beqz t0, L250   # false -> else
  j    L249       # true -> then

L249:
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s3, t0
  j    L251

L250:
  j    L251

L251:
  j    L252

L252:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L253

L253:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s5
  slt  t0, t0, t1
  beqz t0, L255   # false -> else
  j    L254       # true -> then

L254:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s5, t0
  j    L256

L255:
  j    L256

L256:
  j    L257

L257:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L258

L258:
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s6
  slt  t0, t0, t1
  beqz t0, L260   # false -> else
  j    L259       # true -> then

L259:
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s6, t0
  j    L261

L260:
  j    L261

L261:
  j    L262

L262:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L263

L263:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s7
  slt  t0, t0, t1
  beqz t0, L265   # false -> else
  j    L264       # true -> then

L264:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s7, t0
  j    L266

L265:
  j    L266

L266:
  j    L267

L267:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L268

L268:
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s8
  slt  t0, t0, t1
  beqz t0, L270   # false -> else
  j    L269       # true -> then

L269:
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s8, t0
  j    L271

L270:
  j    L271

L271:
  j    L272

L272:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L273

L273:
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s9
  slt  t0, t0, t1
  beqz t0, L275   # false -> else
  j    L274       # true -> then

L274:
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s9, t0
  j    L276

L275:
  j    L276

L276:
  j    L277

L277:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L278

L278:
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s10
  slt  t0, t0, t1
  beqz t0, L280   # false -> else
  j    L279       # true -> then

L279:
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s10, t0
  j    L281

L280:
  j    L281

L281:
  j    L282

L282:
  li   t0, 1
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L283

L283:
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s11
  slt  t0, t0, t1
  beqz t0, L285   # false -> else
  j    L284       # true -> then

L284:
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 51
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   t1, t0
  li   t2, 52
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mul  t0, t1, t0
  add  t0, t1, t0
  mv   s11, t0
  j    L286

L285:
  j    L286

L286:
  j    L287

L287:
  mv   t0, s2
  mv   t1, t0
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 0
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L289   # false -> else
  j    L288       # true -> then

L288:
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L290

L289:
  j    L290

L290:
  mv   t0, s2
  mv   t1, t0
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L292   # false -> else
  j    L291       # true -> then

L291:
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L293

L292:
  j    L293

L293:
  mv   t0, s2
  mv   t1, t0
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 2
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L295   # false -> else
  j    L294       # true -> then

L294:
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L296

L295:
  j    L296

L296:
  mv   t0, s2
  mv   t1, t0
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 3
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L298   # false -> else
  j    L297       # true -> then

L297:
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L299

L298:
  j    L299

L299:
  mv   t0, s2
  mv   t1, t0
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 4
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L301   # false -> else
  j    L300       # true -> then

L300:
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L302

L301:
  j    L302

L302:
  mv   t0, s2
  mv   t1, t0
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 5
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L304   # false -> else
  j    L303       # true -> then

L303:
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L305

L304:
  j    L305

L305:
  mv   t0, s2
  mv   t1, t0
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 6
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L307   # false -> else
  j    L306       # true -> then

L306:
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L308

L307:
  j    L308

L308:
  mv   t0, s2
  mv   t1, t0
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 7
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L310   # false -> else
  j    L309       # true -> then

L309:
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L311

L310:
  j    L311

L311:
  mv   t0, s2
  mv   t1, t0
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 8
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L313   # false -> else
  j    L312       # true -> then

L312:
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L314

L313:
  j    L314

L314:
  mv   t0, s2
  mv   t1, t0
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 9
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L316   # false -> else
  j    L315       # true -> then

L315:
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L317

L316:
  j    L317

L317:
  mv   t0, s2
  mv   t1, t0
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 10
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L319   # false -> else
  j    L318       # true -> then

L318:
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L320

L319:
  j    L320

L320:
  mv   t0, s2
  mv   t1, t0
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 11
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L322   # false -> else
  j    L321       # true -> then

L321:
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L323

L322:
  j    L323

L323:
  mv   t0, s2
  mv   t1, t0
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 12
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L325   # false -> else
  j    L324       # true -> then

L324:
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L326

L325:
  j    L326

L326:
  mv   t0, s2
  mv   t1, t0
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 13
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L328   # false -> else
  j    L327       # true -> then

L327:
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L329

L328:
  j    L329

L329:
  mv   t0, s2
  mv   t1, t0
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 14
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L331   # false -> else
  j    L330       # true -> then

L330:
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L332

L331:
  j    L332

L332:
  mv   t0, s2
  mv   t1, t0
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 15
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L334   # false -> else
  j    L333       # true -> then

L333:
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L335

L334:
  j    L335

L335:
  mv   t0, s2
  mv   t1, t0
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 16
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L337   # false -> else
  j    L336       # true -> then

L336:
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L338

L337:
  j    L338

L338:
  mv   t0, s2
  mv   t1, t0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 17
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L340   # false -> else
  j    L339       # true -> then

L339:
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L341

L340:
  j    L341

L341:
  mv   t0, s2
  mv   t1, t0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 18
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L343   # false -> else
  j    L342       # true -> then

L342:
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L344

L343:
  j    L344

L344:
  mv   t0, s2
  mv   t1, t0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 19
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L346   # false -> else
  j    L345       # true -> then

L345:
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L347

L346:
  j    L347

L347:
  mv   t0, s2
  mv   t1, t0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 20
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L349   # false -> else
  j    L348       # true -> then

L348:
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L350

L349:
  j    L350

L350:
  mv   t0, s2
  mv   t1, t0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 21
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L352   # false -> else
  j    L351       # true -> then

L351:
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L353

L352:
  j    L353

L353:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s3
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 22
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L355   # false -> else
  j    L354       # true -> then

L354:
  mv   t0, s3
  mv   s2, t0
  j    L356

L355:
  j    L356

L356:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s5
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 23
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L358   # false -> else
  j    L357       # true -> then

L357:
  mv   t0, s5
  mv   s2, t0
  j    L359

L358:
  j    L359

L359:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s6
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 24
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L361   # false -> else
  j    L360       # true -> then

L360:
  mv   t0, s6
  mv   s2, t0
  j    L362

L361:
  j    L362

L362:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s7
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 25
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L364   # false -> else
  j    L363       # true -> then

L363:
  mv   t0, s7
  mv   s2, t0
  j    L365

L364:
  j    L365

L365:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s8
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 26
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L367   # false -> else
  j    L366       # true -> then

L366:
  mv   t0, s8
  mv   s2, t0
  j    L368

L367:
  j    L368

L368:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s9
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 27
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L370   # false -> else
  j    L369       # true -> then

L369:
  mv   t0, s9
  mv   s2, t0
  j    L371

L370:
  j    L371

L371:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s10
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 28
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L373   # false -> else
  j    L372       # true -> then

L372:
  mv   t0, s10
  mv   s2, t0
  j    L374

L373:
  j    L374

L374:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s11
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 29
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L376   # false -> else
  j    L375       # true -> then

L375:
  mv   t0, s11
  mv   s2, t0
  j    L377

L376:
  j    L377

L377:
  mv   t0, s2
  mv   t1, t0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 30
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L379   # false -> else
  j    L378       # true -> then

L378:
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L380

L379:
  j    L380

L380:
  mv   t0, s2
  mv   t1, t0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 31
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L382   # false -> else
  j    L381       # true -> then

L381:
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L383

L382:
  j    L383

L383:
  mv   t0, s2
  mv   t1, t0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 32
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L385   # false -> else
  j    L384       # true -> then

L384:
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L386

L385:
  j    L386

L386:
  mv   t0, s2
  mv   t1, t0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  slt  t0, t1, t0
  mv   t1, t0
  mv   t0, s1
  mv   t1, t0
  li   t0, 17
  mul  t0, t1, t0
  mv   t1, t0
  li   t0, 33
  add  t0, t1, t0
  mv   t1, t0
  mv   t0, s4
  slt  t0, t0, t1
  xori t0, t0, 1
  snez t1, t1
  snez t0, t0
  and  t0, t1, t0
  beqz t0, L388   # false -> else
  j    L387       # true -> then

L387:
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  mv   s2, t0
  j    L389

L388:
  j    L389

L389:
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 8
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L390

L390:
  li   t0, 0
  li   t2, 17
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L391

L391:
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 9
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L392

L392:
  li   t0, 0
  li   t2, 18
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L393

L393:
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 20
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L394

L394:
  li   t0, 0
  li   t2, 19
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L395

L395:
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 31
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L396

L396:
  li   t0, 0
  li   t2, 21
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L397

L397:
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 36
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L398

L398:
  li   t0, 0
  li   t2, 22
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L399

L399:
  mv   t0, s3
  li   t2, 37
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L400

L400:
  li   t0, 0
  mv   s3, t0
  j    L401

L401:
  mv   t0, s5
  li   t2, 38
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L402

L402:
  li   t0, 0
  mv   s5, t0
  j    L403

L403:
  mv   t0, s6
  li   t2, 39
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L404

L404:
  li   t0, 0
  mv   s6, t0
  j    L405

L405:
  mv   t0, s7
  li   t2, 40
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L406

L406:
  li   t0, 0
  mv   s7, t0
  j    L407

L407:
  mv   t0, s8
  li   t2, 41
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L408

L408:
  li   t0, 0
  mv   s8, t0
  j    L409

L409:
  mv   t0, s9
  li   t2, 10
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L410

L410:
  li   t0, 0
  mv   s9, t0
  j    L411

L411:
  mv   t0, s10
  li   t2, 11
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L412

L412:
  li   t0, 0
  mv   s10, t0
  j    L413

L413:
  mv   t0, s11
  li   t2, 12
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L414

L414:
  li   t0, 0
  mv   s11, t0
  j    L415

L415:
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 13
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L416

L416:
  li   t0, 0
  li   t2, 32
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L417

L417:
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 14
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L418

L418:
  li   t0, 0
  li   t2, 33
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L419

L419:
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 15
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L420

L420:
  li   t0, 0
  li   t2, 34
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L421

L421:
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  ld   t0, 0(t2)
  li   t2, 16
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L422

L422:
  li   t0, 0
  li   t2, 35
  slli t2, t2, 3
  add  t2, a0, t2
  sd   t0, 0(t2)
  j    L423

L423:
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s1, t0
  j    L68

L424:
  mv   t0, s2
  mv   s3, t0
  j    L425

L425:
  j    L426

L426:
  li   t0, 0
  mv   s5, t0
  j    L427

L427:
  mv   t0, s3
  mv   t1, t0
  li   t0, 2
  slt  t0, t1, t0
  xori t0, t0, 1
  beqz t0, L444   # exit
  j    L428           # true -> body

L428:
  li   t0, 0
  mv   s4, t0
  j    L429

L429:
  li   t0, 2
  mv   s1, t0
  j    L430

L430:
  mv   t0, s1
  mv   t1, t0
  mv   t0, s1
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s3
  slt  t0, t0, t1
  xori t0, t0, 1
  beqz t0, L440   # exit
  j    L431           # true -> body

L431:
  mv   t0, s3
  mv   s2, t0
  j    L432

L432:
  mv   t0, s4
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  beqz t0, L434   # false -> else
  j    L433       # true -> then

L433:
  j    L439

L434:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  slt  t0, t1, t0
  xori t0, t0, 1
  beqz t0, L439   # exit
  j    L435           # true -> body

L435:
  mv   t0, s2
  mv   t1, t0
  mv   t0, s1
  mul  t0, t1, t0
  mv   t1, t0
  mv   t0, s3
  sub  t0, t1, t0
  seqz t0, t0
  beqz t0, L437   # false -> else
  j    L436       # true -> then

L436:
  mv   t0, s4
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s4, t0
  j    L438

L437:
  j    L438

L438:
  mv   t0, s2
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s2, t0
  j    L434

L439:
  mv   t0, s1
  mv   t1, t0
  li   t0, 1
  add  t0, t1, t0
  mv   s1, t0
  j    L430

L440:
  mv   t0, s4
  mv   t1, t0
  li   t0, 0
  slt  t0, t0, t1
  beqz t0, L442   # false -> else
  j    L441       # true -> then

L441:
  j    L443

L442:
  li   t0, 1
  mv   t1, t0
  mv   t0, s5
  add  t0, t1, t0
  mv   s5, t0
  j    L443

L443:
  mv   t0, s3
  mv   t1, t0
  li   t0, 1
  sub  t0, t1, t0
  mv   s3, t0
  j    L427

L444:
  mv   t0, s5
  mv   s2, t0
  j    L_end

L_end:
  mv   t2, a0
  # output (W) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (closestprime) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (count) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (endput) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (i) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (input) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (j) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (k) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  # output (knapsack22) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (knapsack23) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (knapsack24) <- s6
  sd   s6, 0(t2)
  addi t2, t2, 8
  # output (knapsack25) <- s7
  sd   s7, 0(t2)
  addi t2, t2, 8
  # output (knapsack26) <- s8
  sd   s8, 0(t2)
  addi t2, t2, 8
  # output (knapsack27) <- s9
  sd   s9, 0(t2)
  addi t2, t2, 8
  # output (knapsack28) <- s10
  sd   s10, 0(t2)
  addi t2, t2, 8
  # output (knapsack29) <- s11
  sd   s11, 0(t2)
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  # output (mod) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (n) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (output) <- s2
  sd   s2, 0(t2)
  addi t2, t2, 8
  # output (range) <- s3
  sd   s3, 0(t2)
  addi t2, t2, 8
  # output (result) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (sqrt) <- s4
  sd   s4, 0(t2)
  addi t2, t2, 8
  # output (stop) <- s5
  sd   s5, 0(t2)
  addi t2, t2, 8
  # output (stop1) <- s6
  sd   s6, 0(t2)
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  addi t2, t2, 8
  # output (weights0) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # output (weights1) <- s1
  sd   s1, 0(t2)
  addi t2, t2, 8
  # restore used s-registers
  ld   s1, 0(sp)
  ld   s2, 8(sp)
  ld   s3, 16(sp)
  ld   s4, 24(sp)
  ld   s5, 32(sp)
  ld   s6, 40(sp)
  ld   s7, 48(sp)
  ld   s8, 56(sp)
  ld   s9, 64(sp)
  ld   s10, 72(sp)
  ld   s11, 80(sp)
  addi sp, sp, 88
  ret
