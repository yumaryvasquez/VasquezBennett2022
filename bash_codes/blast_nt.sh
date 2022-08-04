#!/bin/bash


for f in *.fasta 
do

echo "working on $f"

blastn -task megablast -query $f  -db /path/to/database/nt  -evalue 1e-5 -max_target_seqs 1 -outfmt  '6 qseqid staxids' -out $f.nt.megablast


done


