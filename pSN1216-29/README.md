Haruo Suzuki  
Last Update: 2020-02-13

----------

# Measuring Mahalanobis distances between plasmid pSN1216-29 and chromosomes

Code used for analyses in Maho Tokuda, Haruo Suzuki, Kosuke Yanagiya, Masahiro Yuki, Kengo Inoue, Moriya Ohkuma, Kazuhide Kimbara, Masaki Shintani. (2020). "Determination of Plasmid pSN1216-29 Host Range and the Similarity in Oligonucleotide Composition between Plasmid and Host Chromosomes".

----------

## Project directory structures
```
pSN1216-29/
./README.md: project documentation
./data/: contains sequence data in FASTA format (*.fna)
./results/: contains results of data analyses
./scripts/: contains R scripts
```

----------

## data

Test data, plasmid pSN1216-29 (Accession: [AP018710](https://www.ncbi.nlm.nih.gov/nuccore/AP018710)) and chromosomes from three bacterial strains, are as follows:
```
$grep "^>" data/AP018710.fna 
>AP018710.1 Uncultured bacterium plasmid pSN1216-29 DNA, complete sequence

$grep "^>" data/my.Chromosome.KEP.fna 
>NZ_CP014762.1 Klebsiella pneumoniae strain KPNIH39, complete genome
>NZ_CP015069.1 Escherichia coli strain Ecol_743, complete genome
>NZ_CP020603.1 Pseudomonas aeruginosa strain E6130952 chromosome, complete genome
```

----------

## scripts

To measure Mahalanobis distances in 3-mer compositions (tri-nucleotide relative abundance) between a plasmid and a set of nonoverlapping 5-kb chromosomal segments from each of bacterial strains,
run the R script in the project's main directory with:
```
seq1="data/AP018710.fna"
seqs="data/my.Chromosome.KEP.fna"
wordsize=3
windowsize=5000
echo "${seq1}" "${seqs}" "${wordsize}" "${windowsize}"
(time Rscript --vanilla scripts/my_rho_mahalanobis.R "${seq1}" "${seqs}" "${wordsize}" "${windowsize}" &) >& log.$(date +%F).txt
```

This will generate the following files:
```
./log.2020-02-13.txt
./my_rho/NZ_CP014762.1.k3.w5000.csv
./my_rho/NZ_CP020603.1.k3.w5000.csv
./my_rho/NZ_CP015069.1.k3.w5000.csv
./table_df.csv
./table.AP018710.fna.k3.w5000.csv
./table.AP018710.fna.k3.w5000.txt
```

----------

## results

The results of data analyses were moved to the `./results/` directory.

The number of chromosomal segments from one bacterial strain was as follows:
```
$find results/my_rho -name "*.csv" | xargs wc -l
   1071 results/my_rho/NZ_CP014762.1.k3.w5000.csv
   1409 results/my_rho/NZ_CP020603.1.k3.w5000.csv
    972 results/my_rho/NZ_CP015069.1.k3.w5000.csv
```

Genome features are shown in *results/table_df.csv* as follows:
```
"Length","GCcontent","Annotation"
5351509,0.573,"NZ_CP014762.1 Klebsiella pneumoniae strain KPNIH39, complete genome"
4856574,0.507,"NZ_CP015069.1 Escherichia coli strain Ecol_743, complete genome"
7040952,0.659,"NZ_CP020603.1 Pseudomonas aeruginosa strain E6130952 chromosome, complete genome"
```

Mahalanobis distances and P values (ranging from 0 to 1) for plasmid-chromosome pairs (Distance, P_value, and Annotation) are shown in *table.AP018710.fna.k3.w5000.txt* and *table.AP018710.fna.k3.w5000.csv*

----------

## references

- https://www.ncbi.nlm.nih.gov/pubmed/30459733
Front Microbiol. 2018 Nov 6;9:2602. doi: 10.3389/fmicb.2018.02602. eCollection 2018.
Novel Self-Transmissible and Broad-Host-Range Plasmids Exogenously Captured From Anaerobic Granules or Cow Manure.
Yanagiya K1, Maejima Y1, Nakata H1, Tokuda M2, Moriuchi R3, Dohra H3, Inoue K4, Ohkuma M5, Kimbara K1,2, Shintani M1,2,5,6.
- https://link.springer.com/referenceworkentry/10.1007%2F978-1-4614-6436-5_574-1
Suzuki H., Brown C.J., Top E.M. (2014) Genomic Signature Analysis to Predict Plasmid Host Range. In: Bell E. (eds) Molecular Life Sciences. Springer, New York, NY
- http://www.ncbi.nlm.nih.gov/pubmed/20851899
J Bacteriol. 2010 Nov;192(22):6045-55. doi: 10.1128/JB.00277-10. Epub 2010 Sep 17.
Predicting plasmid promiscuity based on genomic signature.
Suzuki H, Yano H, Brown CJ, Top EM.
- http://www.ncbi.nlm.nih.gov/pubmed/18953039
Nucleic Acids Res. 2008 Dec;36(22):e147. doi: 10.1093/nar/gkn753. Epub 2008 Oct 25.
Using Mahalanobis distance to compare genomic signatures between bacterial plasmids and chromosomes.
Suzuki H1, Sota M, Brown CJ, Top EM.

----------


