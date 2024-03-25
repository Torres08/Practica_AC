#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv)
{
	int N = (int)(omp_get_max_threads()/4);
	

	printf("omp_get_max_threads()/4 : %d\n", N);
	#pragma omp parallel for num_threads(6) if (N>6) 
		for (int i = 0; i < N; i++)
			printf("thread: %d | iteracion: %d \n",omp_get_thread_num(),i );
	
}
