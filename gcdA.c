///////////////////////////////////////////////////////
//    EE3450 Computer Architecture - Spring 109      //
//    Project: Find Greatest Common Divisors (GCD)   //
//    Recursive method (gcdA.c)                      //
//    Student name: Po-Chen Kuo                      //
//    Student ID: 107012045                          //
///////////////////////////////////////////////////////

#include <stdio.h>

int gcd(int a, int b) {

    // check terminated (E2 path)
    if (a == b) {
        return a;
    }
    // check recursive (E1 path, A > B)
    else if (a > b) {
        return gcd(a - b, b);
    }
    // check recursive (E1 path, B > A)
    else {
        return gcd(a, b - a);
    }

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