#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=06:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                           # Specify testing QOS
#SBATCH --partition=shas                 # Specify Summit haswell nodes
#SBATCH --ntasks=12                              # Number of tasks per job
#SBATCH --job-name=species_trimmomatic       # Job submission name
#SBATCH --output=trimmomatic_species.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=email@colorado.edu

# Updated:	   03 June 2021
# Purpose: 	   Trimmomatic 0.39 with Nextera adapters

# purge all existing modules
module purge

# load any modules needed to run your program
module load jdk/1.8.0_91

# Change adapter path if needed. Here's a list of available adapter files:
# IlluminaUniversal.fa TruSeq2-PE.fa TruSeq3-PE-2.fa TruSeq3-SE.fa NexteraPE-PE.fa TruSeq2-SE.fa TruSeq3-PE.fa

# Run your program
java -jar /projects/caqu8258/software/build/Trimmomatic-0.39/trimmomatic-0.39.jar PE input_forward.fastq.gz input_reverse.fastq.gz out_forward_paired.fq.gz out_forward_unpaired.fq.gz out_reverse_paired.fq.gz out_reverse_unpaired.fq.gz ILLUMINACLIP:/projects/caqu8258/software/build/Trimmomatic-0.39/adapters/NexteraPE-PE.fa:2:30:10 LEADING:3 TRAILING:15 SLIDINGWINDOW:4:10 MINLEN:36
