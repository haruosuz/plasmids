cat("\n  This R script analyzes FASTA format sequences of Nucleic Acids (`.fna`).\n\n")

# Extract Command Line Arguments
args <- commandArgs(trailingOnly = TRUE)
myfile <- args[1]

# Loading packages
library(seqinr)
library(zoo) # rollapply

# Set Working Directory
#setwd("~/projects/plasmids/")

# Reading sequence data into R
#myfile <- "data/NC_007322.fna"
#myfile <- "data/NC_007414.fna"

lna <- read.fasta(file = myfile, seqtype = c("DNA"))

cat("# How many sequences\n")
length(lna)

# Get sequence annotations
getAnnot(lna)

# Access the n-th element of the list
dna <- lna[[1]]
summary(dna)

# rho
windowsize <- 1000000; windowsize <- 5000
#y <- rollapply(data = dna, width = windowsize, by = windowsize, FUN = function(x) rho(c(x, rev(comp(x))), wordsize = 2) )
y <- rollapply(data = dna, width = windowsize, by = windowsize, FUN = function(x) rho(c(x, ' ', rev(comp(x))), wordsize = 2) )
rownames(y) <- seq(from = 1, to = length(dna)-windowsize, by = windowsize)

x <- rho(dna)
z <- rbind(x, y)

# Exporting Data
write.csv(round(z, 2), file=paste0(myfile, ".rho.csv"))
