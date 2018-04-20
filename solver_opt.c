/*
 * Tema 2 ASC
 * 2018 Spring
 * Catalin Olaru / Vlad Spoiala
 */
#include "utils.h"

/*
 * Add your optimized implementation here
 */
double* my_solver(int N, double *A) {
	printf("OPT SOLVER\n");
	
	printf("%d,:\n", N);

	double *C = calloc(N * N * 2, sizeof(double));
	int i, j, k;

	for(i = 0; i < N; i++) {
		for(j = i; j < N; j++) {
			register double real_result = 0.0;
			register double imaginary_result = 0.0;

			for (k = 0; k < N; k++) {

				// real part of the result
				 real_result += A[ 2*(N * i + k)] * A[2 * (N * j + k)] -
				  A[2 * (N * i + k) + 1] * A[2 * (N * j + k) + 1];

				// imaginary part of the result
				 imaginary_result += A[2 * (N * i + k)] * (A[2 * (N * j + k) + 1]) +
				(A[2 * (N * i + k) + 1]) * A[2 * (N * j + k)];

			}
			C[2 * (N * i + j)] = real_result;
			C[2 * (N * i + j) + 1] = imaginary_result;

		}
	}

	return C;	
}
