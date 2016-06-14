----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-06-13  

----------

# Plasmid Sequence Analysis
Project started 2016-06-13.  

## Project directory structures

    plasmids/
     README.md: project documentation 
     data/: contains data files
     scripts/: contains Perl/Python/R/Shell scripts
     analysis/: contains results of data analyses

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories, downloading data, and running the shell script `scripts/find_incf.sh` for BLAST analysis to find IncF group plasmids.

In the project's main directory `incf/`, we run the driver script `scripts/run.sh` with:

    bash scripts/run.sh > log.txt 2>&1 &

    bash scripts/my_ncbiGenomeList.sh > log.txt 2>&1 &

Running R scripts

    Rscript --vanilla scripts/my_plasmids.R

----------

## Updates

### 2016-06-13

----------

## References
- Suzuki H et al.
 - [Predicting plasmid promiscuity based on genomic signature. J Bacteriol. 2010 Nov](http://www.ncbi.nlm.nih.gov/pubmed/20851899) | [Supplemental material](http://jb.asm.org/content/192/22/6045/suppl/DC1)
 - [Using Mahalanobis distance to compare genomic signatures between bacterial plasmids and chromosomes. Nucleic Acids Res. 2008 Dec](http://www.ncbi.nlm.nih.gov/pubmed/18953039)
 - [Genomic Signature Analysis to Predict Plasmid Host Range. Molecular Life Sciences. 2014 May ](http://link.springer.com/referenceworkentry/10.1007/978-1-4614-6436-5_574-1#page-1)

- Plasmidome
 - [Welcome to the plasmidome. Nat Rev Microbiol. 2012 May](http://www.ncbi.nlm.nih.gov/pubmed/22580363)
 - [Insights into the bovine rumen plasmidome. Proc Natl Acad Sci U S A. 2012 Apr](http://www.ncbi.nlm.nih.gov/pubmed/22431592)
 - [Evolutionary, ecological and biotechnological perspectives on plasmids resident in the human gut mobile metagenome. Bioeng Bugs. 2012 Jan](http://www.ncbi.nlm.nih.gov/pubmed/22126801)

 - []()
 - []()

----------
