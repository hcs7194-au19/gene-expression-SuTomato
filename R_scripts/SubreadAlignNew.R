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
write.table(x=data.frame(fc$annotation[, c("GeneID","Length")], fc$counts, stringsAsFactors=FALSE), file="ERR1146950_ERR1146955_total_counts.txt", quote=FALSE, sep="\t", row.names=FALSE)
stat=data.frame(fc$stat)
write.csv(stat, "ERR1146950_ERR1146955_statsNew.csv")
#
# End
quit(save = "no", status = 0, runLast = FALSE)
