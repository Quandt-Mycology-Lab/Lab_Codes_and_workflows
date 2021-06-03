
 ##### Fasterq-dump: SRAtoolkit v2.11.0 ########

****By Alisha Q.**** 
Updated 06/03/2021 by Tina Melie
 
Optional: You may need to run this command first to stop your home directory from filling up with temporary files.
```
echo '/repository/user/main/public/root = "/scratch/summit/$USER/sra-cache"' > ~/.ncbi/user-settings.mkfg'
```
Run fasterq-dump:
```
/projects/caqu8258/software/build/sratoolkit.2.11.0-ubuntu64/bin/fasterq-dump.2.11.0 SRR5206992 --skip-technical --split-files --temp /scratch/summit/chjo1591/temp --outdir output_dir --threads 12 -p
 ```
 Files should begin downloading immediately. The time varies A LOT based on the number of reads you are downloading.
 ```
 # --skip-technical = Technical reads (if present) will be removed. 
 # --split-files = write reads into different files
 # --temp = the temporary file to write intermediate files. This doesn't have to be your current directory. 
 # --outdir = output directory to be created by program and filled with final output files
 # --threads = number of threads to use
 # -p = shows progress 
 ```
 
