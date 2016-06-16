cat("\n  This R script analyzes FASTA format sequences of Nucleic Acids (`.fna`).\n\n")

# Extract Command Line Arguments
args <- commandArgs(trailingOnly = TRUE)
myfile <- args[1]
wordsize <- 2
windowsize <- 5000

# Set Working Directory
#setwd("~/projects/plasmids/")

# Loading packages
library(seqinr)
library(zoo) # rollapply

# Reading sequence data into R
#myfile <- "data/NC_007322.fna" # NC_007322: Bacillus anthracis str. 'Ames Ancestor' plasmid pXO1
lna <- read.fasta(file = myfile, seqtype = c("DNA"))

cat("# How many sequences\n")
length(lna)

# Get sequence annotations
unlist(getAnnot(lna))

# Access the n-th element of the list
dna <- lna[[1]]
summary(dna)

# rho
y <- rollapply(data = dna, width = windowsize, by = windowsize, FUN = function(x) rho(c(x, ' ', rev(comp(x))), wordsize = wordsize) )
rownames(y) <- seq(from = 1, to = length(dna)-windowsize, by = windowsize)

x <- rho(dna)
z <- rbind(x, y)
rownames(z)[1] <- unlist(getAnnot(lna))

# Exporting Data
#write.csv(round(z, 2), file=paste0(myfile, ".rho.csv"))
write.csv(round(z, 2), file=paste0(myfile,".rho",wordsize,".",windowsize,".csv"))













