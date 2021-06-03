#!/bin/bash
#SBATCH --time=24:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal
#SBATCH --partition=shas               # Specify Summit haswell node
#SBATCH --ntasks=50
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --job-name=raxmlng_jobname        # Job submission name
#SBATCH --output=50t_raxml_jobname.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=START,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=email@colorado.edu

# Updated:         03 June 2021
# Purpose:         Raxml_ng

# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/8.2.0

# Run your program
source ~/.raxmlng
raxml-ng-mpi --all -msa allseqs.fas --model WAG --seed 2 --bs-trees 200 --extra thread-nopin

# This runs RAxML-ng with the following parameters:
# WAG model - formerly PROTGAMMAWAG
# 200 bs replicates
# A seed value of 2 - arbitrary and can be changed
# Thread pinning off because our RC platform didn't work with pinned threads. 
