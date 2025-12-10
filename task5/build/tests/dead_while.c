#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[11];
int main(int argc, char **argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <v1>\n", argv[0]);
    return 2;
  }

  for (int i = 0; i < 11; ++i) vars[i] = 0;
  vars[1] = atol(argv[1]);
  printf("Initial state:\n");
  for (int i = 0; i < 11; ++i) printf("v%d=%ld\n", i, vars[i]);
  program(vars);
  printf("Final state:\n");
  for (int i = 0; i < 11; ++i) printf("v%d=%ld\n", i, vars[i]);
  return 0;
}
