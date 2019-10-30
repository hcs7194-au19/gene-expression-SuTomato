Once you submitted the Batch job for Indexing, in the mean time you can edit the next script, also by using nano or the online editor from OSC:
The script looks like this (it is also available to download it through GitHub):
```
nano SubreadIndexNew.R
```
The script looks like the excerpt below (it is also available to download it through GitHub). Make sure that you modify the working directory [in ```setwd()```] and all instances corresponding to ```index```, ```readfile1```, ```readfile2``` in ```align()``` and in ```annot.ext``` and ```genome``` in ```featureCounts``` to your actual working directory.
```R
# Set up Libraries and WD
library(Rsubread)
setwd("/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread")
#
# Subread Align RNAseq Files To Rice
#
align(index="/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread/RiceIndex", readfile1="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146950_1.fastq.gz", readfile2="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146950_2.fastq.gz", input_format="gzFASTQ", output_format="BAM", output_file="ERR1146950.BAM", nsubreads=14, maxMismatches=5, nthreads=20, phredOffset=33, unique=TRUE, minFragLength=50, maxFragLength=600, PE_orientation="fr", nTrim5=0, nTrim3=0, readGroupID=NULL, readGroup=NULL, color2base=FALSE, DP_GapOpenPenalty=-1, DP_GapExtPenalty=0, DP_MismatchPenalty=0, DP_MatchScore=2)
#
align(index="/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread/RiceIndex", readfile1="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146951_1.fastq.gz", readfile2="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146951_2.fastq.gz", input_format="gzFASTQ", output_format="BAM", output_file="ERR1146951.BAM", nsubreads=14, maxMismatches=5, nthreads=20, phredOffset=33, unique=TRUE, minFragLength=50, maxFragLength=600, PE_orientation="fr", nTrim5=0, nTrim3=0, readGroupID=NULL, readGroup=NULL, color2base=FALSE, DP_GapOpenPenalty=-1, DP_GapExtPenalty=0, DP_MismatchPenalty=0, DP_MatchScore=2)
#
align(index="/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread/RiceIndex", readfile1="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146952_1.fastq.gz", readfile2="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146952_2.fastq.gz", input_format="gzFASTQ", output_format="BAM", output_file="ERR1146952.BAM", nsubreads=14, maxMismatches=5, nthreads=20, phredOffset=33, unique=TRUE, minFragLength=50, maxFragLength=600, PE_orientation="fr", nTrim5=0, nTrim3=0, readGroupID=NULL, readGroup=NULL, color2base=FALSE, DP_GapOpenPenalty=-1, DP_GapExtPenalty=0, DP_MismatchPenalty=0, DP_MatchScore=2)
#
align(index="/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread/RiceIndex", readfile1="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146953_1.fastq.gz", readfile2="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146953_2.fastq.gz", input_format="gzFASTQ", output_format="BAM", output_file="ERR1146953.BAM", nsubreads=14, maxMismatches=5, nthreads=20, phredOffset=33, unique=TRUE, minFragLength=50, maxFragLength=600, PE_orientation="fr", nTrim5=0, nTrim3=0, readGroupID=NULL, readGroup=NULL, color2base=FALSE, DP_GapOpenPenalty=-1, DP_GapExtPenalty=0, DP_MismatchPenalty=0, DP_MatchScore=2)
#
align(index="/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread/RiceIndex", readfile1="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146954_1.fastq.gz", readfile2="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146954_2.fastq.gz", input_format="gzFASTQ", output_format="BAM", output_file="ERR1146954.BAM", nsubreads=14, maxMismatches=5, nthreads=20, phredOffset=33, unique=TRUE, minFragLength=50, maxFragLength=600, PE_orientation="fr", nTrim5=0, nTrim3=0, readGroupID=NULL, readGroup=NULL, color2base=FALSE, DP_GapOpenPenalty=-1, DP_GapExtPenalty=0, DP_MismatchPenalty=0, DP_MatchScore=2)
#
align(index="/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread/RiceIndex", readfile1="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146955_1.fastq.gz", readfile2="/fs/scratch/PAS1582/YOURID/Gene_Expression/Raw_Data/ERR1146955_2.fastq.gz", input_format="gzFASTQ", output_format="BAM", output_file="ERR1146955.BAM", nsubreads=14, maxMismatches=5, nthreads=20, phredOffset=33, unique=TRUE, minFragLength=50, maxFragLength=600, PE_orientation="fr", nTrim5=0, nTrim3=0, readGroupID=NULL, readGroup=NULL, color2base=FALSE, DP_GapOpenPenalty=-1, DP_GapExtPenalty=0, DP_MismatchPenalty=0, DP_MatchScore=2)
#
fc <- featureCounts(files=c("ERR1146950.BAM", "ERR1146951.BAM", "ERR1146952.BAM", "ERR1146953.BAM", "ERR1146954.BAM", "ERR1146955.BAM"), annot.ext="/fs/scratch/PAS1582/YOURID/Gene_Expression/RiceSeq/all.gff3", isGTFAnnotationFile=TRUE, GTF.featureType="gene", GTF.attrType="ID", useMetaFeatures=TRUE, countMultiMappingReads=TRUE, fraction=TRUE, genome="/fs/scratch/PAS1582/YOURID/Gene_Expression/RiceSeq/rice_r7_masked_seqs.fasta", isPairedEnd=TRUE, autosort=TRUE, nthreads=20)
#
write.table(x=data.frame(fc$annotation[, c("GeneID","Length")], fc$counts,stringsAsFactors=FALSE), file="ERR1146950_ERR1146955_total_counts.txt", quote=FALSE, sep="\t", row.names=FALSE)
stat=data.frame(fc$stat)
write.csv(stat, "ERR1146950_ERR1146955_statsNew.csv")
#
# End
quit(save = "no", status = 0, runLast = FALSE)
```
Once you are done with the editing of this script, save your changes. To exit nano use the keys in your keyboard ```Control``` and ```X```, select a name and press ```Enter```.
Make sure that the Indexing (the Batch job that you submitted) is successfully done, to verify that :
```
head -100 SubreadIndexNew.Rout
ls -lh /fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread/
# You should have at least 5 files, one of them of more than 1 GB
```
If you have a sucessfull alignment, then you can proceed to prepare the Batch job for alignment using the following script:
```Shell
#PBS -N Rsubread_Rice_align_RNAseq
#PBS -l walltime=04:00:00
#PBS -l nodes=1:ppn=28,mem=110GB
#PBS -j oe
#PBS -m bea
#PBS -A PAS1582
#
# Move to your home directory where the job was submitted
cd $HOME
#
# Load R
#
module load R
#
# Run script
#
R CMD BATCH --quiet --no-restore --no-save ./SubreadAlignNew.R > SubreadAlignNew.OUT
#
```
We called this job as "RNA-seq: Alignment" (you can change the name in Job Option with the gear in Job Composer of OSC)
#Submit your job
