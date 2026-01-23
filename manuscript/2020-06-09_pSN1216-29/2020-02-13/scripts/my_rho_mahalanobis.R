# Usage: Rscript --vanilla scripts/my_rho_mahalanobis.R "${seq1}" "${seqs}" "${wordsize}" "${windowsize}"
# Usage: Rscript --vanilla scripts/my_rho_mahalanobis.R "data/AP018710.fna" "data/my.Chromosome.KEP.fna" 3 5000 >& log.$(date +%F).txt

# clear the decks
rm(list = ls())

# Extract Command Line Arguments
args <- commandArgs(trailingOnly = TRUE)
print(args)

file_seq1 <- args[1] # file_seq1 <- "data/AP018710.fna"
file_seqs <- args[2] # file_seqs <- "data/myChromosomes.fna"
wordsize <- args[3] # wordsize <- 3
windowsize <- args[4] # windowsize <- 5000 
#file_seq1 <- "data/AP018710.fna"; file_seqs <- "data/my.Chromosome.KEP.fna"; wordsize <- 3; windowsize <- 5000

file_seq1
file_seqs
wordsize <- as.numeric(wordsize); wordsize
windowsize <- as.numeric(windowsize); windowsize

# Load packages
library(seqinr)
library(zoo) # rollapply
library(MASS) # ginv
library(tidyverse) # dplyr::arrange
#suppressMessages(library(DECIPHER))

# read.fasta
seq1 <- read.fasta(file=file_seq1, seqtype="DNA", strip.desc=TRUE)
seqs <- read.fasta(file=file_seqs, seqtype="DNA", strip.desc=TRUE)

# getAnnot
Annotation <- unlist(getAnnot(seqs))
myName <- getName(seqs)

# Apply a Function over a List
Length <- sapply(seqs, length) # Length of a DNA sequence
GCcontent <- round( sapply(seqs, GC) , digits=3) # Global G+C content

# data frame
df <- data.frame(Length, GCcontent, Annotation)
write.csv(df, file = "table_df.csv", quote=TRUE, row.names=FALSE)

# plasmid rho
#X <- rollapply(data = seq1[[1]], width = windowsize, by = windowsize, FUN = function(x) rho(c(x, ' ', rev(comp(x))), wordsize = wordsize) )
#X <- apply(X,2,mean)
X <- as.vector( rho(c(seq1[[1]], ' ', rev(comp(seq1[[1]]))), wordsize = wordsize) )

# plasmid-chromosome distance
dX <- dY <- c()
Distance <- P_value <- vector("list", length(seqs))
system("mkdir -p my_rho/")
for (i in seq_along(seqs)) {
  #i <- 1
  Y <- rollapply(data = seqs[i][[1]], width = windowsize, by = windowsize, FUN = function(x) rho(c(x, ' ', rev(comp(x))), wordsize = wordsize) )
  if(nrow(Y) < ncol(Y)){ dX <- dY <- "nrow_lt_ncol" } else { 
    #dX <- try(mahalanobis(X, center=apply(Y,2,mean), cov=var(Y)), silent=FALSE)
    #dY <- try(mahalanobis(Y, center=apply(Y,2,mean), cov=var(Y)), silent=FALSE)
    dX <- try(mahalanobis(X, center=apply(Y,2,mean), cov=ginv(var(Y)), inverted=TRUE), silent=FALSE)
    dY <- try(mahalanobis(Y, center=apply(Y,2,mean), cov=ginv(var(Y)), inverted=TRUE), silent=FALSE)
  }
  Distance[[i]] <- ifelse(is.numeric(dX), dX, NA)
  P_value[[i]] <- ifelse(is.numeric(dY), mean(dY > dX), NA)
  write.csv(round(Y,2), file = paste0("my_rho/",myName[i],".k",wordsize,".w",windowsize,".csv"), quote=TRUE, row.names=FALSE)
}
Distance <- unlist(Distance); names(Distance) <- Annotation; #sort(Distance)
P_value <- unlist(P_value); names(P_value) <- Annotation; #sort(P_value)
df <- data.frame(Distance, P_value, Annotation)
write.table(df, file = paste0("table.",basename(file_seq1),".k",wordsize,".w",windowsize,".txt"), sep="\t", quote=FALSE, row.names=FALSE)
write.csv(df %>% dplyr::arrange(Distance), file = paste0("table.",basename(file_seq1),".k",wordsize,".w",windowsize,".csv"), quote=TRUE, row.names=FALSE)

