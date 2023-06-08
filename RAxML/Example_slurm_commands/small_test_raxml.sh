#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=4:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --partition=amilan                 # Specify Summit haswell nodes
#SBATCH --ntasks=6                              # Number of tasks per job
#SBATCH --job-name=Raxml_test        # Job submission name
#SBATCH --output=raxml_test.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         18 April 2023
# Purpose:         Raxml test



# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 perl/5.24.0 jdk/1.8.0

# The directory where you want the job to run
cd /scratch/alpine/caqu8258/October_analysis/Dec_analysis/Jan_single_copy/muscleout/raxml/

ulimit -c 0

# Run your program

mpirun -np $SLURM_NTASKS raxmlHPC-MPI-AVX2 -f a -s allseqs.fas -n TESTING_blanca_v1_apr23_Leotio_auto_15task_3cpus_tree_100bp -m PROTGAMMAAUTO -x 8212 -N 100 -p 1176

