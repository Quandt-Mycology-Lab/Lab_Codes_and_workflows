
#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=20:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=8                              # Number of tasks per job
#SBATCH --job-name=clipkit        # Job submission name
#SBATCH --output=clipkit_v1.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=username@colorado.edu

# Updated:         Oct 29 2022
# Purpose:         ClipKit to trim muscle output


# Purpose:         ClipKit to trim muscle output


# purge all existing modules
ml purge


# load any modules needed to run your program
module load anaconda
conda activate /projects/caqu8258/software/build/clipkit_env
module load loadbalance

mpirun lb lb_cmd_clipkit

