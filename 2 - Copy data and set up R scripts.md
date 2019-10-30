Set up directories in your scratch space:
```
cd /fs/scratch/PAS1582/YOURDIRECTORY/
mkdir Gene_Expression
```
Then make a new directory for gene Gene Expression and subdirectories:
```
cd Gene_Expression
mkdir RiceSeq Raw_Data Rcodes Rsubread
```
Then copy the data to the corresponding directories
```
cd RiceSeq
cp /fs/scratch/PAS1582/HCS7194_Files/Gene_Expression/RiceSequence/rice_r7_masked_seqs.fasta .
cp /fs/scratch/PAS1582/HCS7194_Files/Gene_Expression/RiceSequence/all.gff3 .
cp /fs/scratch/PAS1582/HCS7194_Files/Gene_Expression/RiceSequence/md5sum.md5 .
```
Check the integrity of the files (it is very important, the md5dum file is the only one that should fail):
```
md5sum -c md5sum.md5
```
Check the fasta and gff files:
```
head -n 10 rice_r7_masked_seqs.fasta  #Notice how the chromosome is listed >Chr1
head -n 10 all.gff3
```
Copy the R scripts in their appropriate locations:
```
cd ..
cd Rcodes
cp /fs/scratch/PAS1582/HCS7194_Files/Gene_Expression/Rcodes/*.R .
cd ..
cd Raw_Data
cp /fs/scratch/PAS1582/HCS7194_Files/Gene_Expression/Raw_Data/*.* .
ls
# Check integrity of the raw files
md5sum -c md5sum.md5
```
