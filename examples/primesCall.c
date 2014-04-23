#include <stdio.h>

extern void primes(int start);

void main()
{
    // primes(50);

    primes(250000);

    // time ./primes > primesOutput
    // real    0m15.390s
    // user    0m15.377s
    // sys     0m0.007s
    // primes(250000);
}
