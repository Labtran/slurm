#!/bin/bash 
#SBATCH --job-name=2minutos
#SBATCH --partition=harpia
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=05:00
#
## executable 
sleep 2m
##./add
##hostname
##whoami
##deviceQuery

##export PATH=/usr/local/cuda-12.0/bin:$PATH
##export LD_LIBRARY_PATH=/usr/local/cuda-12.0/lib64:/usr/lib/nvidia/:$PATH

##echo $PATH
##echo $LD_LIBRARY_PATH

##deviceQuery

#cd simulador-labtran-rebecacosta-v2/

#./simulador-labtran-rebecacosta-v2
