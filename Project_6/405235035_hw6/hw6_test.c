#include <stdio.h>
extern int gcd(int, int);

int main(void)
{
    int a = 65, b = 45;
    int the_gcd;

    the_gcd = gcd(a, b);
    printf("The greatest common divider is %d\n", the_gcd);

    return 0;
}
