#!/bin/bash
#SBATCH --nodes=1                            # Number of requested nodes
#SBATCH --time=23:59:00                       # Max wall time
#SBATCH --qos=normal                   		 # Specify testing QOS
#SBATCH --partition=smem            		# Specify Summit haswell nodes
#SBATCH --ntasks=12                            # Number of tasks per job
#SBATCH --job-name=species_spades       # Job submission name
#SBATCH --output=spades_species.%j.out  # Output file name with Job ID
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=email@colorado.edu

# Updated:	   06 June 2021
# Purpose: 	   Spades on smem

# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 mkl/11.3.3 perl/5.24.0 jdk/1.8.0

# compute memory limit based on number of cores requested
MEM_LIMIT=$(echo "scale=0; $SLURM_NTASKS*42.741/1" | bc -l)

# Commands for paired-end data.
# Add --meta flag for metagenomic data.

/projects/caqu8258/software/build/SPAdes-3.15.2/bin/spades.py --pe1-1 forward.fq.gz --pe-1-2 reverse.fq.gz -t $SLURM_NTASKS -m $MEM_LIMIT -o output_folder
