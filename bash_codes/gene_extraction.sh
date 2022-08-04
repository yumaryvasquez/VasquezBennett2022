#!/bin/bash


#takes in a fasta file with the name of the gene, the sample name and the sequence
#    Example: gene1,Psychotria_Molakai,GACTTGGTAGCTCAGTTGGTAGAGCATTACACTTTTAATGTAAGGGTCCTGGGTTCGAGACCCAGCCAGGTCACAC
#             gene1,Scaevola_Kauai,GACTTGGTAGCTCAGTTGGTAGAGCATTACACTTTTAATGTAAGGGTCCTGGGTTCGAGACCCAGCCAGGTCACAA
#             gene2, Psychotria_Molakai,ATTGGTGATTATAGCAACAAGGATCCACCTCTTTCCATTCCGAACAGAGAAGTTAAATTTGTTAGCGCCGATG
#             gene2, Scaevola_Kauai,ATTGGTGATTATAGCAACAAGGATCCACCTCTTTCCATTCCGAACAGAGAAGTTAAATTTGTTAGCGCCGATGGTACT 

fastafile=/path/to/fastafiles/genes_grouped

#takes in text file of a list of genes (does not need to be processed)
geneinput=/path/to/list/of/genes


#removes duplicates and anything following a space
sed 's/\// /'  $geneinput |  cut -d ' ' -f 1  |  uniq  > temp_text

filename='temp_text'



#groups together sequences based on name and creates a new csv with sequences, can be further used for alignment
while read t; do
    grep "$t" $fastafile > "$t".csv
    echo "$t" is done
done < $filename









