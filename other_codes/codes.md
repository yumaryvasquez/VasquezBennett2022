# Codes



Codes used in assembly:

### Trimmomatic (v 0.38):  

```
java -jar /path/to/Trimmomatic-0.38/trimmomatic-0.38.jar PE -phred33 S1_R1_001.fastq S1_R2_001.fastq out.paired.1.fq.gz out.paired.2.fq.gz out.unpaired.1.fq.gz out.unpaired.2.fq.gz ILLUMINACLIP:/path/to/Trimmomatic-0.38/adapters/TruSeq3-PE-2.fa:2:20:10:1:true LEADING:15 TRAILING:15 SLIDINGWINDOW:4:15 MINLEN:50
```

### SPAdes (v 3.12.0): to be used on the cluster. Run time about 1:00:00 to 1:30:00 for each

needs edits to include array

```
#!/bin/bash
#SBATCH --mail-user=username@ucmerced.edu
#SBATCH --mail-type=ALL
#SBATCH -n 20
#SBATCH -p std.q 
#SBATCH --time=0-20:00:00   
#SBATCH --output=output.qlog
#SBATCH --job-name=output_1
#SBATCH --export=ALL


python spades.py -1 /path/to/S1.paired.1.fq -2 /path/to/.paired.2.fq -k 127 --only-assembler --meta -o /path/to/output/file
```

### RAST command line 

```

rast-create-genome --scientific-name "Candidatus sulcia" --genetic-code 11 --domain Bacteria --contigs /path/to/contigs/sequence.fasta > /path/to/output.gto 


rast-process-genome < /path/to/output.gto > /path/to/output.gto2




rast-export-genome genbank < /path/to/output.gto2 > /path/to/output.gbk

```


### Arrays
```
#!/bin/bash      
#SBATCH --mail-user=username@ucmerced.edu
#SBATCH --mail-type=ALL                                                                                                    
#SBATCH -n 1                                                                                                                       
#SBATCH -p fast.q                                                                                                                   
#SBATCH --time=0-04:00:00                                                                                                     
#SBATCH --output=output%A_%a.qlog                                                                                           
#SBATCH --job-name=output                                                                                                     
#SBATCH --export=ALL                                                                                                        
#SBATCH --array=1-23                                                                                                                                                                                                       

source ~/.bashrc

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

f=$(ls *.fastq | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)

echo "Mapping: " $f

bowtie2 --local -x reference --interleaved $f -S $f.sam
```

