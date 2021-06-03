#### How to run Funannotate v.1.8.8 on RC

1. Make sure you have the following in your .bashrc profile
``` 
export GENEMARK_PATH=/projects/caqu8258/software/build/funannotate_1.8.8/gmes_linux_64/
```
2. Load the "fun" conda environment with your funrc source file
```
source ~/.funrc
```

3. Load the singularity module
``` 
module purge
module load singularity
```

4. Run Funannotate workflow using format below - see workflow file for specific usage examples

```
singularity run  --bind /scratch/summit /projects/caqu8258/software/build/funannotate_1.8.8/funannotate.sif funannotate annotate
singularity run  --bind /scratch/summit /projects/caqu8258/software/build/funannotate_1.8.8/funannotate.sif funannotate predict

```

 
