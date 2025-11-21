#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[36];
int main(int argc, char **argv) {
  if (argc != 19) {
    fprintf(stderr, "Usage: %s <v14> <v15> <v16> <v17> <v18> <v19> <v20> <v21> <v22> <v24> <v25> <v26> <v27> <v28> <v29> <v30> <v31> <v32>\n", argv[0]);
    return 2;
  }

  for (int i = 0; i < 36; ++i) vars[i] = 0;
  vars[14] = atol(argv[1]);
  vars[15] = atol(argv[2]);
  vars[16] = atol(argv[3]);
  vars[17] = atol(argv[4]);
  vars[18] = atol(argv[5]);
  vars[19] = atol(argv[6]);
  vars[20] = atol(argv[7]);
  vars[21] = atol(argv[8]);
  vars[22] = atol(argv[9]);
  vars[24] = atol(argv[10]);
  vars[25] = atol(argv[11]);
  vars[26] = atol(argv[12]);
  vars[27] = atol(argv[13]);
  vars[28] = atol(argv[14]);
  vars[29] = atol(argv[15]);
  vars[30] = atol(argv[16]);
  vars[31] = atol(argv[17]);
  vars[32] = atol(argv[18]);
  printf("Initial state:\n");
  for (int i = 0; i < 36; ++i) printf("v%d=%ld\n", i, vars[i]);
  program(vars);
  printf("Final state:\n");
  for (int i = 0; i < 36; ++i) printf("v%d=%ld\n", i, vars[i]);
  return 0;
}
