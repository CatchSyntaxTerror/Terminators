#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[13];
int main(int argc, char **argv) {
  if (argc != 12) {
    fprintf(stderr, "Usage: %s <v0> <v1> <v3> <v4> <v5> <v6> <v7> <v8> <v9> <v10> <v11>\n", argv[0]);
    return 2;
  }

  for (int i = 0; i < 13; ++i) vars[i] = 0;
  vars[0] = atol(argv[1]);
  vars[1] = atol(argv[2]);
  vars[3] = atol(argv[3]);
  vars[4] = atol(argv[4]);
  vars[5] = atol(argv[5]);
  vars[6] = atol(argv[6]);
  vars[7] = atol(argv[7]);
  vars[8] = atol(argv[8]);
  vars[9] = atol(argv[9]);
  vars[10] = atol(argv[10]);
  vars[11] = atol(argv[11]);
  printf("Initial state:\n");
  for (int i = 0; i < 13; ++i) printf("v%d=%ld\n", i, vars[i]);
  program(vars);
  printf("Final state:\n");
  for (int i = 0; i < 13; ++i) printf("v%d=%ld\n", i, vars[i]);
  return 0;
}
