----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-06-16  

----------

# Plasmid Sequence Analysis
Project started 2016-06-13 at [BioHackathon 2016](http://2016.biohackathon.org/hackathon).

I developed tools for analyzing plasmid sequences: i.e. identifying incompatibility (Inc) groups of plasmids, assessing plasmid host adaptation, and predicting plasmid host range. ([Suzuki H et al., 2014](http://link.springer.com/referenceworkentry/10.1007/978-1-4614-6436-5_574-1#page-1))

## Project directory structures

    plasmids/
     README.md: project documentation 
     data/: contains data files
     scripts/: contains Perl/Python/R/Shell scripts
     analysis/: contains results of data analyses

----------

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories (`data/` and `analysis/`), downloading data files, 
and running the Perl/Python/R/Shell scripts.

Let's run the driver script in the project's main directory `plasmids/` with:

    bash scripts/run.sh > log.txt 2>&1 &

Running the shell script for downloading data files with:

    bash scripts/my_data.sh > log.data.txt 2>&1 &

Running the R script for analyzing <ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/plasmids.txt> with:

    Rscript --vanilla scripts/my_plasmids.txt.R

    # Output files
    analysis/Rplots.plasmids.txt.pdf
    analysis/table.plasmids.Kingdom.txt
    analysis/table.plasmids.Kingdom.Group.txt
    analysis/table.plasmids.Kingdom.Group.SubGroup.txt

The shell script `scripts/my_tblastn.sh` searches complete sequences of plasmids belonging to the same groups, e.g. incompatibility  (Inc) groups, using a homology-based screening procedure. This approach is described in ([Suzuki H et al. (2010)](http://www.ncbi.nlm.nih.gov/pubmed/20851899)).
Running the shell script with:

    bash scripts/my_tblastn.sh > log.tblastn.txt 2>&1 &

Running R scripts

    Rscript --vanilla scripts/my_rho.R data/NC_007322.fna

## Run environment

    > sessionInfo()
    R version 3.3.0 (2016-05-03)
    Platform: x86_64-apple-darwin13.4.0 (64-bit)
    Running under: OS X 10.9.5 (Mavericks)

----------

## Validation

Reproducibility tests using the [G-language Genome Analysis Environment](http://www.g-language.org/)

[Table 1. Ten highest ranking bacterial strains based on Mahalanobis distance and δ-distance for plasmid pXO1 from B. anthracis str. Ames Ancestor](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2602791/table/T1/)

    # NC_007322: Bacillus anthracis str. 'Ames Ancestor' plasmid pXO1
    # NC_003997: Bacillus anthracis str. Ames chromosome

    G

	# G-language  Genome Analysis Environment v.1.9.1

	G > &signature_dist('NC_007322', 'NC_003997', -wordlength=>2, -window=>5000, -step=>5000, -method=>'delta');

	2-mer genomic signature difference:
	 delta distance = 52.1695
	 p-value = 0.3751

	G > &signature_dist('NC_007322', 'NC_003997', -wordlength=>2, -window=>5000, -step=>5000, -method=>'mahalanobis');

	2-mer genomic signature difference:
	 mahalanobis distance = 3.1985
	 p-value = 0.8919

----------

## Acknowledgements
I am grateful to Dr. Yuki NAITO for his technical advice on how to download NCBI data.

----------

## References
- [BioHackathon 2016](http://2016.biohackathon.org/hackathon).

- http://www.g-language.org/data/g-language/lib/G/Seq/PatSearch.pm

- https://github.com/aleimba/bac-genomics-scripts/tree/master/ncbi_ftp_download

- Suzuki H et al.
 - [Genomic Signature Analysis to Predict Plasmid Host Range. Molecular Life Sciences. 2014 May ](http://link.springer.com/referenceworkentry/10.1007/978-1-4614-6436-5_574-1#page-1)
 - [Predicting plasmid promiscuity based on genomic signature. J Bacteriol. 2010 Nov](http://www.ncbi.nlm.nih.gov/pubmed/20851899) | [Supplemental material](http://jb.asm.org/content/192/22/6045/suppl/DC1)
  - [Predicting Plasmid Promiscuity Could Help Fight Antibiotic Resistance | BEACON](http://beacon-center.org/blog/2011/03/28/predicting-plasmid-promiscuity-could-help-fight-antibiotic-resistance/)
 - [Using Mahalanobis distance to compare genomic signatures between bacterial plasmids and chromosomes. Nucleic Acids Res. 2008 Dec](http://www.ncbi.nlm.nih.gov/pubmed/18953039) | [Supplementary Data](http://nar.oxfordjournals.org/content/36/22/e147/suppl/DC1)

- [Norberg P et al. Nat Commun. 2011;2:268. 'The IncP-1 plasmid backbone adapts to different host bacterial species and evolves through homologous recombination.'](http://www.ncbi.nlm.nih.gov/pubmed/21468020)

- [Shintani M et al. Front Microbiol. 2015 Mar 'Genomics of microbial plasmids: classification and identification based on replication and transfer systems and host taxonomy.'](http://www.ncbi.nlm.nih.gov/pubmed/25873913)

- plasmidSPAdes
 - [SPAdes Genome Assembler | Algorithmic Biology Lab](http://bioinf.spbau.ru/spades)
 - [plasmidSPAdes: Assembling Plasmids from Whole Genome Sequencing Data | bioRxiv](http://biorxiv.org/content/early/2016/04/15/048942)
 - []()
 - [plasmidSPAdes | Plasmid detection: Metagenomic sequencing - OMICtools](https://omictools.com/plasmidspades-tool)
 - [#plasmidSPAdes hashtag on Twitter](https://twitter.com/hashtag/plasmidSPAdes)

- Plasmidome
 - [Welcome to the plasmidome. Nat Rev Microbiol. 2012 May](http://www.ncbi.nlm.nih.gov/pubmed/22580363)
 - [Insights into the bovine rumen plasmidome. Proc Natl Acad Sci U S A. 2012 Apr](http://www.ncbi.nlm.nih.gov/pubmed/22431592)
 - [Evolutionary, ecological and biotechnological perspectives on plasmids resident in the human gut mobile metagenome. Bioeng Bugs. 2012 Jan](http://www.ncbi.nlm.nih.gov/pubmed/22126801)

[Antibiotic resistance spreads rapidly between bacteria -- ScienceDaily](https://www.sciencedaily.com/releases/2011/04/110411163918.htm)

![https://www.sciencedaily.com/releases/2011/04/110411163918.htm](https://images.sciencedaily.com/2011/04/110411163918_1_540x360.jpg)

[U.S. sees first case of bacteria resistant to last-resort antibiotic | Reuters](http://www.reuters.com/article/us-health-superbug-idUSKCN0YH2KT)

![http://www.reuters.com/article/us-health-superbug-idUSKCN0YH2KT](http://s2.reutersmedia.net/resources/r/?m=02&d=20160527&t=2&i=1139027343&w=&fh=&fw=&ll=644&pl=429&sq=&r=LYNXNPEC4P1O4)

[BEACON Researchers at Work: Plasmid evolution is the key to fighting antibiotic resistance | BEACON](http://beacon-center.org/blog/2011/05/02/beacon-researchers-at-work-plasmid-evolution-is-the-key/)

![http://beacon-center.org/blog/2011/05/02/beacon-researchers-at-work-plasmid-evolution-is-the-key/](http://beacon-center.org/wp-content/uploads/2011/04/superbug-cartoon-300x254.jpg)

- [Simpson's paradox](https://en.wikipedia.org/wiki/Simpson%27s_paradox)

![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Simpson%27s_paradox_continuous.svg/220px-Simpson%27s_paradox_continuous.svg.png)

- [Global Distribution and Epigenetic Stratification of Antimicrobial Resistance | Grand Challenges](http://gcgh.grandchallenges.org/grant/global-distribution-and-epigenetic-stratification-antimicrobial-resistance)

----------
