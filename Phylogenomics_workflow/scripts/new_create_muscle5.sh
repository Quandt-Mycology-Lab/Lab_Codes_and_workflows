#!/bin/bash
 
files=$(ls *.fasta)
 
for i in $files
do
echo "muscle5.1.linux_intel64 -align ${i} -output ${i}.out"
done
 
