#include <stdio.h>

extern void primes(int start);

void main()
{
    primes(50);

    // time ./primes > primesOutput
    // real    0m2.095s
    // user    0m2.087s
    // sys     0m0.007s
    // primes(250000);
}
