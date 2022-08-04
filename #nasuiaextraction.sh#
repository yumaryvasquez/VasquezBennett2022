#!/bin/bash

temp_nasuia=$(mktemp)
temp_text=$(mktemp)
temp_fasta=$(mktemp)



fastafile=/home/yvasquez8/data/Nesophrosyne/PIPH/contigs.fasta
diamondoutput=/home/yvasquez8/data/nr_database/piph/contigs_test.m8 
codeoutput=/home/yvasquez8/data/nr_database


diamond blastx -d nr -q $fastafile -o $diamondoutput -f 6 qseqid sseqid evalue pident length bitscore qstart qend stitle -k 5 -e 0.00001



printf '%s\n' "Currently working on grepping"

grep "Candidatus Nasuia" $diamondoutput > $temp_nasuia


printf '%s\n' "Grep finished"


cut -f 1 $temp_nasuia| sed 's/^/>/' | uniq -d > $temp_text

printf '%s\n' "Making arrays"

arr=()
while IFS= read -r line;
do
    arr+=("$line")
done < $temp_text





printf '%s\n' "Fixing fasta file"

cat $fastafile | awk '{if (substr($0,1,1)==">"){if (p){print "\n";} print $0} else printf("%s",$0);p++;}END{print "\n"}' > $temp_fasta





arra=()
while IFS= read -r line;
do
    arra+=("$line")
done < $temp_fasta




printf '%s\n' "Performing matches"

intersections=()



for ((i=0; i<=${#arra[@]}; i++)); do                                                           
    line=${arra[i]}
    for j in "${arr[@]}"; do                                                                    
       if [[ ${line} = $j ]]; then
           intersections+=("$line") 
	   line="${arra[i+1]}"  #prints out next line (typically sequence)
	   intersections+=("$line")
       fi                                                                                       
    done                                                                                      
done   


printf '%s\n' "Almost done"

rm ${temp_nasuia}
rm ${temp_text}
rm ${temp_fasta}


printf '%s\n' "${intersections[@]}" >> $codeoutput/output_test.fasta  


















