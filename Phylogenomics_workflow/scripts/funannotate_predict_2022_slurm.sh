#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=24:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                           # Specify testing QOS
#SBATCH --partition=shas                 # Specify Summit haswell nodes
#SBATCH --ntasks=12                              # Number of tasks per job
#SBATCH --job-name=Pilace_fun_predict        # Job submission name
#SBATCH --output=funtopredict_Pilace.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Purpose: Run through Funannotate (Docker version) clean, sort, mask, and predict.
# Updated April 2022

source ~/.funrc

module load singularity

# You only need to change the next line and the last line.

singularity run --bind /scratch/summit /projects/caqu8258/software/build/funannotate_1.8.8/funannotate.sif funannotate predict -i masked_sorted_Pilace.fas -o Funannotate_predict_out --cpus $SLURM_NTASKS -s "Pilidium acerinum" --name Piliacer_  --protein_evidence ../../Leo_prots.fas
