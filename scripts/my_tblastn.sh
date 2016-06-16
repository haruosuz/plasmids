#!/bin/bash
set -e
set -u
#set -o pipefail

# Variables  QUERY=$1; DB=$2
#OUTPUT=analysis/tblastn-NC_008459.faa-plasmid.genomic.NC_complete.fna.out
# Bordetella pertussis plasmid pBP136
QUERY=data/NC_008459.faa; protein_id=`grep '^>' $QUERY | grep -i 'trfA' | cut -d'|' -f4` # YP_787935.1
DB=data/plasmid.genomic.NC_complete.fna

# Running BLAST
PROGRAM=tblastn
EVALUE=1e-05
OUTPUT=analysis/${PROGRAM}-$(basename $QUERY)-$(basename $DB).out

$PROGRAM -db $DB -query $QUERY -evalue $EVALUE \
 -max_target_seqs $(grep -c '^>' $DB) -outfmt 7 > $OUTPUT

cp $OUTPUT analysis/blast.out

# We retrieved plasmids that met both of the following two criteria:
grep -v '#' $OUTPUT | cut -f1,2 | uniq | cut -f2 | sort | uniq -c | sort -nr | awk '{ print $2 "\t" $1 }' > analysis/tblastn.sbjct.count.txt

# (i) they encode proteins that are homologs of more than half (50%) of all proteins encoded by any of the reference plasmids
MAX=$(grep -v '#' $OUTPUT | cut -f1,2 | uniq | cut -f2 | sort | uniq -c | sort -nr | head -1 | awk '{ print $1 }')
grep -v '#' $OUTPUT | cut -f1,2 | uniq | cut -f2 | sort | uniq -c | sort -nr | awk -v N="$MAX" '$1 >  N * 0.4' | awk '{ print $2 }' > analysis/tblastn.sbjct.50.txt

# (ii) they encode replication initiation (Rep) proteins that are homologs to those of the reference plasmids
grep -v '#' $OUTPUT | cut -f1,2 | uniq | grep $protein_id | cut -f2 | sort | uniq -c | sort -nr | grep '   1 ' | awk '{ print $2 }' > analysis/tblastn.sbjct.rep.txt

cat analysis/tblastn.sbjct.50.txt analysis/tblastn.sbjct.rep.txt | sort | uniq -c | sort -nr | grep '   2 ' | awk '{ print $2 }' > analysis/tblastn.sbjct.both.txt

wc -l analysis/tblastn.sbjct.*.txt

grep -f analysis/tblastn.sbjct.both.txt $DB > analysis/tblastn.sbjct.both.definition.txt

#echo "[$(date)] $0 has been successfully completed."
