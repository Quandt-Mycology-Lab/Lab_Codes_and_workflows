
 ##### Fasterq-dump: SRAtoolkit v2.11.0 ########

****By Alisha Q.**** 
Updated 06/03/2021 by Tina Melie
 
Optional: You may need to run this command first to stop your home directory from filling with temporary files.
```
echo '/repository/user/main/public/root = "/scratch/summit/$USER/sra-cache"' > ~/.ncbi/user-settings.mkfg'
```
Run fasterq-dump:
```
/projects/caqu8258/software/build/sratoolkit.2.11.0-ubuntu64/bin/fasterq-dump.2.11.0 --skip-technical SRR7535523 -e 8 --temp /scratch/summit/$USER/temp
 ```
 Files should begin downloading immediately. The time varies A LOT by the number of reads you are downloading.
 ```
 #--skip-technical = Technical reads (if present) will be removed. 
 #-e = number of threads to use
 #-O = Output directory to be created by program and filled with final output files
 ```
