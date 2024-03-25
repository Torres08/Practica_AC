/**
 * 
 * Directiva parallel
 * 
 */
#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
   #include <omp.h>
#else
   #define omp_get_thread_num() 0
#endif

// gcc -O2 -fopenmp -o prueba prueba.c

int main(int argc, char **argv)
{
  

   //if(argc < 2)     {
   // fprintf(stderr,"\n[ERROR] -: Hay un parámetros de entrada: número de hebra \n");
   //       exit(-1);
   //  }

   /* 
   int i, n = 6, ret = 1;

   #pragma omp parallel reduction(+:ret) 
   for (i = omp_get_thread_num(); i < omp_get_max_threads(); i+=omp_get_num_threads())
      ret += 1;

   #pragma omp single
      printf ("%d" , ret);
   */

  /*
   int n = 1;

   #pragma omp parallel for firstprivate(n) lastprivate(n)
      for (int i = 0; i < 5; ++ i){
         printf ("%d", i );
         n = n + 1;
        // printf ("\n%d", n );
      }
         
      printf ("\n%d", n);
   */

  /*
  int i, n= 2;
  #pragma omp parallel shared(n) private(i)
      for (i = 0; i < 4 ; ++i){
         #pragma omp single 
         {
            n += i;
         }
      }
   
   printf ("%d", n);
   */

  /*
  int n = 0;
  int size = 6;
  #pragma omp parallel for reduction (+:n)
      for (int i = 3; i < 5; ++i)
         n+=i;

   printf ("%d", n);
   */

  /*
   int i, n = 6, ret = 1;
   #pragma omp parallel reduction(+:ret) private(i)
         for (i = omp_get_thread_num(); i < n; i+=omp_get_num_threads())
            ret += i;
   
   printf ("%d", ret);
   */

  /*
   int n = 1, constant;
   #pragma omp parallel for reduction (*n) private (constant)
      for (int i = 1; i < omp_get_max_threads(); ++i)
         n*= (i + constant);
   
   printf("%d", n);
   */
  
  /*
  int n = 7;

  #pragma omp parallel for num_threads(6) if (n > 6)
   for (int i = 0; i < n; ++i)
      printf("h: %d ",omp_get_thread_num());
   */

  /*
  int a = 0;
  int b[10];
  for (int i = 0; i < 10; ++i) b[i]=-1;

  #pragma omp parallel
  {
      #pragma omp master
      {
         a = 1;
         printf("Ejecutada por: %d ", omp_get_thread_num());
      }

      #pragma omp for
          for(int j = 0; j < 10; j++) b[j] = a;
     

  }

  printf("b[3]= %d", b[3]);
  */

 /*
 int i, n = 6, ret = 1;
 #pragma omp parallel reduction(+:ret) 
 for (i = omp_get_thread_num(); i < n; i+= omp_get_num_threads() )
   ret +=i;

   printf("ret: %d", ret);
   */

  /*
  int n =1;
  #pragma omp parallel for firstprivate(n) lastprivate(n)
      for(int i = 0; i < 5; ++i)
         n+=1;

    printf("ret: %d",n); 
    */

   /*
   int i, n = 4, ret = 1;
   #pragma omp parallel reduction(+:ret) 
   for (i = omp_get_thread_num(); i < omp_get_max_threads(); i+= omp_get_num_threads() )
      ret +=i;  
   
    printf("ret: %d", ret);
    */

   /*
   int n ;
   #pragma omp parallel for reduction(*:n)
   for (int i = n; i < 5; ++i)
      n *=i;

   printf("n: %d", n);
   */

  /*
   int n = 6;
   #pragma omp parallel for num_threads(6) if (n >= 6)
   for(int i = 0; i < n; ++i)
      printf("h: %d" , omp_get_thread_num());
   */

  /*
  int sumalocal;
  int suma = 0;

  #pragma omp parallel private(sumalocal)
  {
   sumalocal = 0;
   #pragma omp for
   for (int i = 0; i < 5 ;++i)
      sumalocal += i;
   
   #pragma omp barrier 
   #pragma omp critical
      suma = suma + sumalocal;
   
   #pragma omp barrier
   #pragma omp single
   printf("suma: %d", suma);
  }
  */

   /*
   int n = -1;
   #pragma omp parallel for shared(n)
      for (int i = 0; i < 4; ++i)
         #pragma omp atomic
            n+=i;
   
   printf("%d",n);
   */

  /*
  int n = 1;
  #pragma omp parallel 
  {
   int p = 0;
   #pragma omp singe copyprivate(p)
      p= 2;

   #pragma omp for reduction(+:n)
   for (int i = 0; i < 5; ++i)
      n+=p;
   
  
   
  }

 printf("n: %d", n);
 */
/*

   int i, n = 2;
   #pragma omp parallel shared(n) private(i)
      for (i = 0; i < 4; ++i)
         #pragma omp single
         n+=i;

   printf("n: %d", n);
   */

  /*
  int N = omp_get_max_threads();
  omp_set_num_threads(2);
  #pragma omp parallel for num_threads(6) if (N>=4) schedule(static)
  for (int i = 0; i < 12; ++i)
   printf(" thread: %d iteracion %d ", omp_get_thread_num(), i);
   */

  /*
  int i = 0, sum = 0;
  #pragma omp parallel reduction (+:sum)
  for (int i = 0; i < 5 ;++i)
   //#pragma omp atomic 
      sum += i;

   printf ("sum: %d", sum);
   */

  /*
  int  n = 1;
  #pragma omp parallel for reduction(+:n)
  for (int i = n; i < 5; ++i)
   n+=i;

    printf ("sum: %d", n);
    */

   /*
   int n = 0;
   #pragma omp parallel  shared (n)
      for (int i = 0; i < 4; ++ i)
      #pragma omp atomic
       n += 1;
      
   printf ("sum: %d", n);
   */

  int n = 0;
  #pragma omp parallel for  firstprivate(n) lastprivate(n)
   for (int i = 0; i < 4; ++ i)
      n += i ;

   printf ("sum: %d", n);
}
