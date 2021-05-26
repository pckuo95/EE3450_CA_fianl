///////////////////////////////////////////////////////
//    EE3450 Computer Architecture - Spring 109      //
//    Project: Find Greatest Common Divisors (GCD)   //
//    Iterative method (gcdB.c)                      //
//    Student Name: Po-Chen Kuo                      //
//    Student ID: 107012045                          //
///////////////////////////////////////////////////////

#include <stdio.h>

int main(void) {

    int a, b;

    printf("Please give 2 integers separated by enter:\n");

    scanf("%d", &a);
    scanf("%d", &b);

    // calculate GCD
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

    // if 'a', 'b' equal, print 'a' (E1 condition)
    printf("The greatest common divisor is %d\n", a);

    return 0;
}