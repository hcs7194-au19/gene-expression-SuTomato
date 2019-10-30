Open OnDemand on Owens, 1 core (login node), you can also connect from your terminal by using ssh:
```
ssh -X username@owens.osc.edu
```
Make sure you are in your Home Directory by using:
```
cd $HOME
# check where you actually are:
# pwd
```
Then load and execute R
```
module load R
R
```
Add Bioconductor and then the Rsubread , Rbowtie2, and edgeR package:
 ```
source("https://bioconductor.org/biocLite.R")
biocLite()
 ```
There may be a couple of questions to answer, just type "y" (without quatations):
```
Warning in install.packages(“BiocInstaller”, repos = a[“BioCsoft”, “URL”]) :
 ‘lib = “/usr/local/R/intel/18.0/3.5.0/lib64/R/library”’ is not writeable
Would you like to create a personal library instead? (y/n)   y
 ~/R/x86_64-unknown-linux-gnu-library/3.5 to install packages into? (y/n)   y
 ```
Then install Rsubread, Rbowtie2 and edgeR:
```
biocLite("Rsubread")  # Some packages may not be updated
biocLite("Rbowtie2") # Some packages may not be updated
biocLite("edgeR") # Some packages may not be updated
```
Now you can quit R without saving the workspace image:
```
quit("no")
#Equivalent to quit and not to save workspace image
```
Make sure that in your home directory you have an R folder
```
ls
ls R
ls R/x86_64-pc-linux-gnu-library/3.5
```
You should have there at least 6 subdirectories
