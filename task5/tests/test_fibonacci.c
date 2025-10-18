#include <stdio.h>
#include <stdlib.h>

/**
 * This file tests example13-fibonacci.while
 */
extern void program(long int *vars);
long int vars[6]; // we need 6 slots (0–5)

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        fprintf(stderr, "Usage: %s <n>\n", argv[0]);
        return 1;
    }

    vars[0] = 0;             
    vars[1] = 1;             
    vars[2] = 0;             
    vars[3] = atol(argv[1]); 
    vars[4] = 0;            
    vars[5] = 0;           

    puts("Initial state (a, b, temp, n, next, output):");
    printf("%ld %ld %ld %ld %ld %ld\n",
           vars[0], vars[1], vars[2], vars[3], vars[4], vars[5]);

    program(vars);

    puts("Final state (a, b, temp, n, next, output):");
    printf("%ld %ld %ld %ld %ld %ld\n",
           vars[0], vars[1], vars[2], vars[3], vars[4], vars[5]);
    printf("Fibonacci(%ld) = %ld\n", atol(argv[1]), vars[5]);

    return 0;
}
