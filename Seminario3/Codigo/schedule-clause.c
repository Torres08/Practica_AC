#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
#endif

/*
 * doy el numero de iteraciones de la unidad de distribucion chunk
 * nº trabajo a cada hebra
 * Ej si es 2 hasta que la hebra 0 no haga 2 trabajos no paso a la siguiente hebra
 *
 */

int main(int argc, char **argv)
{
    int i, n=7, chunk, a[n], suma=0;
    
    if(argc < 2)
    {
        fprintf(stderr,"\nFalta el tamaño de chunk\n");
        exit(-1);
    }

    chunk = atoi(argv[1]); 

    for (i=0; i<n; i++)
        a[i] = i;
 
    #pragma omp parallel for firstprivate(suma) \
                lastprivate(suma) schedule(static,chunk)
    for (i=0; i<n; i++)
    {
        suma = suma + a[i];
        printf(" thread %d suma a[%d] suma=%d \n",
             omp_get_thread_num(),i,suma);
    } 

    printf("Fuera de 'parallel for' suma=%d\n",suma);
}

