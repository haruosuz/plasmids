cat("\n  This R script analyses plasmids.txt.\n\n")

# set the working directory
#setwd("~/projects/plasmids/")

# Loading Data into R
file.name <- "data/plasmids.txt"
if (file.access(file.name) == 0) {
 d.f <- read.delim(file.name, stringsAsFactors=FALSE, na.strings="-", check.names=FALSE)
} else {
 d.f <- read.delim("ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/plasmids.txt", stringsAsFactors=FALSE, na.strings="-", check.names=FALSE)
}

cat("# Exploring Dataframes\n")
dim(d.f)
head(d.f, n=2)
colnames(d.f)

cat("# Data Summary\n")
summary(d.f)

# Exporting Data
write.table(table(d.f[,"Kingdom"]), file="analysis/table.plasmids.Kingdom.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(table(apply(d.f[,c("Kingdom","Group")], 1, paste, collapse=';')), file="analysis/table.plasmids.Kingdom.Group.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(table(apply(d.f[,c("Kingdom","Group","SubGroup")], 1, paste, collapse=';')), file="analysis/table.plasmids.Kingdom.Group.SubGroup.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)

# Exploring Data Visually
pdf("analysis/Rplots.plasmids.txt.pdf")#, pointsize=10)

par(mfcol=c(2,2))
x <- "Size (Kb)"
y <- "GC%"
hist(d.f[,x], xlab = x, main = "Histogram")
hist(d.f[,y], xlab = y, main = "Histogram")
plot(d.f[,x], d.f[,y], xlab = x, ylab = y)

#install.packages("psych")
library(psych)
pairs.panels(d.f[,c(x,y)])

# barplot
par(mfrow=c(1,1), mar=c(4,10,2,1), cex=1) # mar=c(bottom, left, top, right)
barplot(sort(table(d.f[,"Kingdom"])), horiz=TRUE, las=1)
par(mfrow=c(1,1), mar=c(4,15,2,1), cex=0.7) # mar=c(bottom, left, top, right)
barplot(sort(table(apply(d.f[,c("Kingdom","Group")], 1, paste, collapse=';'))), horiz=TRUE, las=1)

# boxplot
par(mfrow=c(1,1), mar=c(4,15,2,1), cex=0.7) # mar=c(bottom, left, top, right)
value <- "GC%"
x <- d.f[,value]
g <- apply(d.f[,c("Kingdom","Group")], 1, paste, collapse=';')
boxplot(x ~ reorder(g, -x, median), horizontal=TRUE, xlab=value, las=1)

dev.off()

# Print R version and packages
sessionInfo()
