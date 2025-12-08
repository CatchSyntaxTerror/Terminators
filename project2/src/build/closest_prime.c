#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[9];
int main(int argc, char **argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <input>\n", argv[0]);
    return 2;
  }

  for (int i=0;i<9;i++) vars[i]=0;
  int ai = 1;
  vars[2] = atol(argv[ai++]); // input

  printf("Initial state:\n");
  printf("closestprime=%ld\n", vars[0]);
  printf("i=%ld\n", vars[1]);
  printf("input=%ld\n", vars[2]);
  printf("j=%ld\n", vars[3]);
  printf("mod=%ld\n", vars[4]);
  printf("output=%ld\n", vars[5]);
  printf("sqrt=%ld\n", vars[6]);
  printf("stop=%ld\n", vars[7]);
  printf("stop1=%ld\n", vars[8]);
  program(vars);
  printf("Final state:\n");
  printf("closestprime=%ld\n", vars[0]);
  printf("i=%ld\n", vars[1]);
  printf("input=%ld\n", vars[2]);
  printf("j=%ld\n", vars[3]);
  printf("mod=%ld\n", vars[4]);
  printf("output=%ld\n", vars[5]);
  printf("sqrt=%ld\n", vars[6]);
  printf("stop=%ld\n", vars[7]);
  printf("stop1=%ld\n", vars[8]);
  return 0;
}
