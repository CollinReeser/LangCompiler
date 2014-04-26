#include <stdio.h>

extern int fibRecursive(int start);

void main()
{
    int start = 1;
    int fibNum = fibRecursive(start);
    printf("The %uth Fibonacci number is %u\n", start, fibNum);
    start = 2;
    fibNum = fibRecursive(start);
    printf("The %uth Fibonacci number is %u\n", start, fibNum);
    start = 3;
    fibNum = fibRecursive(start);
    printf("The %uth Fibonacci number is %u\n", start, fibNum);
    start = 4;
    fibNum = fibRecursive(start);
    printf("The %uth Fibonacci number is %u\n", start, fibNum);
    start = 5;
    fibNum = fibRecursive(start);
    printf("The %uth Fibonacci number is %u\n", start, fibNum);
    start = 6;
    fibNum = fibRecursive(start);
    printf("The %uth Fibonacci number is %u\n", start, fibNum);
    start = 10;
    fibNum = fibRecursive(start);
    printf("The %uth Fibonacci number is %u\n", start, fibNum);
    start = 33;
    fibNum = fibRecursive(start);
    printf("The %uth Fibonacci number is %u\n", start, fibNum);
}
