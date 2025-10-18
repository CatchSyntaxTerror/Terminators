/**
 *    0: n, 1: in, 2: y, 3: out
 *  If your emitted label isn't 'program' you need to change the label in codegen_rv.cpp
 */

#include <stdio.h>
#include <stdlib.h>

extern void program(long int *vars);
long int vars[4];

int main(int argc, char **argv)
{

    if (argc == 2)
    {
        vars[0] = 0;
        vars[1] = atol(argv[1]);
        vars[2] = 0;
        vars[3] = 0;
    }
    else if (argc == 5)
    {
        vars[0] = atol(argv[1]);
        vars[1] = atol(argv[2]);
        vars[2] = atol(argv[3]);
        vars[3] = atol(argv[4]);
    }
    else
    {
        fprintf(stderr, "Usage: %s <in>\n", argv[0]);
        fprintf(stderr, "   or: %s <n> <in> <y> <out>\n", argv[0]);
        return 1;
    }

    puts("Initial state (n,in,y,out):");
    printf("%ld %ld %ld %ld\n", vars[0], vars[1], vars[2], vars[3]);

    program(vars);

    puts("Final state (n,in,y,out):");
    printf("%ld %ld %ld %ld\n", vars[0], vars[1], vars[2], vars[3]);

    printf("Bucket (out) = %ld\n", vars[3]);
    return 0;
}
