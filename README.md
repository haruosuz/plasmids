----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-06-14  

----------

# Plasmid Sequence Analysis
Project started 2016-06-13 at [BioHackathon 2016](http://2016.biohackathon.org/hackathon).

## Project directory structures

    plasmids/
     README.md: project documentation 
     data/: contains data files
     scripts/: contains Perl/Python/R/Shell scripts
     analysis/: contains results of data analyses

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories, downloading data, and running the Perl/Python/R/Shell scripts.

Let's run the driver script in the project's main directory `plasmids/` with:

    bash scripts/run.sh > log.txt 2>&1 &

Running `Rscript --vanilla scripts/my_plasmids.R` generates tab-delimited files including the NCBI taxonomic distributions of completely sequenced plasmids:

    analysis/table.Kingdom.txt
    analysis/table.Kingdom.Group.txt
    analysis/table.Kingdom.Group.SubGroup.txt

Running Shell scripts

    bash scripts/my_ncbiGenomeList.sh > log.txt 2>&1 &

## Run environment

    > sessionInfo()
    R version 3.3.0 (2016-05-03)
    Platform: x86_64-apple-darwin13.4.0 (64-bit)
    Running under: OS X 10.9.5 (Mavericks)

----------

## Updates

### 2016-06-13


## Acknowledgements
I am grateful to Dr. Yuki NAITO for his technical advice on how to download RefSeq data.

----------

## References
- [BioHackathon 2016](http://2016.biohackathon.org/hackathon).

- http://www.g-language.org/data/g-language/lib/G/Seq/PatSearch.pm

- https://github.com/aleimba/bac-genomics-scripts/tree/master/ncbi_ftp_download

- Suzuki H et al.
 - [Genomic Signature Analysis to Predict Plasmid Host Range. Molecular Life Sciences. 2014 May ](http://link.springer.com/referenceworkentry/10.1007/978-1-4614-6436-5_574-1#page-1)
 - [Predicting plasmid promiscuity based on genomic signature. J Bacteriol. 2010 Nov](http://www.ncbi.nlm.nih.gov/pubmed/20851899) | [Supplemental material](http://jb.asm.org/content/192/22/6045/suppl/DC1)
 - [Using Mahalanobis distance to compare genomic signatures between bacterial plasmids and chromosomes. Nucleic Acids Res. 2008 Dec](http://www.ncbi.nlm.nih.gov/pubmed/18953039)

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


----------
