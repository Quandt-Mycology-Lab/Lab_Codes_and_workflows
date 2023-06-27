#!/bin/bash
#SBATCH --time=120:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=blanca-qsmicrobes                          # Specify testing QOS
#SBATCH --partition=blanca-qsmicrobes               # Specify Summit haswell nodes
#SBATCH --ntasks=20                              # Number of tasks per job
#SBATCH --account=blanca-qsmicrobes
#SBATCH --cpus-per-task=2
#SBATCH --job-name=raxml_template        # Job submission name
#SBATCH --output=qblanca_your_job_deets_here.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=user@colorado.edu

# Updated:         19 May 2023
# Purpose:         Raxml



# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 perl/5.24.0 jdk/1.8.0

# The directory where you want the job to run (OPTIONAL)
cd /rc_scratch/caqu8258/Laboul_tree/

ulimit -c 0

# Run your program

mpirun -np $SLURM_NTASKS raxmlHPC-MPI-AVX2 -f a -s allseqs_laboul.fas -n blanca_v1_may23_Laboul_auto_20task_2cpus_tree_100bp -m PROTGAMMAAUTO -x 8212 -N 100 -p 1176

