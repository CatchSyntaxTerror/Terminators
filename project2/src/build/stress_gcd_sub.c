#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[5];
int main(int argc, char **argv) {
  if (argc != 3) {
    fprintf(stderr, "Usage: %s <input2> <input>\n", argv[0]);
    return 2;
  }

  for (int i=0;i<5;i++) vars[i]=0;
  int ai = 1;
  vars[2] = atol(argv[ai++]); // input
  vars[3] = atol(argv[ai++]); // input2

  printf("Initial state:\n");
  printf("a=%ld\n", vars[0]);
  printf("b=%ld\n", vars[1]);
  printf("input=%ld\n", vars[2]);
  printf("input2=%ld\n", vars[3]);
  printf("output=%ld\n", vars[4]);
  program(vars);
  printf("Final state:\n");
  printf("a=%ld\n", vars[0]);
  printf("b=%ld\n", vars[1]);
  printf("input=%ld\n", vars[2]);
  printf("input2=%ld\n", vars[3]);
  printf("output=%ld\n", vars[4]);
  return 0;
}
