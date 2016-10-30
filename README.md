----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-10-30

----------

# Plasmid Sequence Analysis
Project started 2016-06-13 at [BioHackathon 2016](http://2016.biohackathon.org/hackathon).

I developed tools for analyzing plasmid sequences: e.g. identifying incompatibility (Inc) groups of plasmids, assessing plasmid host adaptation, and predicting plasmid host range. ([Suzuki H et al., 2014](http://link.springer.com/referenceworkentry/10.1007/978-1-4614-6436-5_574-1))

## Project directory structures

    plasmids/
     README.md: project documentation 
     data/: contains data files
     scripts/: contains Perl/Python/R/Shell scripts
     analysis/: contains results of data analyses

----------

## Run environment

    > sessionInfo()
    R version 3.3.0 (2016-05-03)
    Platform: x86_64-apple-darwin13.4.0 (64-bit)
    Running under: OS X 10.9.5 (Mavericks)

----------

## Steps

Downloading the GitHub project repository using:  

    git clone https://github.com/haruosuz/plasmids
    cd plasmids/

Alternatively, using:

    wget https://github.com/haruosuz/plasmids/archive/master.zip
    unzip master.zip
    cd plasmids-master/

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories, downloading data files, 
and running the R/Shell scripts.

Let's run the driver script in the project's main directory (e.g. `plasmids/`, `plasmids-master/`) with:

    bash scripts/run.sh > log.txt 2>&1 &

    # Use `tail -f` to constantly monitor files (use Control-C to stop)
    tail -f log.txt

### Assessing plasmid host adaptation

Previous studies reported that %GC content of plasmids tend to be lower than (and also correlated with) that of the known host chromosomes ([Rocha and Danchin 2002](http://www.ncbi.nlm.nih.gov/pubmed/12044357); [van Passel et al. 2006](http://www.ncbi.nlm.nih.gov/pubmed/16480495); [Nishida 2012](http://www.ncbi.nlm.nih.gov/pubmed/22536540)).

Assessing plasmid host adaptation based on %GC content using:  

    Rscript --vanilla scripts/my_plasmid_host_gc.R

This generates output files including [`analysis/R_pairs.panels_SubGroup.pdf`](https://github.com/haruosuz/plasmids/blob/master/analysis/R_pairs.panels_SubGroup.pdf).

### Predicting plasmid hosts

Replicons (i.e. plasmids and chromosomes) from the same host tend to be similar in oligonucleotide compositions, suggesting that plasmids acquire their hosts' signature over time (Campbell et al. 1999; Suzuki et al. 2008; van Passel et al. 2006). Thus, plasmid host range can be inferred by comparing the plasmid oligonucleotide composition to those of bacterial chromosomes.

Predicting plasmid hosts using:  

    bash scripts/run_predict_plasmid_hosts.sh > log.predict_plasmid_hosts.txt 2>&1 &

    # Output files
    analysis/table.rho2.5000.dist.txt

### Identifying plasmid groups

Retrieving reference sequences of plasmids using:

    bash scripts/get_refseq_plasmids.sh > log.txt 2>&1 &

The shell script `scripts/my_tblastn.sh` searches complete sequences of plasmids belonging to the same groups, e.g. incompatibility (Inc) groups, using a homology-based screening procedure. This approach is described in ([Suzuki H et al., 2010](http://www.ncbi.nlm.nih.gov/pubmed/20851899)).
Running the shell script with:

    bash scripts/my_tblastn.sh > log.tblastn.txt 2>&1 &

From the 4298 completely sequenced plasmids having accessions with the [NC_](http://www.ncbi.nlm.nih.gov/books/NBK21091/table/ch18.T.refseq_accession_numbers_and_mole/?report=objectonly) prefix,
this program retrieves plasmids that met both of the following two criteria: (i) they encode proteins that are homologs of more than half of all proteins encoded by any of the reference plasmids, and (ii) they encode replication initiation (Rep) proteins that are homologs to those of the reference plasmids: RepB and RepE from IncFI plasmid F, RepA1 and RepA4 from IncFII plasmid R100.

### Retrieving plasmid data

Running the shell script for downloading data files with:  

    bash scripts/my_data.sh > log.data.txt 2>&1 &

Running the R script for analyzing <ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/plasmids.txt> with:  

    Rscript --vanilla scripts/my_plasmids.txt.R

    # Output files
    analysis/Rplots.plasmids.txt.pdf
    analysis/table.plasmids.Kingdom.txt
    analysis/table.plasmids.Kingdom.Group.txt
    analysis/table.plasmids.Kingdom.Group.SubGroup.txt

----------

## Acknowledgements
I am grateful to Dr. Yuki NAITO for his technical advice on how to download NCBI data.

## TODO list
- 自分がとったプラスミドがどのプラスミドに良く似ているのか，rep，par，tra，cis-element，host情報などについて，すぐに分かると便利

----------

## References
### Review
- [Shintani M et al. Front Microbiol. 2015 Mar "Genomics of microbial plasmids: classification and identification based on replication and transfer systems and host taxonomy."](http://www.ncbi.nlm.nih.gov/pubmed/25873913)
- [Loftie-Eaton W, Rawlings DE. Plasmid. 2012 Jan "Diversity, biology and evolution of IncQ-family plasmids."](http://www.ncbi.nlm.nih.gov/pubmed/22037393)
- [Chan, Jane 2013 "Molecular epidemiology of fosfomycin-resistant Escherichia coli from humans and animals"](http://hub.hku.hk/handle/10722/197077) | [FullText.pdf](http://hub.hku.hk/bitstream/10722/197077/2/FullText.pdf) Table 1. 4 List of known incompatibility groups of Enterobacteriaceae

### Bioinformatics Tools
- [plasmidSPAdes](http://spades.bioinf.spbau.ru/plasmidSPAdes/)
  - [Antipov D et al. Bioinformatics. 2016 Jul "plasmidSPAdes: Assembling Plasmids from Whole Genome Sequencing Data."](http://www.ncbi.nlm.nih.gov/pubmed/27466620)
  - [SPAdes Genome Assembler | Algorithmic Biology Lab](http://bioinf.spbau.ru/spades)
    - [SPAdes 3.9.0 Manual](http://spades.bioinf.spbau.ru/release3.9.0/manual.html)
- PlasmidFinder 1.3
    - [CGE Server](https://cge.cbs.dtu.dk//services/PlasmidFinder/)
    - [Carattoli A et al. Antimicrob Agents Chemother. 2014 Jul "In silico detection and typing of plasmids using PlasmidFinder and plasmid multilocus sequence typing."](http://www.ncbi.nlm.nih.gov/pubmed/24777092)
- PLACNET (PLAsmid Constellation NET)
    - [Lanza VF,, de la Cruz F et al. PLoS Genet. 2014 Dec "Plasmid flux in Escherichia coli ST131 sublineages, analyzed by plasmid constellation network (PLACNET), a new method for plasmid reconstruction from whole genome sequences."](http://www.ncbi.nlm.nih.gov/pubmed/25522143)
    - [Placnet download | SourceForge.net](https://sourceforge.net/projects/placnet/)
- [Recycler](https://github.com/Shamir-Lab/Recycler)
    - [Recycler: an algorithm for detecting plasmids from de novo assembly graphs | bioRxiv](http://biorxiv.org/content/early/2016/05/09/029926)
- [Addgene](https://www.addgene.org) non-profit plasmid repository
    - [Addgene (@Addgene) | Twitter](https://twitter.com/addgene)
- Plasmids as genetic tools for microbial engineering
 - 2001-06 [Overcoming the codon bias of E. coli for enhanced protein expression](http://wolfson.huji.ac.il/expression/rosetta.pdf)

### Compositional features
#### Oligonucleotide composition
- [Suzuki H et al. Molecular Life Sciences. 2014 May "Genomic Signature Analysis to Predict Plasmid Host Range."](http://link.springer.com/referenceworkentry/10.1007/978-1-4614-6436-5_574-1)
- [Suzuki H et al. J Bacteriol. 2010 Nov "Predicting plasmid promiscuity based on genomic signature."](http://www.ncbi.nlm.nih.gov/pubmed/20851899) | [Supplemental material](http://jb.asm.org/content/192/22/6045/suppl/DC1)
  - [Predicting Plasmid Promiscuity Could Help Fight Antibiotic Resistance | BEACON](http://beacon-center.org/blog/2011/03/28/predicting-plasmid-promiscuity-could-help-fight-antibiotic-resistance/)
- [Suzuki H et al. Nucleic Acids Res. 2008 Dec "Using Mahalanobis distance to compare genomic signatures between bacterial plasmids and chromosomes."](http://www.ncbi.nlm.nih.gov/pubmed/18953039) | [Supplementary Data](http://nar.oxfordjournals.org/content/36/22/e147/suppl/DC1)
- [Norberg P et al. Nat Commun. 2011;2:268. "The IncP-1 plasmid backbone adapts to different host bacterial species and evolves through homologous recombination."](http://www.ncbi.nlm.nih.gov/pubmed/21468020)
#### Base composition
- [van Passel MW et al. BMC Genomics. 2006 Feb "Compositional discordance between prokaryotic plasmids and host chromosomes."](http://www.ncbi.nlm.nih.gov/pubmed/16480495)
- [Nishida H. Int J Evol Biol. 2012 "Comparative analyses of base compositions, DNA sizes, and dinucleotide frequency profiles in archaeal and bacterial chromosomes and plasmids."](http://www.ncbi.nlm.nih.gov/pubmed/22536540)
- [Rocha EP, Danchin A. Trends Genet. 2002 Jun "Base composition bias might result from competition for metabolic resources."](http://www.ncbi.nlm.nih.gov/pubmed/12044357)
#### Codon usage
- [Davis JJ, Olsen GJ. Mol Biol Evol. 2010 Apr "Modal codon usage: assessing the typical codon usage of a genome."](https://www.ncbi.nlm.nih.gov/pubmed/20018979)
- [Guo FB, Yuan JB. DNA Res. 2009 Apr "Codon usages of genes on chromosome, and surprisingly, genes in plasmid are primarily affected by strand-specific mutational biases in Lawsonia intracellularis."](https://www.ncbi.nlm.nih.gov/pubmed/19221094)
- [Peixoto L et al. Gene. 2003 Nov 27 "The strength of translational selection for codon usage varies in the three replicons of Sinorhizobium meliloti."](https://www.ncbi.nlm.nih.gov/pubmed/14597394)

### New Delhi metallo-β-lactamase-1 (NDM-1)
- [Kumarasamy KK et al. Lancet Infect Dis. 2010 Sep "Emergence of a new antibiotic resistance mechanism in India, Pakistan, and the UK: a molecular, biological, and epidemiological study."](http://www.ncbi.nlm.nih.gov/pubmed/20705517)

### Colistin resistance (mcr-1 gene)
- [McGann P et al. Antimicrob Agents Chemother. 2016 Jun "Escherichia coli Harboring mcr-1 and blaCTX-M on a Novel IncF Plasmid: First Report of mcr-1 in the United States."](https://www.ncbi.nlm.nih.gov/pubmed/27230792)
- [Fernandes MR et al. Euro Surveill. 2016 Apr 28;21(17). "Silent dissemination of colistin-resistant Escherichia coli in South America could contribute to the global spread of the mcr-1 gene."](https://www.ncbi.nlm.nih.gov/pubmed/27168587) | [Eurosurveillance - View Article](http://www.eurosurveillance.org/ViewArticle.aspx?ArticleId=22458)
- [Suzuki S et al. Lancet Infect Dis. 2016 Mar "Investigation of a plasmid genome database for colistin-resistance gene mcr-1."](http://www.ncbi.nlm.nih.gov/pubmed/26774245)
- [Skov RL, Monnet DL. Euro Surveill. 2016;21(9). "Plasmid-mediated colistin resistance (mcr-1 gene): three months later, the story unfolds."](http://www.ncbi.nlm.nih.gov/pubmed/26967914) | [Eurosurveillance - View Article](http://www.eurosurveillance.org/ViewArticle.aspx?ArticleId=21403)
- [Liu YY et al. Lancet Infect Dis. 2016 Feb "Emergence of plasmid-mediated colistin resistance mechanism MCR-1 in animals and human beings in China: a microbiological and molecular biological study."](http://www.ncbi.nlm.nih.gov/pubmed/26603172)

### Plasmidome
- [Welcome to the plasmidome. Nat Rev Microbiol. 2012 May](http://www.ncbi.nlm.nih.gov/pubmed/22580363)
- [Insights into the bovine rumen plasmidome. Proc Natl Acad Sci U S A. 2012 Apr](http://www.ncbi.nlm.nih.gov/pubmed/22431592)
- [Evolutionary, ecological and biotechnological perspectives on plasmids resident in the human gut mobile metagenome. Bioeng Bugs. 2012 Jan](http://www.ncbi.nlm.nih.gov/pubmed/22126801)

----------

## News
- [News about plasmid resistance on Twitter](https://twitter.com/search?vertical=news&q=plasmid%20resistance)

- December 16, 2015 [A New Superbug Attacks Our Last Line Of Antibiotic Defense | On Point](http://www.wbur.org/onpoint/2015/12/16/superbug-antibiotics-global-risk) 
- March 27, 2015 [FACT SHEET: Obama Administration Releases National Action Plan to Combat Antibiotic-Resistant Bacteria | whitehouse.gov](https://www.whitehouse.gov/the-press-office/2015/03/27/fact-sheet-obama-administration-releases-national-action-plan-combat-ant)

- Fri May 27, 2016 [U.S. sees first case of bacteria resistant to last-resort antibiotic | Reuters](http://www.reuters.com/article/us-health-superbug-idUSKCN0YH2KT)

![http://www.reuters.com/article/us-health-superbug-idUSKCN0YH2KT](http://s2.reutersmedia.net/resources/r/?m=02&d=20160527&t=2&i=1139027343&w=&fh=&fw=&ll=644&pl=429&sq=&r=LYNXNPEC4P1O4)

- June 12, 2016 [Bacteria gaining upper hand in war against humans- Nikkei Asian Review](http://asia.nikkei.com/Tech-Science/Science/Bacteria-gaining-upper-hand-in-war-against-humans)

- April 13, 2011 [Antibiotic resistance spreads rapidly between bacteria -- ScienceDaily](https://www.sciencedaily.com/releases/2011/04/110411163918.htm)

![https://www.sciencedaily.com/releases/2011/04/110411163918.htm](https://images.sciencedaily.com/2011/04/110411163918_1_540x360.jpg)

- May 2, 2011 [BEACON Researchers at Work: Plasmid evolution is the key to fighting antibiotic resistance | BEACON](http://beacon-center.org/blog/2011/05/02/beacon-researchers-at-work-plasmid-evolution-is-the-key/)

![http://elizabethely.com/2010/07/11/antibiotic-chloramphenicol-in-chinese-imported-honey/](http://elizabethely.com/wp-content/uploads/2010/07/nz149-superbug-cartoon.jpg)

----------
