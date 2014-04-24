#include <stdio.h>

extern int ifBlockTest(int start);

void main()
{
    int num;
    if ((num = ifBlockTest(0)) == 0)
    {
        printf("Correctly returned from if! Got %u\n", num);
    }
    else
    {
        printf("Incorrect return! Got %u\n", num);
    }
    if ((num = ifBlockTest(6)) == 3)
    {
        printf("Correctly returned from first else-if! Got %u\n", num);
    }
    else
    {
        printf("Incorrect return! Got %u\n", num);
    }
    if ((num = ifBlockTest(9)) == 81)
    {
        printf("Correctly returned from second else-if! Got %u\n", num);
    }
    else
    {
        printf("Incorrect return! Got %u\n", num);
    }
    if ((num = ifBlockTest(7)) == 22)
    {
        printf("Correctly returned from else! Got %u\n", num);
    }
    else
    {
        printf("Incorrect return! Got %u\n", num);
    }
}
