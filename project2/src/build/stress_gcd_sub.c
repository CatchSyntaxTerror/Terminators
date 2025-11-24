#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[5];
int main(int argc, char **argv) {
  if (argc != 6) {
    fprintf(stderr, "Usage: %s <v0> <v1> <v2> <v3> <v4>\n", argv[0]);
    return 2;
  }

  for (int i = 0; i < 5; i++)
      vars[i] = atol(argv[i+1]);

  printf("Initial state:\n");
  printf("v0=%ld\n", vars[0]);
  printf("v1=%ld\n", vars[1]);
  printf("v2=%ld\n", vars[2]);
  printf("v3=%ld\n", vars[3]);
  printf("v4=%ld\n", vars[4]);
  program(vars);
  printf("Final state:\n");
  printf("v0=%ld\n", vars[0]);
  printf("v1=%ld\n", vars[1]);
  printf("v2=%ld\n", vars[2]);
  printf("v3=%ld\n", vars[3]);
  printf("v4=%ld\n", vars[4]);
  return 0;
}
