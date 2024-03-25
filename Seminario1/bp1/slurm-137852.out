#!/bin/bash

echo "Id. usuario del trabajo: $SLURM_JOB_USER"
echo "Id. del trabajo: $SLURM_JOBID"
echo "Nombre del trabajo especificado por usuario: $SLURM_JOB_NAME"
echo "Directorio de trabajo (en el que se ejecuta el script): $SLURM_SUBMIT_DIR"
echo "Cola: $SLURM_JOB_PARTITION"
echo "Nodo que ejecuta este trabajo: $SLURM_SUBIMT_HOST"
echo "Nº de nodos asignados al trabajo: $SLURM_JOB_NUM_NODES"
echo "Nodos asignados al trabajo: $SLURM_JOB_NODELIST"
echo "CPUs por nodo: $SLURM_JOB_CPUS_PER_MODE"

# instrucciones del script para ejecutar el codigo:
echo -e Ejecucuon de SumaVectores_Global, con for paralelizado y sections

for ((i=8288608;i<=67108864;i=i*2))
do
	echo -e "\nEjecutando con for con $i componentes"
	time ./sp-OpenMP-for $i

	echo -e "\nEjecutando secuancial, sin paralelismo, con $i componentes"
	time ./SumaVectores_Global $i

	
done
