#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[7];
int main(int argc, char **argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <input>\n", argv[0]);
    return 2;
  }

  for (int i=0;i<7;i++) vars[i]=0;
  int ai = 1;
  vars[1] = atol(argv[ai++]); // input

  printf("Initial state:\n");
  printf("i=%ld\n", vars[0]);
  printf("input=%ld\n", vars[1]);
  printf("output=%ld\n", vars[2]);
  printf("t=%ld\n", vars[3]);
  printf("x=%ld\n", vars[4]);
  printf("y=%ld\n", vars[5]);
  printf("z=%ld\n", vars[6]);
  program(vars);
  printf("Final state:\n");
  printf("i=%ld\n", vars[0]);
  printf("input=%ld\n", vars[1]);
  printf("output=%ld\n", vars[2]);
  printf("t=%ld\n", vars[3]);
  printf("x=%ld\n", vars[4]);
  printf("y=%ld\n", vars[5]);
  printf("z=%ld\n", vars[6]);
  return 0;
}
