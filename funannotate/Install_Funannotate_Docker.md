## Funannotate Docker Installation instructions
Assuming John is still pushing Docker versions of Funannotate in the future, we should be able to do this and have an updated version with no problems.

1. Make a new folder named after the new version. Follow the instructions below and then 
```
module load singularity
```
2. This stops your home folder from filling up with temp files and stopping the download.
```
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER
```
3. Make sure this is current
```
singularity pull --name=funannotate.sif docker://nextgenusfs/funannotate
```
# This should print out 
"INFO: Converting OCI blobs to SIF format
INFO: Starting build...
Getting image source signatures
Copying blob e22122b926a1 done...." and more stuff "INFO: Creating SIF file..."

There should be a funannotate.sif file. Call this to run funannotate. Don't forget to still use the funannotate command:
```
/projects/caqu8258/software/build/funannotate_1.8.8/funannotate.sif funannotate annotate
```
I also have been using the "fun" environment for all of those wacky dependencies.
```
source ~/.funrc
```
I recommend running funannotate test and funannotate check after this to make sure everything is there to run the program. 

 
