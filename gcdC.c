///////////////////////////////////////////////////////
//    EE3450 Computer Architecture - Spring 109      //
//    Project: Find Greatest Common Divisors (GCD)   //
//    Binary GCD (gcdC.c)  (recursive!)              //
//    Student Name: Po-Chen Kuo                      //
//    Student ID: 107012045                          //
///////////////////////////////////////////////////////

#include <stdio.h>

int gcd(int a, int b) {
    int isOdd_a = (a & 1);
    int isOdd_b = (b & 1);

    if (a == b) {
        return a;
    }
    else if (isOdd_a && isOdd_b && a > b) {
        return gcd(a - b, b);
    }
    else if (isOdd_a && isOdd_b) {
        return gcd(a, b - a);
    }
    else if (isOdd_a) {
        return gcd(a, b >> 1);
    } 
    else if (isOdd_b) {
        return gcd(a >> 1, b);
    }
    else {
        return 2 * gcd(a >> 1, b >> 1);
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