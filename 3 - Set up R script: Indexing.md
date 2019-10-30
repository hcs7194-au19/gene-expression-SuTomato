Go to home:
```
cd $HOME
# make sure where you are:
# pwd
```
Copy R codes to Home Directory
```
cp /fs/scratch/PAS1582/YOURID/Gene_Expression/Rcodes/R.* .
```
Open the R script for the index builder, you can use Nano or the editor available through OSC (remember saving changes):
```
nano SubreadIndexNew.R
```
The script looks like this (it is also available to download it through GitHub):
```R
# Set up Libraries and WD
library(Rsubread)
setwd("/fs/scratch/PAS1582/YOURID/Gene_Expression/Rsubread")
#
# Build Index for Subread
buildindex(basename="RiceIndex", reference="/fs/scratch/PAS1582/YOURID/Gene_Expression/RiceSeq/rice_r7_masked_seqs.fasta", memory=100000)
#
# End
quit(save = "no", status = 0, runLast = FALSE)
```

Make sure that you modify the working directory [in setwd() and buildindex()] to your actual working directory. To exit nano use the keys in your keyboard ```Control``` and ```X```, select a name and press ```Enter```

Now make produce your Batch script to produce index files using OSC infrastructure using the job composer. The script should look like this:
```Shell
#PBS -N Rsubread_Index_Rice
#PBS -l walltime=00:10:00
#PBS -l nodes=1:ppn=28,mem=110GB
#PBS -j oe
#PBS -m bea
#PBS -A PAS1582
#
# Move to your home directory where the job was submitted
cd $HOME
#
# Load R
module load R
#
# Run script
R CMD BATCH --quiet --no-restore --no-save ./SubreadIndexNew.R > SubreadIndexNew.OUT
#
```
We called this job as "RNA-seq: Indexing" (you can change the name in Job Option with the gear in Job Composer of OSC)
#Submit your job
