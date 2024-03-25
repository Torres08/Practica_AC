#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv)
{
	int N = omp_get_max_threads();
	omp_set_num_threads(2);

	printf("omp_get_max_threads(): %d\n", N);
	#pragma omp parallel for num_threads(6) if (N>=4) schedule(static,3)
		for (int i = 0; i < 12; i++)
			printf("thread: %d | iteracion: %d \n",omp_get_thread_num(),i );
	
}
