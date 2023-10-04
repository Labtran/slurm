#!/bin/bash 
#SBATCH --job-name=2minutes
#SBATCH --partition=harpia
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=02:00
#
## executable 
sleep 2m
