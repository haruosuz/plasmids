#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data,analysis}
#mkdir -p ./{data/$(date +%F),analysis}
#mkdir -p ./data/$(date +%F)

# Downloading database
#wget -nv -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/plasmid/{*protein.faa.gz,*genomic.fna.gz}
# wget -b -nv -P data/ ftp://ftp.ncbi.nlm.nih.gov/refseq/release/plasmid/{*protein.faa.gz,*genomic.fna.gz,*genomic.gbff.gz}

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

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."
