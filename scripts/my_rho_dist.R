
# set the working directory
#setwd("~/projects/plasmids/")

# List files in a directory
files <- list.files(path="data", pattern="\\.fna.rho.csv", full.names=TRUE)

# NC_007414	pO157	Escherichia coli O157:H7 EDL933
# NC_007322	pXO1	Bacillus anthracis str. _Ames Ancestor_
# NC_003997: Bacillus anthracis str. Ames chromosome
# NC_007322: Bacillus anthracis str. 'Ames Ancestor' plasmid pXO1

files[7]
files[3]

# Reading data into R
X <- read.csv(file = files[7], row.names=1)[1,]
Y <- read.csv(file = files[3], row.names=1)
library(MASS); # ginv
dX = try(mahalanobis(X, center=apply(Y,2,mean), cov=ginv(var(Y)), inverted=TRUE), silent=TRUE);
dY = try(mahalanobis(Y, center=apply(Y,2,mean), cov=ginv(var(Y)), inverted=TRUE), silent=TRUE);
#dX = mahalanobis(X, center=apply(Y,2,mean), cov=var(Y), inverted=TRUE)
#dY = mahalanobis(Y, center=apply(Y,2,mean), cov=var(Y), inverted=TRUE)

dX
ifelse(is.numeric(dY), mean(dY > dX), NA)




# Print R version and packages
sessionInfo()
