Once the alignment has run, login in OSC, verify that you have gotten the file counts file:
```
cd $HOME
ls
nano ERR1146950_ERR1146955_total_counts.txt
```
Edit the headers by deleting X.fs.scratch.PAS1582.YOURID.Gene_Expression.Rsubread. in each column header. Save your file. Then, copy the file to your home directory to begin the differential expression analysis:
```
cd $HOME
cp fs/scratch/PAS1582/YOURDIR/Gene_Expression/Rsubread/ERR1146950_ERR1146955_total_counts.txt .
```
Request computing resources:
```
qsub -I -l nodes=1:ppn=28 -l walltime=02:00:00 -A PAS1582
```
Then, you will start to work in R:
```R
library(edgeR)
exp <- read.delim("ERR1146950_ERR1146955_total_counts.txt", header=TRUE, row.names=”GeneID”)
rcgrp <- factor(c(3,1,1,1,2,2,2))
y <- DGEList(counts = exp, group = rcgrp)
y$samples
 
design <- model.matrix(~rcgrp)
y <- estimateGLMCommonDisp(y,design)
y <- estimateGLMTrendedDisp(y,design)
y <- estimateGLMTagwiseDisp(y,design)
 
TestDE <- exactTest(y, pair = c(2,1))
topTags(TestDE)
 
deTestDE <- decideTestsDGE(TestDE, adjust.method = “BH”, p.value = 0.05)
summary(deTestDE)
 
table_TestDE <- topTags(TestDE, n=55986)
write.csv(table_TestDE, “DE_ERR1146950_ERR1146955New.csv”)
quit("no")
```
Once it is done, look for the file in DE_ERR1146950_ERR1146955New.csv in your home directory and open it using the OSC editor or download it to your own computer to make the visualization easier.
