#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data,analysis}

# Downloading data
#wget -nv -P data/ ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/prok_reference_genomes.txt

#cut -f4 prok_reference_genomes.txt | tr ',' '\n' | head > my.Chromosome_RefSeq.txt

# NC_007414	pO157	Escherichia coli O157:H7 EDL933
# NC_007322	pXO1	Bacillus anthracis str. _Ames Ancestor_

ACCESSIONs=(NC_007322 NC_007414)
#ACCESSIONs=(NC_005088 NC_007337 NC_008459 NC_001735)
URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Plasmids
for ACCESSION in ${ACCESSIONs[@]}; do wget -nv -P data/ $URL/fna/$ACCESSION.fna $URL/gbk/$ACCESSION.gbk; done

ACCESSIONs=(`grep 'Bacillus\|Escherichia coli O' data/prok_reference_genomes.txt | cut -f4`)
#for ACCESSION in ACCESSIONs; do curl -L "http://www.ncbi.nlm.nih.gov/sviewer/?report=fasta&retmode=text&val=$ACCESSION" > data/$ACCESSION.fna; done

ACCESSIONs=(`grep 'Bacillus\|Escherichia coli O' data/prok_reference_genomes.txt | cut -f4` NC_007322 NC_007414)
echo ${#ACCESSIONs[@]}
echo ${ACCESSIONs[@]}

# Running R script
#for ACCESSION in ${ACCESSIONs[@]}; do Rscript --vanilla scripts/my_rho.R data/$ACCESSION.fna; done

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."

