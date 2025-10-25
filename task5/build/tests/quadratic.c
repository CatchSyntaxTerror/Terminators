#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[17];
int main(int argc, char **argv) {
  if (argc != 4) {
    fprintf(stderr, "Usage: %s <v1> <v2> <v3>\n", argv[0]);
    return 2;
  }

  for (int i = 0; i < 17; ++i) vars[i] = 0;
  vars[1] = atol(argv[1]);
  vars[2] = atol(argv[2]);
  vars[3] = atol(argv[3]);
  printf("Initial state:\n");
  for (int i = 0; i < 17; ++i) printf("v%d=%ld\n", i, vars[i]);
  program(vars);
  printf("Final state:\n");
  for (int i = 0; i < 17; ++i) printf("v%d=%ld\n", i, vars[i]);
  return 0;
}
