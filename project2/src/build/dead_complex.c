#include <stdlib.h>
#include <stdio.h>

extern void program(long int *vars);
long int vars[11];
int main(int argc, char **argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <input>\n", argv[0]);
    return 2;
  }

  for (int i=0;i<11;i++) vars[i]=0;
  int ai = 1;
  vars[3] = atol(argv[ai++]); // input

  printf("Initial state:\n");
  printf("a=%ld\n", vars[0]);
  printf("b=%ld\n", vars[1]);
  printf("i=%ld\n", vars[2]);
  printf("input=%ld\n", vars[3]);
  printf("junk1=%ld\n", vars[4]);
  printf("junk2=%ld\n", vars[5]);
  printf("junk3=%ld\n", vars[6]);
  printf("junk4=%ld\n", vars[7]);
  printf("n=%ld\n", vars[8]);
  printf("next=%ld\n", vars[9]);
  printf("output=%ld\n", vars[10]);
  program(vars);
  printf("Final state:\n");
  printf("a=%ld\n", vars[0]);
  printf("b=%ld\n", vars[1]);
  printf("i=%ld\n", vars[2]);
  printf("input=%ld\n", vars[3]);
  printf("junk1=%ld\n", vars[4]);
  printf("junk2=%ld\n", vars[5]);
  printf("junk3=%ld\n", vars[6]);
  printf("junk4=%ld\n", vars[7]);
  printf("n=%ld\n", vars[8]);
  printf("next=%ld\n", vars[9]);
  printf("output=%ld\n", vars[10]);
  return 0;
}
