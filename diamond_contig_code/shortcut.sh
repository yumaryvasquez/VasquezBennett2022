#!/bin/bash


#############Below is to input text file output from DIAMOND##############

#reads in user path
echo Path to txt file
read txtfile


#cuts extra info, adds ">" and deletes multiples
cut -f 1 $txtfile| sed 's/^/>/' | uniq -d > test.txt



#creates array from text file
arr=()
while IFS= read -r line;
do
    arr+=("$line")
done < test.txt



#############Below is to input contig fasta file############## 


#reads in user path
echo Path to fasta file
read fastafile


#creates array from fasta file
arra=()
while IFS= read -r line;
do
    arra+=("$line")
done < $fastafile





#############Below is to perform contig extraction############## 

#creates intersection array
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


#echo 'Intersection:'
#printf '%s\n' "${intersections[@]}"

echo Please put file name:
read filename
printf '%s\n' "${intersections[@]}" >> $filename.fasta




















#echo ${intersections[@]}


#for i in ${arra[@]}; do                                                                                                                                                                                
#    for j in "${arr[@]}"; do                                                                                                                                                                           
#       if [[ $i = $j ]]; then                                                                                                                                                                          
#           intersections+=("$i")                                                                                                                                                                       
#       fi                                                                                                                                                                                              
#    done                                                                                                                                                                                               
#done   











#echo "${arra[4]}"                                                                                                                                                                                      
#echo "${arra[6]}"                                                                                                                                                                                      
#echo "${arr[0]}"                                                                                                                                                                                        
#echo ${arra[@]} > test.txt                                                                                                                                                                              
#echo ${arr[@]} > test1.txt 





#echo "${arra[0]}"                                                                                                                                         
#echo "${arra[1]}"                                                                                                                                         

#echo Finding matches                                                                                                                                      

#if [[grep ">" $fastafile == "${arr[*]}"]];                                                                                                                
#then echo "yes"                                                                                                                                           
#fi 