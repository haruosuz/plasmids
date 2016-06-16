
# set the working directory
#setwd("~/projects/plasmids/")

# Loading Data into R
d.f.plasmids <- read.delim("data/plasmids.txt", stringsAsFactors=FALSE, na.strings = "-")[,c(1,5,6,9)]; dim(d.f.plasmids)
d.f.plasmids <- na.omit(d.f.plasmids); dim(d.f.plasmids)
#TF <- regexpr(pattern="NC_", text=d.f.plasmids[,"RefSeq"]) > 0; sum(TF); d.f.plasmids <- d.f.plasmids[TF,]

d.f.hosts <- read.delim("data/prokaryotes.txt", stringsAsFactors=FALSE, na.strings = "-")[,c(1,5,6,8,19)]; dim(d.f.hosts)
d.f.hosts <- na.omit(d.f.hosts); dim(d.f.hosts)
table(d.f.hosts$Status); d.f.hosts <- d.f.hosts[d.f.hosts$Status == "Complete Genome",]

head(d.f.plasmids, 1)
head(d.f.hosts, 1)
mer <- merge(d.f.hosts, d.f.plasmids, by.x="X.Organism.Name", by.y="X.Organism.Name"); 
colnames(mer)[colnames(mer) == "GC..x"] = "GC.host"
colnames(mer)[colnames(mer) == "GC..y"] = "GC.plasmid"

# All
x <- mer[,"GC.host"]
y <- mer[,"GC.plasmid"]
cor(x, y)
plot(x, y, xlab="GC.host", ylab="GC.plasmid", xlim=c(20,80), ylim=c(20,80))
abline(0,1)
mtext(side = 3, line=1, outer=T, text = paste("All (n = ",nrow(mer),")",sep=""), cex=2)
TF <- x - y > 10; sum(TF)
TF <- x - y < -10; sum(TF)

# Group/SubGroup
level <- "Group"; #level <- "SubGroup";
mer[,level] <- gsub("[ /]", ".", mer[,level])
OUTDIR <- paste("results_",level,sep=""); system(paste("mkdir ",OUTDIR,sep=""))

#pdf(paste("Rplot_",level,".pdf",sep=""), pointsize=10)
#par(oma = c(0, 0, 3, 0))   # 下・左・上・右の順で余白を設定


# Median values for each level (Group/SubGroup)
#pdf(paste("R_boxplot_",level,".pdf",sep=""), pointsize=10)
par(mfrow=c(1,1), mar=c(4,15,2,1), cex=1) # mar=c(底左上右)
#par(las=1) # all axis labels horizontal
for(value in c("GC.host", "GC.plasmid")){
x <- as.numeric(mer[,value])
g <- mer[,level]
#boxplot(x ~ g, horizontal=T, xlab=value); # reorder(g, -x, median), main=paste("kruskal.test, p =",p)
boxplot(x ~ reorder(g, -x, median), horizontal=T, xlab=value, las=1);
}

# pairs.panels for each level (Group/SubGroup)
library(psych) # install.packages("psych")
#pdf(paste("R_pairs.panels_",level,".pdf",sep=""), pointsize=10)
#par(oma = c(0, 0, 3, 0))   # 下・左・上・右の順で余白を設定
#par(mfrow=c(3,3), mgp=c(2,1,0), mar=c(3,3,2,2), cex=2) # mar=c(底左上右)
#num <- sort(table(mer[,level]),dec=T); taxa <- names(num[num > 3]); for(taxon in taxa){
for(taxon in unique(mer[,level])){
TF <- regexpr(taxon, mer[,level]) > 0; number = sum(TF); if(number < 10) next;
pairs.panels(data.matrix(mer[TF,c("GC.host", "GC.plasmid")]))
mtext(side = 3, line=1, outer=T, text = paste(taxon," (n = ",number,")",sep=""), cex=2)
}

# tables for each level (Group/SubGroup)
for(taxon in unique(mer[,level])){
TF <- regexpr(taxon, mer[,level]) > 0; number = sum(TF); 
write.csv(mer[TF,], paste(OUTDIR,"/table_",taxon,".csv",sep=""), quote=FALSE, row.names=FALSE)
}

dev.off()


# Print R version and packages
sessionInfo()
