#include <stdlib.h>
#include <stdio.h>
/**
 * This file was provided by Prof Darko to test the assembly code output by our compiler
 */
extern void example6(long int *vars);
long int vars[6];
int main(int argc, char **argv)
{
    int i;
    if (argc != 7)
    {
        printf("Usage: example6-main input n output quot rem steps\n");
        exit(1);
    }
    vars[1] = atol(argv[1]);
    vars[0] = atol(argv[2]);
    vars[5] = atol(argv[3]);
    vars[4] = atol(argv[4]);
    vars[3] = atol(argv[5]);
    vars[2] = atol(argv[6]);
    printf("Initial state:\n");
    printf("input=%ld\n", vars[1]);
    printf("n=%ld\n", vars[0]);
    printf("output=%ld\n", vars[5]);
    printf("quot=%ld\n", vars[4]);
    printf("rem=%ld\n", vars[3]);
    printf("steps=%ld\n", vars[2]);
    example6(vars);
    printf("Final state:\n");
    printf("input=%ld\n", vars[1]);
    printf("n=%ld\n", vars[0]);
    printf("output=%ld\n", vars[5]);
    printf("quot=%ld\n", vars[4]);
    printf("rem=%ld\n", vars[3]);
    printf("steps=%ld\n", vars[2]);
}