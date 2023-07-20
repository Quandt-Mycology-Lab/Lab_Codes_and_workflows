#!/bin/bash
#SBATCH --time=168:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=blanca-qsmicrobes                          # Specify testing QOS
#SBATCH --partition=blanca-qsmicrobes               # Specify Summit haswell nodes
#SBATCH --ntasks=30                            # Number of tasks per job
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=5g				# raises the ram per task from default 2g to 5g
#SBATCH --account=blanca-qsmicrobes
#SBATCH --job-name=raxml        # Job submission name
#SBATCH --output=test.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=user@colorado.edu

# Updated:         19 July 2023
# Purpose:         Raxml

# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 perl/5.24.0 jdk/1.8.0

# The directory where you want the job to run
#cd /rc_scratch/mach3467/

ulimit -c 0

# Run your program

export PATH=/projects/caqu8258/software/local/bin:$PATH
#mpirun raxmlHPC-MPI-AVX2 -f a -s allseqs.fas -n blanca_v1_jul23_Tuber_60_auto_15task_3cpus_tree_100bp -m PROTGAMMAAUTO -x 8212 -N 100 -p 1176
mpirun -np $SLURM_NTASKS raxmlHPC-MPI-AVX2 -f a -s pseudogymnoascus_ITS_muscleout5_trim.fas -n pseudotree_v1_gtrgamma_200bs_2 -m GTRGAMMA -x 8212 -N 200 -p 1176
