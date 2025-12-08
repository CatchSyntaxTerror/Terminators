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
  vars[4] = atol(argv[ai++]); // input

  printf("Initial state:\n");
  printf("c=%ld\n", vars[0]);
  printf("count=%ld\n", vars[1]);
  printf("d=%ld\n", vars[2]);
  printf("dm1=%ld\n", vars[3]);
  printf("input=%ld\n", vars[4]);
  printf("isprime=%ld\n", vars[5]);
  printf("n=%ld\n", vars[6]);
  printf("output=%ld\n", vars[7]);
  printf("rem=%ld\n", vars[8]);
  program(vars);
  printf("Final state:\n");
  printf("c=%ld\n", vars[0]);
  printf("count=%ld\n", vars[1]);
  printf("d=%ld\n", vars[2]);
  printf("dm1=%ld\n", vars[3]);
  printf("input=%ld\n", vars[4]);
  printf("isprime=%ld\n", vars[5]);
  printf("n=%ld\n", vars[6]);
  printf("output=%ld\n", vars[7]);
  printf("rem=%ld\n", vars[8]);
  return 0;
}
