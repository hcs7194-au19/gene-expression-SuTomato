# Set up Libraries and WD
library(Rsubread)
setwd("/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread")
#
# Build Index for Subread
buildindex(basename="RiceIndex", reference="/fs/scratch/PAS1582/YourID/Gene_Expression/RiceSeq/rice_r7_masked_seqs.fasta", memory=100000)
#
# End
quit(save = "no", status = 0, runLast = FALSE)
