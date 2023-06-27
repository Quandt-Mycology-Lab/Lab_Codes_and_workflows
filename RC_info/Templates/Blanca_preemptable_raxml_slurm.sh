#!/bin/bash
#SBATCH --time=24:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=preemptable                          # Specify testing QOS
#SBATCH --partition=<name-of-partition-you-want-to-run-on>              # Specify Summit haswell nodes
#SBATCH --ntasks=15                              # Number of tasks per job
#SBATCH --account=blanca-curc
#SBATCH --cpus-per-task=6
#SBATCH --job-name=raxml        # Job submission name
#SBATCH --output=qblanca_change_me.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=user@colorado.edu

# Updated:         18 April 2023
# Purpose:         Raxml



# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 perl/5.24.0 jdk/1.8.0

# The directory where you want the job to run
cd /rc_scratch/identikey/dir/

ulimit -c 0

# Run your program

mpirun -np $SLURM_NTASKS raxmlHPC-MPI-AVX2 -f a -s allseqs.fas -n blanca_v1_apr23_Leotio_auto_15task_3cpus_tree_100bp -m PROTGAMMAAUTO -x 8212 -N 100 -p 1176

