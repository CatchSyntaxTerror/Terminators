#include <stdio.h>
#include <stdlib.h>

/**
 * This file tests example1_factorial.while
 */
extern void program(long int *vars);
long int vars[4];

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        fprintf(stderr, "Usage: %s <n>\n", argv[0]);
        return 1;
    }

    vars[1] = atol(argv[1]); 
    vars[0] = 0;             
    vars[2] = 0;
    vars[3] = 0;

    puts("Initial state (n, fact, temp1, temp2):");
    printf("%ld %ld %ld %ld\n", vars[0], vars[1], vars[2], vars[3]);

    program(vars);

    puts("Final state (n, fact, temp1, temp2):");
    printf("%ld %ld %ld %ld\n", vars[0], vars[1], vars[2], vars[3]);
    printf("Factorial(%ld) = %ld\n", vars[1], vars[3]);

    return 0;
}
