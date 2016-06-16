
# Extract Command Line Arguments
args <- commandArgs(trailingOnly = TRUE)
myfile <- args[1]

# set the working directory
#setwd("~/projects/plasmids/")

# Loading packages
library(MASS); # ginv

# Reading data into R
#myfile <- "data/NC_007322.fna.rho2.5000.csv" # NC_007322: Bacillus anthracis str. 'Ames Ancestor' plasmid pXO1

X <- read.csv(file = myfile, row.names=1)[1,]
# NC_007322: Bacillus anthracis str. 'Ames Ancestor' plasmid pXO1
# NC_003997: Bacillus anthracis str. Ames chromosome

# List files in a directory
files <- list.files(path="data/chromosome.refseq/", pattern="\\.rho2.5000.csv", full.names=TRUE)
Distance <- P.value <- numeric()
for(myfile in files){
 Y <- read.csv(file = myfile, row.names=1)[-1,]
 dX = try(mahalanobis(X, center=apply(Y,2,mean), cov=ginv(var(Y)), inverted=TRUE), silent=TRUE);
 dY = try(mahalanobis(Y, center=apply(Y,2,mean), cov=ginv(var(Y)), inverted=TRUE), silent=TRUE);
 dX = ifelse(is.numeric(dX), dX, NA);
 Distance = c(Distance, dX);
 P.value = c(P.value, ifelse(is.numeric(dY), mean(dY > dX), NA));
}

#x <- basename(files)[1]
ACCESSION <- as.vector(apply(as.matrix(basename(files)), MARGIN=c(1,2), function(x) unlist(strsplit(x, "[.]"))[1] ))
d.f <- data.frame(ACCESSION, Distance, P.value, stringsAsFactors=FALSE)

system(" head -2 data/chromosome.refseq/*.rho2.5000.csv | grep '|' > data/whole.rho.csv ")
DEFINITION <- read.csv(file="data/whole.rho.csv", header=FALSE, stringsAsFactors=FALSE)[,1]

#x <- d.f$ACCESSION[1]; grep(pattern=x, x=DEFINITION)
d.f$DEFINITION <- apply(as.matrix(d.f$ACCESSION), MARGIN=c(1,2), function(x) DEFINITION[ grep(pattern=x, x=DEFINITION) ] )[,1]

write.table(d.f[order(d.f$Distance),], file="analysis/table.rho2.5000.dist.txt", sep="\t", quote=TRUE, row.names=FALSE, col.names=TRUE)

# Print R version and packages
sessionInfo()
