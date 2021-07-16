#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=08:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                           # Specify testing QOS
#SBATCH --partition=shas                 # Specify Summit haswell nodes
#SBATCH --ntasks=12                              # Number of tasks per job
#SBATCH --job-name=species_funtopredict        # Job submission name
#SBATCH --output=funtopredict_species.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=email@colorado.edu

# Purpose: Run through Funannotate (Docker version) clean, sort, mask, and predict.
# Updated 6/3/2021 by Tina Melie

source ~/.funrc

module load singularity

# You only need to change the next line and the last line.

singularity run --bind /scratch/summit /projects/caqu8258/software/build/funannotate_1.8.8/funannotate.sif funannotate clean -i AssemblyScaffolds.fasta -o cleaned_fun.fasta --cpus $SLURM_NTASKS;

singularity run --bind /scratch/summit /projects/caqu8258/software/build/funannotate_1.8.8/funannotate.sif funannotate sort -i cleaned_fun.fasta -o sorted_cleaned_fun.fasta;

singularity run --bind /scratch/summit /projects/caqu8258/software/build/funannotate_1.8.8/funannotate.sif funannotate mask -i sorted_cleaned_fun.fasta -o masked_sorted_cleaned_fun.fasta --cpus $SLURM_NTASKS;

singularity run --bind /scratch/summit /projects/caqu8258/software/build/funannotate_1.8.8/funannotate.sif funannotate predict -i masked_sorted_cleaned_fun.fasta -o funannotate_out --cpus $SLURM_NTASKS -s "Penicillium subrubescens" --name Penicillium_subrubescens

