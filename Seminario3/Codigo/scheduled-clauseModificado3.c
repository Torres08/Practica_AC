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
	    #pragma omp for firstprivate(suma) \
		        lastprivate(suma) schedule(dynamic,chunk)
	    for (i=0; i<n; i++)
	    {
		suma = suma + a[i];
		printf(" thread %d suma a[%d]=%d suma=%d \n",
		       omp_get_thread_num(),i,a[i],suma);
	    }
	    
	     #pragma omp single
		{
			omp_get_schedule(&kind,&modifier); // tipo y moodificador
			printf("\nDENTRO DE LA REGION PARALELA, ANTES DE MODIFICAR\n");

			printf("dyn_var: %d\n" , omp_get_dynamic());
			printf("nthreads-var: %d\n" , omp_get_max_threads());
			printf("run-shed-var: %d y modif: %d \n\n", kind, modifier);
			
			if (kind == omp_sched_static) printf("Kind es static\n");
			else if (kind == omp_sched_dynamic) printf("Kind es dinamico\n");
			else if (kind == omp_sched_guided) printf("Kind es guided\n");
			else printf("Tipo es auto");
			
			
			// modificamos 
			
			omp_set_dynamic(10);
			omp_set_num_threads(4);
			omp_set_schedule(1,2);
			
			
			omp_get_schedule(&kind,&modifier); // tipo y moodificador
			printf("DENTRO DE LA REGION PARALELA, LUEGO DE MODIFICAR\n");

			printf("dyn_var: %d\n" , omp_get_dynamic());
			printf("nthreads-var: %d\n" , omp_get_max_threads());
			printf("run-shed-var: %d y modif: %d \n\n", kind, modifier);
			
			
			
		}
    }

    printf("Fuera de 'parallel for' suma=%d\n",suma); 

    omp_get_schedule(&kind,&modifier); // tipo y moodificador
    printf("DENTRO DE LA REGION PARALELA, ANTES DE MODIFICAR\n");

    printf("dyn_var: %d\n" , omp_get_dynamic());
    printf("nthreads-var: %d\n" , omp_get_max_threads());
    printf("run-shed-var: %d y modif: %d \n\n", kind, modifier);
			
    // modificamos 
			
    omp_set_dynamic(5);
    omp_set_num_threads(2);
    omp_set_schedule(2,1);
			
			
    omp_get_schedule(&kind,&modifier); // tipo y moodificador
    printf("DENTRO DE LA REGION PARALELA, LUEGO DE MODIFICAR\n");

    printf("dyn_var: %d\n" , omp_get_dynamic());
    printf("nthreads-var: %d\n" , omp_get_max_threads());
    printf("run-shed-var: %d y modif: %d \n\n", kind, modifier);
 }  
