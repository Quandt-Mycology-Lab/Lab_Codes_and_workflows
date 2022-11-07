#!/bin/bash

files=$(ls *.out)

for i in $files
do
echo " clipkit  ${i} -o ${i}.clipkit"
done
