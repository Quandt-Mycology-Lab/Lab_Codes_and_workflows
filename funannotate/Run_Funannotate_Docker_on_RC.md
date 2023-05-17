#### How to run Funannotate v.1.8.8 on RC

1. Make sure you have the following in your .bashrc profile.
``` 
export GENEMARK_PATH=/projects/caqu8258/software/build/funannotate_1.8.8/gmes_linux_64/
```
2. Load the "fun" conda environment with your funrc source file (this may take a moment).
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
singularity run  --bind /scratch/alpine /projects/caqu8258/software/build/funannotate_1.8.15/funannotate_v1_8_15.sif funannotate sort -i gb794_GB119_contigs.fasta -o gb794_sorted_clean.fas -b gb794

singularity run  --bind /scratch/alpine /projects/caqu8258/software/build/funannotate_1.8.15/funannotate_v1_8_15.sif funannotate mask -i gb794_sorted_clean.fas -o gb794_masked_sorted_cleaned.fas -s fungi --cpus 1

### Run funannotate predict in a slurm scrip with appropriate slurm headers. --force is optional. This sample was highly fragmented and --force in v1.8.8 included contigs that did not have all 4 amino acids present.
singularity run  --bind /scratch/alpine /projects/caqu8258/software/build/funannotate_1.8.15/funannotate_v1_8_15.sif funannotate predict -i gb794_masked_sorted_cleaned.fas --name TubGB794_ -o gb794_predicted.gbk --augustus_species "fusarium_graminearum" --species "Tuber_GB794" --cpus $SLURM_NTASKS --force --protein_evidence Tubme.fasta

```

 
