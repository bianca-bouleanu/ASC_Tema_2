/*
 * Tema 2 ASC
 * 2018 Spring
 * Catalin Olaru / Vlad Spoiala
 */
#include "cblas.h"
#include "utils.h"

/* 
 * Add your BLAS implementation here
 */
double* my_solver(int N, double *A) {
	printf("BLAS SOLVER\n");

	printf("%d,:\n", N);

	int K;
	K = N;

	const double *alpha;
	double a = 1;
	alpha = &a;

	int lda = N;
	int ldc = N;

	const double *beta;
	double b = 0;
	beta = &b;

	double *C;

	C = calloc(N*N*2, sizeof(double));



	cblas_zsyrk(CblasRowMajor, CblasUpper, CblasNoTrans, N, K, alpha, A, lda, beta, C, ldc);

	return C;

}
