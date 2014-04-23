#include <stdio.h>

extern void primes(int start);

void main()
{
    primes(50);

    // time ./primes > primesOutput
    // real    0m7.160s
    // user    0m7.110s
    // sys     0m0.047s
    // primes(1000000);
}
