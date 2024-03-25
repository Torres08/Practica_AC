#!/bin/bash

echo "Id. usuario del trabajo: $SLURM_JOB_USER"
echo "Id. del trabajo: $SLURM_JOBID"
echo "Nombre del trabajo especificado por usuario: $SLURM_JOB_NAME"
echo "Directorio de trabajo (en el que se ejecuta el script): $SLURM_SUBMIT_DIR"
echo "Cola: $SLURM_JOB_PARTITION"
echo "Nodo que ejecuta este trabajo: $SLURM_SUBMIT_HOST"
echo "Nº de nodos asignados al trabajo: $SLURM_JOB_NUM_NODES"
echo "Nodos asignados al trabajo: $SLURM_JOB_NODELIST"
echo "CPUs por nodo: $SLURM_JOB_CPUS_PER_MODE"

# instrucciones del script para ejecutar el codigo:
echo -e Ejecucuon de SumaVectores_Global, con for paralelizado y sections

for ((i=16384;i<=67108864;i=i*2))
do
	echo -e "\nEjecutando con for con $i componentes"
	./sp-OpenMP-for $i

	echo -e "\nEjecutando con sections con $i componentes"
	./sp-OpenMP-sections $i

	echo -e "\nEjecutando secuencial, sin paralelismo, con $i componentes"
	./SumaVectores_Global $i
done
