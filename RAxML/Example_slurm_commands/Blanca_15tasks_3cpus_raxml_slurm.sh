#!/bin/bash
#SBATCH --time=168:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=blanca-qsmicrobes                          # Specify testing QOS
#SBATCH --partition=blanca-qsmicrobes               # Specify Summit haswell nodes
#SBATCH --ntasks=25                              # Number of tasks per job
#SBATCH --account=blanca-qsmicrobes
#SBATCH --cpus-per-task=2
#SBATCH --job-name=raxml        # Job submission name
#SBATCH --output=qblanca_Leotio_Apr_2023_raxml_15tasks_2cpus.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         18 April 2023
# Purpose:         Raxml



# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 perl/5.24.0 jdk/1.8.0

# The directory where you want the job to run
cd /rc_scratch/caqu8258/October_analysis/Dec_analysis/Jan_single_copy/muscleout/raxml/

ulimit -c 0

# Run your program

mpirun -np $SLURM_NTASKS raxmlHPC-MPI-AVX2 -f a -s allseqs.fas -n blanca_v1_apr23_Leotio_auto_15task_3cpus_tree_100bp -m PROTGAMMAAUTO -x 8212 -N 100 -p 1176

