#include <stdio.h>

int fac_rec(int n) {
	if (n == 0) return 1;
	else return n * fac_rec(n - 1);
}

int main(void) {
	int n, fac;
	
	scanf("%d", &n);
	fac = fac_rec(n);
	printf("%d\n", fac);
	return 0;
}