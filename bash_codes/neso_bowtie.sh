#!/bin/bash
#assumes each file is labeled with a 4 letter identifier (i.e., MYOM)

for f in *.fasta 
do

var=$(ls $f |rev| cut -c 13- | rev| uniq)   #change number to remove the number of characters from the file until only the 4 letter identifier is kept 
echo "working on: " ${var}
bowtie2-build ${var}_25000.fasta ${var}_index
bowtie2 -x ${var}_index --very-fast-local -k 1 -t -p 12 --reorder --mm -U ${var}.1.fq.gz,${var}.2.fq.gz -S ${var}_sam


done


