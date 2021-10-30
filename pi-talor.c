#include <stdio.h>
#include <math.h>
#include <omp.h>

double pi_talor(long loops){
	double pi = 0;

#pragma opm parallel for reduction (+:pi)
	for(long n = 1; n <= loops ; n++)
		pi += (double) pow(-1, n+1)*(4/(double)(2*n-1));
	return pi;
}

int main(int argc, char** argv){
	for(int i=1 ; i < 100 ; i++){
		double pi = pi_talor((long)pow(10,i));
		printf("pi:%1.20f i:%d\n", pi, i);
	}
	return 0;
}

