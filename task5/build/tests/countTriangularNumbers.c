#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[7];
int main(int argc, char **argv) {
  if (argc != 3) {
    fprintf(stderr, "Usage: %s <v4> <v5>\n", argv[0]);
    return 2;
  }

  for (int i = 0; i < 7; ++i) vars[i] = 0;
  vars[4] = atol(argv[1]);
  vars[5] = atol(argv[2]);
  printf("Initial state:\n");
  for (int i = 0; i < 7; ++i) printf("v%d=%ld\n", i, vars[i]);
  program(vars);
  printf("Final state:\n");
  for (int i = 0; i < 7; ++i) printf("v%d=%ld\n", i, vars[i]);
  return 0;
}
