CC=gcc
CFLAGS=-Wall -Werror -O0
OTHER_C_FLAGS=-Wall -Werror -O3
LIBDIRS=/usr/lib64/atlas/
LIBS=libsatlas.so.3.10

all: tema2_blas tema2_neopt tema2_opt_m tema2_opt_f

plots : plot_gcc

out_fies: neopt_gcc, out opt_f_gcc.out opt_m_gcc.out blas_gcc.out

opt_f_gcc.out : tema2_opt_f
	./opt_f.sh > opt_f_gcc.out

opt_m_gcc.out : tema2_opt_m
	./opt_m.sh > opt_m_gcc.out

neopt_gcc.out : tema2_neopt
	./neopt.sh > neopt_gcc.out

blas_gcc.out : tema2_blas
	./blas.sh > blas_gcc.out

plot_gcc : opt_f_gcc.out opt_m_gcc.out neopt_gcc.out blas_gcc.out
	gnuplot -persist -e "set xlabel 'Matrix rank (elements)'; set ylabel 'Time (sec)'; plot 'opt_f_gcc.out' using 1:2 title 'opt_f - gcc' with lines, 'opt_m_gcc.out' using 1:2 title 'opt_m - gcc' with lines, 'neopt_gcc.out' using 1:2 title 'neopt - gcc' with lines, 'blas_gcc.out' using 1:2 title 'blas - gcc' with lines"

plot_gcc_icc :
	gnuplot -persist -e "set xlabel 'Matrix rank (elements)'; set ylabel 'Time (sec)'; plot 'opt_f_gcc.out' using 1:2 title 'opt_f - gcc' with lines, 'opt_m_gcc.out' using 1:2 title 'opt_m - gcc' with lines, 'neopt_gcc.out' using 1:2 title 'neopt - gcc' with lines, 'blas_gcc.out' using 1:2 title 'blas - gcc' with lines, 'opt_f_icc.out' using 1:2 title 'opt_f - icc' with lines, 'opt_m_icc.out' using 1:2 title 'opt_m - icc' with lines, 'neopt_icc.out' using 1:2 title 'neopt - icc' with lines"

tema2_blas: solver_blas.c main.c
	$(CC) $(CFLAGS) $^ $(LIBDIRS)$(LIBS) -o $@	

tema2_neopt: solver_neopt.c main.c
	$(CC) $(CFLAGS) $^ $(LIBDIRS)$(LIBS) -o $@	

tema2_opt_m: solver_opt.c main.c
	$(CC) $(CFLAGS) $^ $(LIBDIRS)$(LIBS) -o $@	

tema2_opt_f: solver_neopt.c main.c
	$(CC) $(OTHER_C_FLAGS) $^ $(LIBDIRS)$(LIBS) -o $@

clean:
	rm -rf tema2_blas tema2_neopt tema2_opt_m tema2_opt_f
