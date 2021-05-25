#include <stdio.h>
int fac_ite (int n) {
	int i;
	
	if (n == 0) return 1;
	for (i = n-1; i > 1 ; i--) n = n * i;
	return n;
}
int main(void) {
	int n, fac;
	scanf("%d", &n );
	fac = fac_ite(n);
	printf("%d\n", fac);
	return 0;
}