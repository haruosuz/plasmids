cat("\n  This R script analyses BLAST output.\n\n")

# Set Working Directory
#setwd("~/projects/plasmids/analysis/")

## BLAST output file
blast <- read.delim('blast.out', header = FALSE, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "#", col.names=c("query id", "subject id", "% identity", "alignment length", "mismatches", "gap opens", "q. start", "q. end", "s. start", "s. end", "evalue", "bit score"))

## tblastn_sbjct_count.txt
sbjct <- read.delim('tblastn.sbjct.count.txt', header = FALSE, row.names = 1)
barplot(head(sbjct[,1], 100))
abline(h = max(sbjct[,1]) * 0.5)

