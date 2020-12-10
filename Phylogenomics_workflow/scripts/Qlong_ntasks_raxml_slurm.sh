#!/bin/bash
#SBATCH --time=96:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=long                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=50                              # Number of tasks per job
#SBATCH --cpus-per-task=3
#SBATCH --account=ucb114_summit1     # Use Quandt Genomics Allocation
#SBATCH --job-name=raxml        # Job submission name
#SBATCH --output=qlonger_Leotio_December_2019_raxml.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         6 December 2019
# Purpose:         Raxml



# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 perl/5.24.0 jdk/1.8.0

# The directory where you want the job to run
cd /scratch/summit/caqu8258/Leotiomycetes/single_copy_protortho_clusters/muscle_out/raxml/

ulimit -c 0

# Run your program

mpirun -np $SLURM_NTASKS raxmlHPC-MPI-AVX2 -f a -s allseqs.fas -n longq_Second_Leotio_50task_3cpus_tree_100bp -m PROTGAMMAAUTO -x 8212 -N 100 -p 1176

