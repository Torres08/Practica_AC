#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
#endif

/*
 * Uso dynamic cunado no sie el tiempo de ejecucion de las iteraciones, "el 
 * numero de bucles
 *
 * la unidad de distribucionn tiene chuck de iteraciones
 * nº unidades O(n/chunk)
 *
 * iteraciones se dividen en unidades de chunk iteraciones
 *
 * los thread mas rapidos ejecutan mas unidades
 *
 * doy el nº de iteraciones y chubk "tamaño de la unidad"
 */

int main(int argc, char **argv)
{
    int i, n=200, chunk, a[n], suma=0;

    int modifier;
    omp_sched_t kind;

    if(argc < 3)
    {
        fprintf(stderr,"\nFalta iteraciones o chunk\n");
        exit(-1);
    }

    n = atoi(argv[1]);
    if (n>200)
        n=200;

    chunk = atoi(argv[2]); 

    for (i=0; i<n; i++)
        a[i] = i; 
 
    #pragma omp parallel 
	{
    #pragma omp for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk)
    for (i=0; i<n; i++)
    {
        suma = suma + a[i];
        printf(" thread %d suma a[%d]=%d suma=%d \n",
               omp_get_thread_num(),i,a[i],suma);
    }
    
    #pragma omp single
	{
		omp_get_schedule(&kind,&modifier);
		printf("DENTRO DE LA REGION PARALELA\n");
		printf("omp_get_num_threads(): %d \n" ,omp_get_num_threads());
    		printf("omp_get_num_procs(): %d\n", omp_get_num_procs()); 
    		printf("omp_in_parallel(): %d \n", omp_in_parallel()); 
	}
    }
    printf("Fuera de 'parallel for' suma=%d\n",suma); 

    omp_get_schedule(&kind,&modifier);
    printf("\nFUERA DE LA REGION PARALELA\n"); 
    printf("omp_get_num_threads(): %d \n" ,omp_get_num_threads());
    printf("omp_get_num_procs(): %d\n", omp_get_num_procs());
    printf("omp_in_parallel(): %d \n", omp_in_parallel());
}
