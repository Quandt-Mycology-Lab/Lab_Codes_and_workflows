#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=12:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --partition=amilan               # Specify Alpine nodes
#SBATCH --ntasks=12                              # Number of tasks per job
#SBATCH --job-name=trimAL        # Job submission name
#SBATCH --output=trimAL_Leotio_2023_v1.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

#Purpose: running trimAL on the muscle output
#Updated: 7-12-23

module purge
module load gcc/11.2.0
module load openmpi/4.1.1
module load loadbalance
 
export PATH=/projects/caqu8258/software/local/alpine/bin:$PATH
mpirun lb lb_cmd_trimal 