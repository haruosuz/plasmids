#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data/chromosome.refseq,analysis}

# Downloading data
if [ ! -e data/prok_reference_genomes.txt ]; then wget -nv -P data/ ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/prok_reference_genomes.txt; fi
ls -l data/prok_reference_genomes.txt

# ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/README
# Plasmids        Refseq and INSDC plasmid accessions (only 1st one, with "..."if more than 1 plasmid in genome

# chromosomes
ACCESSIONs=(`grep -v "^#" data/prok_reference_genomes.txt | grep 'Bacillus\|Escherichia coli O1' | cut -f4`)
#ACCESSIONs=(`grep -v "^#" data/prok_reference_genomes.txt | cut -f4 | tr ',' '\n'`)
# Chromosome RefSeq
# Plasmid RefSeq # grep -v "^#" data/prok_reference_genomes.txt | cut -f6 | cut -d' ' -f1 | sort -u
echo ${#ACCESSIONs[@]}
#echo ${ACCESSIONs[@]}

for ACCESSION in ${ACCESSIONs[@]}; do curl -L "http://www.ncbi.nlm.nih.gov/sviewer/?report=fasta&retmode=text&val=$ACCESSION" > data/chromosome.refseq/$ACCESSION.fna; done

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."

