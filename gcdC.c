///////////////////////////////////////////////////////
//    EE3450 Computer Architecture - Spring 109      //
//    Project: Find Greatest Common Divisors (GCD)   //
//    Binary GCD (gcdC.c)                            //
///////////////////////////////////////////////////////

#include <stdio.h>

int gcd(int a, int b) {
    int n = 0;
    while ((a % 2) == 0 && (b % 2) == 0) {
        a = a >> 1;
        b = b >> 1;
        n++;
    }

    while (a != b) {
        // 'a', 'b' not equal(E2 condition), check which is bigger
        if (a > b) {
            // 'a' bigger, iterative for 'a' 
            a = a - b;
        }
        else {
            // 'b' bigger, iterative for 'b', no need to consider equal
            b = b - a;
        }
    }

    a = a << n;
    return a;
}

int main(void) {

    int a, b;

    printf("Please give 2 integers separated by enter:\n");

    scanf("%d", &a);
    scanf("%d", &b);

    a = gcd(a, b);

    printf("The greatest common divisor is %d\n", a);

    return 0;
}