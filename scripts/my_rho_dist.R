
# set the working directory
#setwd("~/projects/plasmids/")

library(MASS); # ginv

# List files in a directory
files <- list.files(path="data", pattern="\\.fna.rho.csv", full.names=TRUE)

# Reading data into R
files[7] # NC_007322: Bacillus anthracis str. 'Ames Ancestor' plasmid pXO1
files[3] # NC_003997: Bacillus anthracis str. Ames chromosome
X <- read.csv(file = files[7], row.names=1)[1,]

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

system(" head -2 data/*.rho.csv | grep '|' > data/whole.rho.csv ")
DEFINITION <- read.csv(file="data/whole.rho.csv", header=FALSE, stringsAsFactors=FALSE)[,1]

#x <- d.f$ACCESSION[1]; grep(pattern=x, x=DEFINITION)
d.f$DEFINITION <- apply(as.matrix(d.f$ACCESSION), MARGIN=c(1,2), function(x) DEFINITION[ grep(pattern=x, x=DEFINITION) ] )[,1]

write.table(d.f[order(d.f$Distance),], file="analysis/table.rho.dist.txt", sep="\t", quote=TRUE, row.names=FALSE, col.names=TRUE)

#x <- blast$definition[3]; grep(pattern=unlist(strsplit(x, split=" "))[2], x=taxon[,1]); #taxon[c(800,801), 1]
blast$taxonomy <- apply(as.matrix(blast$definition), MARGIN=c(1,2), function(x) taxon[ grep(pattern=unlist(strsplit(x, split=" "))[2], x=taxon[,1]), 2 ] )[,1]



# Print R version and packages
sessionInfo()
