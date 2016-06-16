#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data,analysis}

# Downloading data
ACCESSIONs=(NC_007322 NC_007414) # NC_007322 pXO1 # NC_007414 pO157
URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Plasmids
for ACCESSION in ${ACCESSIONs[@]}; do wget -nv -P data/ $URL/fna/$ACCESSION.fna $URL/gbk/$ACCESSION.gbk; done

# 
bash scripts/get_seq_prok_reference_genomes.sh

FASTAs=(`ls data/chromosome.refseq/*.fna`)
echo ${#FASTAs[@]} # echo ${FASTAs[@]}
#for FASTA in ${FASTAs[@]}; do echo $FASTA; done
# Running R script
for FASTA in ${FASTAs[@]}; do Rscript --vanilla scripts/my_rho.R $FASTA; done

Rscript --vanilla scripts/my_rho.R  data/NC_007322.fna

Rscript --vanilla scripts/my_rho_dist.R  data/NC_007322.fna.rho2.5000.csv

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."
