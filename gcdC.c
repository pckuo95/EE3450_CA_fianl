///////////////////////////////////////////////////////
//    EE3450 Computer Architecture - Spring 109      //
//    Project: Find Greatest Common Divisors (GCD)   //
//    Binary GCD (gcdC.c)  (recursive!)              //
//    Student Name: Po-Chen Kuo                      //
//    Student ID: 107012045                          //
///////////////////////////////////////////////////////

#include <stdio.h>

int gcd(int a, int b) {
    int isOdd_a = (a & 1);      // Check a is odd(1) or even(0)
    int isOdd_b = (b & 1);      // Check b is odd(1) or even(0)

    if (a == b) {               // E2 condition
        return a;
    }                           // a & b is odd, E1 condition, compare a and b 
    else if (isOdd_a && isOdd_b && a > b) {
        return gcd(a - b, b);   // a > b 
    }
    else if (isOdd_a && isOdd_b) {
        return gcd(a, b - a);   // a < b
    }
    else if (isOdd_a) {         
        return gcd(a, b >> 1);  // BG2 condition, b is even
    }
    else if (isOdd_b) {         
        return gcd(a >> 1, b);  // BG2 condition, a is even
    }
    else {                      // BG1 condition, both a and b is even
        return gcd(a >> 1, b >> 1) << 1;
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