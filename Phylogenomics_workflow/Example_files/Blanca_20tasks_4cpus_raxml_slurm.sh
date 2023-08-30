#!/bin/bash
#SBATCH --time=168:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=blanca-qsmicrobes                          # Specify testing QOS
#SBATCH --partition=blanca-qsmicrobes               # Specify Summit haswell nodes
#SBATCH --ntasks=20                              # Number of tasks per job
#SBATCH --account=blanca-qsmicrobes
#SBATCH --cpus-per-task=4
#SBATCH --job-name=raxml        # Job submission name
#SBATCH --output=qblanca_Leotio_Aug_2023_raxml_20tasks_3cpus.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         23 Aug 2023
# Purpose:         Raxml



# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 perl/5.24.0 jdk/1.8.0

# The directory where you want the job to run
cd /rc_scratch/caqu8258/October_analysis/Dec_analysis/Jan_single_copy/muscleout/raxml/

ulimit -c 0

# Run your program

mpirun -np $SLURM_NTASKS raxmlHPC-MPI-AVX2 -f a -s allseqs.fas -n blanca_v2_aug23_Leotio_auto_20task_4cpus_tree_200bp -m PROTGAMMAAUTO -x 8212 -N 200 -p 1176

