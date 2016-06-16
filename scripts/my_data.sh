#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data,analysis}
#mkdir -p ./{data/$(date +%F),analysis/$(date +%F)}

# Downloading data
wget -nv -P ./data/ ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/{README,plasmids.txt,prokaryotes.txt}

# NC_007322	pXO1	Bacillus anthracis str. _Ames Ancestor_
# NC_007414	pO157	Escherichia coli O157:H7 EDL933
ACCESSIONs=(NC_007322 NC_007414)
URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Plasmids
for ACCESSION in ${ACCESSIONs[@]}; do wget -nv -P data/ $URL/fna/$ACCESSION.fna $URL/gbk/$ACCESSION.gbk; done

wget -nv -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/plasmid/{*protein.faa.gz,*genomic.fna.gz,*rna.fna.gz}

# Concatenating fasta files
DB=data/plasmid.genomic.fna
gzcat data/plasmid.*.genomic.fna.gz > $DB
# Building a BLAST database with local sequences
makeblastdb -in $DB -dbtype nucl -hash_index -parse_seqids
# Extracting data from BLAST databases with blastdbcmd
RE='ref|NC_[0-9].*complete'; DB2=data/plasmid.genomic.NC_complete.fna
blastdbcmd -db $DB -entry all -outfmt "%i %t" | grep $RE | awk '{print $1}' | \
 blastdbcmd -db $DB -entry_batch - > $DB2
# Building a BLAST database with local sequences
makeblastdb -in $DB2 -dbtype nucl -hash_index -parse_seqids

# Running the script to retrieve IncF plasmids

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."

