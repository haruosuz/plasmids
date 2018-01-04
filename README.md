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

http://www.sciencedirect.com/science/article/pii/S0147619X16301135
May 2017, Review
Annotation of plasmid genes

https://www.ncbi.nlm.nih.gov/pubmed/28586714
Curr Opin Microbiol. 2017 Jun 3;38:106-113. doi: 10.1016/j.mib.2017.05.005. [Epub ahead of print]
Towards a taxonomy of conjugative plasmids.
Fernandez-Lopez R1, Redondo S1, Garcillan-Barcia MP1, de la Cruz F2.

- [Orlek A et al. Front Microbiol. 2017 Feb 9 "Plasmid Classification in an Era of Whole-Genome Sequencing: Application in Studies of Antibiotic Resistance Epidemiology"](https://www.ncbi.nlm.nih.gov/pubmed/28232822)
- 2015-03 [新谷政己，金原和秀．環境バイオテクノロジー学会誌 14(2), 81-86. "プラスミドゲノミクス~全塩基配列解読済のプラスミドデータベースの整備" Genomics of Plasmids](http://ci.nii.ac.jp/naid/40020727466) | [PDF](http://www.jseb.jp/jeb/14-02/14-02-081.pdf)
- [Shintani M et al. Front Microbiol. 2015 Mar "Genomics of microbial plasmids: classification and identification based on replication and transfer systems and host taxonomy."](http://www.ncbi.nlm.nih.gov/pubmed/25873913)
- 2013-12 [新谷 政己, 松井 一泰, 金原 和秀, 野尻 秀昭. 環境バイオテクノロジー学会誌 13(2), 125-134. "環境中におけるプラスミドの挙動解析" Comparisons of Conjugation Frequency in Different Environmental Conditions](http://ci.nii.ac.jp/naid/40020320833) | [PDF](http://www.jseb.jp/jeb/13-02/13-02-125.pdf)
- [Loftie-Eaton W, Rawlings DE. Plasmid. 2012 Jan "Diversity, biology and evolution of IncQ-family plasmids."](http://www.ncbi.nlm.nih.gov/pubmed/22037393)

### Data

https://www.ncbi.nlm.nih.gov/pubmed/28286183
Plasmid. 2017 May;91:42-52.
Ordering the mob: Insights into replicon and MOB typing schemes from analysis of a curated dataset of publicly available plasmids.
Orlek A et al.

https://www.ncbi.nlm.nih.gov/pubmed/28516137
Data Brief. 2017 Apr 23;12:423-426. 
A curated dataset of complete Enterobacteriaceae plasmids compiled from the NCBI nucleotide database.
Orlek A et al.

### Tools
https://github.com/smaegol/PlasFlow
PlasFlow: Software for prediction of plasmid sequences in metagenomic assemblies

- [Plasmid detection software tools | De novo genome sequencing analysis - OMICtools](https://omictools.com/plasmid-detection-category)
- [Sergio_Arredondo / Plasmid_Assembly · GitLab](https://gitlab.com/sirarredondo/Plasmid_Assembly/tree/master)
  - Microbial Genomics [On the (im)possibility of reconstructing plasmids from whole-genome short-read sequencing data](http://mgen.microbiologyresearch.org/content/journal/mgen/10.1099/mgen.0.000128)
  - 2017/03/28 [On the (im)possibility to reconstruct plasmids from whole genome short-read sequencing data | bioRxiv](http://biorxiv.org/content/early/2017/03/28/086744)
- [Recycler](https://github.com/Shamir-Lab/Recycler)
  - [Rozov R et al. (2017) Bioinformatics. 33(4):475-482. "Recycler: an algorithm for detecting plasmids from de novo assembly graphs."](https://www.ncbi.nlm.nih.gov/pubmed/28003256)
  - 2017-08-27 アセンブルのgraphからプラスミドデータを検出するツール Recycler - macでインフォマティクス http://kazumaxneo.hatenablog.com/entry/2017/08/27/233654
- [plasmidSPAdes](http://spades.bioinf.spbau.ru/plasmidSPAdes/)
  - [plasmidSPAdes - Twitter Search](https://twitter.com/search?f=tweets&vertical=default&q=plasmidSPAdes&src=typd)
  - [Antipov D et al. Bioinformatics. 2016 Jul "plasmidSPAdes: Assembling Plasmids from Whole Genome Sequencing Data."](http://www.ncbi.nlm.nih.gov/pubmed/27466620)
  - [SPAdes – Center for Algorithmic Biotechnology](http://cab.spbu.ru/software/spades/)
    - [SPAdes 3.10.1 Manual](http://cab.spbu.ru/files/release3.10.1/manual.html)
  - [SPAdes Genome Assembler | Algorithmic Biology Lab](http://bioinf.spbau.ru/spades)
    - [SPAdes 3.9.0 Manual](http://spades.bioinf.spbau.ru/release3.9.0/manual.html)
- PLACNET (PLAsmid Constellation NET)
  - https://academic.oup.com/bioinformatics/article-abstract/doi/10.1093/bioinformatics/btx462/3983262/PLACNETw-a-webbased-tool-for-plasmid
PLACNETw: a web-based tool for plasmid reconstruction from bacterial genomes | Bioinformatics | Oxford Academic
  - [Lanza VF,, de la Cruz F et al. PLoS Genet. 2014 Dec "Plasmid flux in Escherichia coli ST131 sublineages, analyzed by plasmid constellation network (PLACNET), a new method for plasmid reconstruction from whole genome sequences."](http://www.ncbi.nlm.nih.gov/pubmed/25522143)
  - [Placnet download | SourceForge.net](https://sourceforge.net/projects/placnet/)
- [PlasmidFinder 1.3](https://cge.cbs.dtu.dk//services/PlasmidFinder/)
  - Updated 20 February 2017 [downloading databases](https://cge.cbs.dtu.dk//services/data.php)
  - 2017-01-23 [genomicepidemiology / PlasmidFinder — Bitbucket](https://bitbucket.org/genomicepidemiology/plasmidfinder)
  - [Carattoli A et al. Antimicrob Agents Chemother. 2014 Jul "In silico detection and typing of plasmids using PlasmidFinder and plasmid multilocus sequence typing."](http://www.ncbi.nlm.nih.gov/pubmed/24777092)
- [Addgene](https://www.addgene.org) non-profit plasmid repository
  - [Addgene (@Addgene) | Twitter](https://twitter.com/addgene)
- [cBar](http://csbl.bmb.uga.edu/~ffzhou/cBar/)
  - [Zhou F, Xu Y. Bioinformatics. 2010 Aug 15;26(16):2051-2. "cBar: a computer program to distinguish plasmid-derived from chromosome-derived sequence fragments in metagenomics data."](https://www.ncbi.nlm.nih.gov/pubmed/20538725)
- ApE(A plasmid Editor)
  - 2013/12/04 [ApEでシーケンスアライメント - ニュートラルな研究者のメモ](http://cobucchii.hatenablog.com/entry/2013/12/04/214725)
  - [ApE(A plasmid Editor)を利用してプラスミドを設計する - 統合TV (togotv)(2013-05-27)](http://togotv.dbcls.jp/20130527.html)
  - 2012/7/7 [ApEでできること一覧 | LifeScienceProject](http://life-science-project.com/540/)
  - 2009.08.03 [DNA情報の取得とApEでの操作 - 花井＠産総研](https://staff.aist.go.jp/s-hanai/gene_download.html)
  - [堀田研究室｜リンク](http://www.cira.kyoto-u.ac.jp/hotta/link.html) ApE フリーであるにも関わらず、非常に優秀な塩基配列編集ソフトウェア。GeneBank形式等の各種塩基配列ファイルを読み込んで、アノテーション付きで表示や編集が可能。制限酵素の切断部位やサイズを様々に表示したり、さらにはDam/Dcm依存性の制限酵素の切り替えもボタン一つ。プラスミドマップの描画にも対応しており、シンプルだが実用上は十分。Mac, Win, Unix/Linux対応。

### Nucleotide composition
- [Suzuki H et al. Molecular Life Sciences. 2014 May "Genomic Signature Analysis to Predict Plasmid Host Range."](http://link.springer.com/referenceworkentry/10.1007/978-1-4614-6436-5_574-1)
- [Suzuki H et al. J Bacteriol. 2010 Nov "Predicting plasmid promiscuity based on genomic signature."](http://www.ncbi.nlm.nih.gov/pubmed/20851899) | [Supplemental material](http://jb.asm.org/content/192/22/6045/suppl/DC1)
  - [Predicting Plasmid Promiscuity Could Help Fight Antibiotic Resistance | BEACON](http://beacon-center.org/blog/2011/03/28/predicting-plasmid-promiscuity-could-help-fight-antibiotic-resistance/)
- [Suzuki H et al. Nucleic Acids Res. 2008 Dec "Using Mahalanobis distance to compare genomic signatures between bacterial plasmids and chromosomes."](http://www.ncbi.nlm.nih.gov/pubmed/18953039) | [Supplementary Data](http://nar.oxfordjournals.org/content/36/22/e147/suppl/DC1)
- [Norberg P et al. Nat Commun. 2011;2:268. "The IncP-1 plasmid backbone adapts to different host bacterial species and evolves through homologous recombination."](http://www.ncbi.nlm.nih.gov/pubmed/21468020)
- [van Passel MW et al. BMC Genomics. 2006 Feb "Compositional discordance between prokaryotic plasmids and host chromosomes."](http://www.ncbi.nlm.nih.gov/pubmed/16480495)
- [Nishida H. Int J Evol Biol. 2012 "Comparative analyses of base compositions, DNA sizes, and dinucleotide frequency profiles in archaeal and bacterial chromosomes and plasmids."](http://www.ncbi.nlm.nih.gov/pubmed/22536540)
- [Rocha EP, Danchin A. Trends Genet. 2002 Jun "Base composition bias might result from competition for metabolic resources."](http://www.ncbi.nlm.nih.gov/pubmed/12044357)


https://www.ncbi.nlm.nih.gov/pubmed/19233962
Mol Biol Evol. 2009 May;26(5):1163-9. 
Phylogenetic signals in DNA composition: limitations and prospects.
Mrázek J


### Codon usage
- [Davis JJ, Olsen GJ. Mol Biol Evol. 2010 Apr "Modal codon usage: assessing the typical codon usage of a genome."](https://www.ncbi.nlm.nih.gov/pubmed/20018979)
- [Guo FB, Yuan JB. DNA Res. 2009 Apr "Codon usages of genes on chromosome, and surprisingly, genes in plasmid are primarily affected by strand-specific mutational biases in Lawsonia intracellularis."](https://www.ncbi.nlm.nih.gov/pubmed/19221094)
- [Peixoto L et al. Gene. 2003 Nov 27 "The strength of translational selection for codon usage varies in the three replicons of Sinorhizobium meliloti."](https://www.ncbi.nlm.nih.gov/pubmed/14597394)

### Plasmid Copy Number
- [Plasmid copy number - Wikipedia](https://en.wikipedia.org/wiki/Plasmid_copy_number)
- 14th January, 2015 [How to Manipulate Plasmid Copy Number - Bitesize Bio](http://bitesizebio.com/22824/how-to-manipulate-plasmid-copy-number/)
- Feb 6, 2014 [Plasmids 101: Origin of Replication](http://blog.addgene.org/plasmid-101-origin-of-replication) Copy Number+
- []()
- [Anindyajati et al. Sci Pharm. 2016 Feb 14;84(1):89-101. "Plasmid Copy Number Determination by Quantitative Polymerase Chain Reaction."](https://www.ncbi.nlm.nih.gov/pubmed/27110501) | [Tab. 2. Plasmid Copy Number Determination by qPCR](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4839616/table/T2/)
- [San Millan A et al. Antimicrob Agents Chemother. 2015;59(6):3335-41. "Small-plasmid-mediated antibiotic resistance is enhanced by increases in plasmid copy number and bacterial fitness."](https://www.ncbi.nlm.nih.gov/pubmed/25824216) | [FIG 5. Plasmid copy number and bacterial fitness enhance antibiotic resistance.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4432117/figure/F5/)

### Rep

https://www.ncbi.nlm.nih.gov/pubmed/21296948
Appl Environ Microbiol. 2011 Apr;77(7):2522-6. 
Phylogeny of replication initiator protein TrfA reveals a highly divergent clade of incompatibility group P1 plasmids.
Stenger DC, Lee MW.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3067460/
Genes for four TrfA homologues are integrated into chromosomes of their respective hosts
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3067460/table/t1/
cNA, not applicable; integrated in host chromosome.

### Resistance
https://www.ncbi.nlm.nih.gov/protein/AMP50525
TrfA protein [uncultured bacterium]
https://www.ncbi.nlm.nih.gov/pubmed/27172044
Nature. 2016 May 12;533(7602):212-6. 
Interconnected microbiomes and resistomes in low-income human habitats.

- [Conlan S et al. Sci Transl Med. 2014 Sep 17. "Single-molecule sequencing to track plasmid diversity of hospital-associated carbapenemase-producing Enterobacteriaceae."](https://www.ncbi.nlm.nih.gov/pubmed/25232178)

https://holtlab.net/tag/antibiotic-resistance/
antibiotic resistance | Holt Lab

#### New Delhi metallo-β-lactamase-1 (NDM-1)
- [Conlan S et al. Genome Announc. 2016 Jul 14;4(4). "Complete Genome Sequence of a Klebsiella pneumoniae Strain Carrying blaNDM-1 on a Multidrug Resistance Plasmid."](https://www.ncbi.nlm.nih.gov/pubmed/27417839)
- [Khong WX et al. BMC Genomics. 2016 Jun 13;17:452. "Local transmission and global dissemination of New Delhi Metallo-Beta-Lactamase (NDM): a whole genome analysis."](https://www.ncbi.nlm.nih.gov/pubmed/27297071)
- [Kumarasamy KK et al. Lancet Infect Dis. 2010 Sep "Emergence of a new antibiotic resistance mechanism in India, Pakistan, and the UK: a molecular, biological, and epidemiological study."](http://www.ncbi.nlm.nih.gov/pubmed/20705517)

#### Colistin resistance (mcr-1 gene)

https://www.ncbi.nlm.nih.gov/pubmed/28507118
Antimicrob Agents Chemother. 2017 May 15. pii: AAC.00404-17.
Colistin resistance in carbapenem-resistant Klebsiella pneumoniae mediated by chromosomal integration of plasmid DNA.

https://www.ncbi.nlm.nih.gov/pubmed/28487432
MBio. 2017 May 9;8(3). pii: e00625-17. 
Deciphering MCR-2 Colistin Resistance.

https://www.ncbi.nlm.nih.gov/pubmed/28336940
Sci Rep. 2017 Mar 24;7(1):424. 
Genetic Analysis of the IncX4 Plasmids: Implications for a Unique Pattern in the mcr-1 Acquisition.

https://www.ncbi.nlm.nih.gov/pubmed/27893854
PLoS Pathog. 2016 Nov 28;12(11):e1005957. 
Dissemination and Mechanism for the MCR-1 Colistin Resistance.

- [McGann P et al. Antimicrob Agents Chemother. 2016 Jun "Escherichia coli Harboring mcr-1 and blaCTX-M on a Novel IncF Plasmid: First Report of mcr-1 in the United States."](https://www.ncbi.nlm.nih.gov/pubmed/27230792)
- [Fernandes MR et al. Euro Surveill. 2016 Apr 28;21(17). "Silent dissemination of colistin-resistant Escherichia coli in South America could contribute to the global spread of the mcr-1 gene."](https://www.ncbi.nlm.nih.gov/pubmed/27168587) | [Eurosurveillance - View Article](http://www.eurosurveillance.org/ViewArticle.aspx?ArticleId=22458)
- [Suzuki S et al. Lancet Infect Dis. 2016 Mar "Investigation of a plasmid genome database for colistin-resistance gene mcr-1."](http://www.ncbi.nlm.nih.gov/pubmed/26774245)
- [Skov RL, Monnet DL. Euro Surveill. 2016;21(9). "Plasmid-mediated colistin resistance (mcr-1 gene): three months later, the story unfolds."](http://www.ncbi.nlm.nih.gov/pubmed/26967914) | [Eurosurveillance - View Article](http://www.eurosurveillance.org/ViewArticle.aspx?ArticleId=21403)
- [Liu YY et al. Lancet Infect Dis. 2016 Feb "Emergence of plasmid-mediated colistin resistance mechanism MCR-1 in animals and human beings in China: a microbiological and molecular biological study."](http://www.ncbi.nlm.nih.gov/pubmed/26603172)

### IncP

https://www.ncbi.nlm.nih.gov/pubmed/28264851
Antimicrob Agents Chemother. 2017 Apr 24;61(5).
MCR-1.6, a New MCR Variant Carried by an IncP Plasmid in a Colistin-Resistant Salmonella enterica Serovar Typhimurium Isolate from a Healthy Individual.
Lu X1, Hu Y2, Luo M3, Zhou H1, Wang X1,4, Du Y1, Li Z1, Xu J4, Zhu B5, Xu X6, Kan B7.
https://www.ncbi.nlm.nih.gov/nuccore/KY352406

https://www.ncbi.nlm.nih.gov/pubmed/27895009
Antimicrob Agents Chemother. 2017 Jan 24;61(2).
IncP Plasmid Carrying Colistin Resistance Gene mcr-1 in Klebsiella pneumoniae from Hospital Sewage.
Zhao F1,2, Feng Y1,2, Lü X1,2, McNally A3, Zong Z4,2,5.

https://www.ncbi.nlm.nih.gov/pubmed/24096417
Appl Environ Microbiol. 2013 Dec;79(24):7684-95.
Diverse broad-host-range plasmids from freshwater carry few accessory genes.
Brown CJ1, Sen D, Yano H, Bauer ML, Rogers LM, Van der Auwera GA, Top EM.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3837812/table/T2/

https://www.ncbi.nlm.nih.gov/pubmed/22936717
Mol Biol Evol. 2013 Jan;30(1):154-66. doi: 10.1093/molbev/mss210. Epub 2012 Aug 30.
Inferring the evolutionary history of IncP-1 plasmids despite incongruence among backbone gene trees.
Sen D1, Brown CJ, Top EM, Sullivan J.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3525142/figure/mss210-F1/

![https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3525142/figure/mss210-F1/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3525142/bin/mss210f1p.jpg)

https://www.ncbi.nlm.nih.gov/nuccore/AB231906.2
Sphingomonas sp. A1 plasmid pA1 DNA, complete sequence
https://www.ncbi.nlm.nih.gov/pubmed/16445980
Plasmid. 2006 Jul;56(1):11-23. Epub 2006 Jan 30.
Sequence and analysis of the 46.6-kb plasmid pA1 from Sphingomonas sp. A1 that corresponds to the typical IncP-1beta plasmid backbone without any accessory gene.

https://www.ncbi.nlm.nih.gov/pubmed/16151119
Appl Environ Microbiol. 2005 Sep;71(9):5309-17.
Plasmid donor affects host range of promiscuous IncP-1beta plasmid pB10 in an activated-sludge microbial community.
De Gelder L1, Vandecasteele FP, Brown CJ, Forney LJ, Top EM.

### IncQ
https://www.ncbi.nlm.nih.gov/pubmed/11729261
Microbiol Mol Biol Rev. 2001 Dec;65(4):481-96, table of contents.
Comparative biology of IncQ and IncQ-like plasmids.
Rawlings DE1, Tietze E.

### Plasmidome
- [Martínez et al. 2016 November "Genomic and metagenomic technologies to explore the antibiotic resistance mobilome"](http://onlinelibrary.wiley.com/doi/10.1111/nyas.13282/full)
analysis of plasmid metagenomes is still in its infancy. プラスミド・メタゲノム解析
- [Li AD et al. Front Microbiol. 2015 Sep 24. "Exploring antibiotic resistance genes and metal resistance genes in plasmid metagenomes from wastewater treatment plants."](https://www.ncbi.nlm.nih.gov/pubmed/26441947)
- [Welcome to the plasmidome. Nat Rev Microbiol. 2012 May](http://www.ncbi.nlm.nih.gov/pubmed/22580363)
- [Insights into the bovine rumen plasmidome. Proc Natl Acad Sci U S A. 2012 Apr](http://www.ncbi.nlm.nih.gov/pubmed/22431592)
- [Evolutionary, ecological and biotechnological perspectives on plasmids resident in the human gut mobile metagenome. Bioeng Bugs. 2012 Jan](http://www.ncbi.nlm.nih.gov/pubmed/22126801)
- [Jones BV, Marchesi JR. Nat Methods. 2007 Jan. "Transposon-aided capture (TRACA) of plasmids resident in the human gut mobile metagenome."](https://www.ncbi.nlm.nih.gov/pubmed/17128268)
- []()

### HGT
horizontal gene transfer (HGT) 

https://www.ncbi.nlm.nih.gov/pubmed/22564249
Trends Microbiol. 2012 Jun;20(6):262-7. doi: 10.1016/j.tim.2012.04.003. Epub 2012 May 5.
Plasmid-mediated horizontal gene transfer is a coevolutionary process.
Harrison E1, Brockhurst MA.

https://www.ncbi.nlm.nih.gov/pubmed/25370194
Life (Basel). 2014 May 16;4(2):217-24. doi: 10.3390/life4020217.
Horizontal Gene Transfer among Bacteria and Its Role in Biological Evolution.
Arber W1.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4187160/
- F’-like conjugative plasmids have soon become known to act sometimes in the horizontal transfer of antibiotic resistance determinants.
- Viral DNA molecules and F conjugative plasmids were envisaged to serve as autonomously replicating gene vectors, into which a relatively short DNA fragment could be spliced.

### gene sharing

https://www.ncbi.nlm.nih.gov/pubmed/22130968
Mol Biol Evol. 2012 Apr;29(4):1225-40. doi: 10.1093/molbev/msr292. Epub 2011 Nov 29.
Large-scale analysis of plasmid relationships through gene-sharing networks.
Tamminen M1, Virta M, Fani R, Fondi M.

https://www.ncbi.nlm.nih.gov/pubmed/20636373
Environ Microbiol. 2010 Dec;12(12):3228-42. doi: 10.1111/j.1462-2920.2010.02295.x.
The horizontal flow of the plasmid resistome: clues from inter-generic similarity networks.
Fondi M1, Fani R.

https://www.ncbi.nlm.nih.gov/pubmed/20181243
BMC Evol Biol. 2010 Feb 24;10:59. doi: 10.1186/1471-2148-10-59.
Exploring the evolutionary dynamics of plasmids: the Acinetobacter pan-plasmidome.
Fondi M1, Bacci G, Brilli M, Papaleo MC, Mengoni A, Vaneechoutte M, Dijkshoorn L, Fani R.

https://www.ncbi.nlm.nih.gov/pubmed/20007769
Proc Natl Acad Sci U S A. 2010 Jan 5;107(1):127-32. doi: 10.1073/pnas.0908978107. Epub 2009 Dec 10.
Network analyses structure genetic diversity in independent genetic worlds.
Halary S1, Leigh JW, Cheaib B, Lopez P, Bapteste E.

### Unclassified
https://www.ncbi.nlm.nih.gov/pubmed/27385827
Proc Natl Acad Sci U S A. 2016 Jul 19;113(29):8260-5. doi: 10.1073/pnas.1600974113. Epub 2016 Jul 6.
Source-sink plasmid transfer dynamics maintain gene mobility in soil bacterial communities.
Hall JP1, Wood AJ2, Harrison E3, Brockhurst MA3.


https://www.ncbi.nlm.nih.gov/pubmed/24587126
PLoS One. 2014 Feb 24;9(2):e89922. doi: 10.1371/journal.pone.0089922. eCollection 2014.
Cultivation-independent screening revealed hot spots of IncP-1, IncP-7 and IncP-9 plasmid occurrence in different environmental habitats.

https://www.ncbi.nlm.nih.gov/pubmed/17553065
FEMS Microbiol Rev. 2007 Jul;31(4):449-77.
Genomics of IncP-1 antibiotic resistance plasmids isolated from wastewater treatment plants provides evidence for a widely accessible drug resistance gene pool.
Schlüter A1, Szczepanowski R, Pühler A, Top EM.

http://onlinelibrary.wiley.com/doi/10.1111/j.1574-6976.2007.00074.x/full
All plasmids contain genes for replication initiation (Rep), conjugative DNA-transfer (Tra) and mating-pair-formation (Trb), stable plasmid inheritance and plasmid control (Ctl) in similar arrangements (see Figs 1 and 2). 

Plasmid backbone modules for replication initiation (Rep–grey), mating-pair-formation (Trb–green), conjugative DNA-transfer (Tra–red) and plasmid control and stable maintenance and inheritance (Ctl–yellow) are indicated by coloured bars.

- [Shintani M et al. Appl Environ Microbiol. 2014 Jan "Single-cell analyses revealed transfer ranges of IncP-1, IncP-7, and IncP-9 plasmids in a soil bacterial community."](https://www.ncbi.nlm.nih.gov/pubmed/24141122)
  - [難培養性微生物をも対象にしたプラスミドの宿主域の解明](http://www.lc.shizuoka.ac.jp/pdf/baio36shintani.pdf)
  - [一細胞レベルの解析によるプラスミドの土壌細菌集団中における真の宿主域の決定](http://www.jsbba.or.jp/wp-content/uploads/file/award/2012/topics/17_2C22a03.pdf)
- Sequences of 19 plasmid replicon types. https://github.com/mscook/VFDB/blob/master/plasmid_replicons.fa
- [Chan, Jane 2013 "Molecular epidemiology of fosfomycin-resistant Escherichia coli from humans and animals"](http://hub.hku.hk/handle/10722/197077) | [FullText.pdf](http://hub.hku.hk/bitstream/10722/197077/2/FullText.pdf) Table 1. 4 List of known incompatibility groups of Enterobacteriaceae
- [CiNii Articles -  pUCプラスミドにまつわるエトセトラ(生物工学基礎講座-バイオよもやま話-)](http://ci.nii.ac.jp/naid/110008750634) | [PDF](https://www.sbj.or.jp/wp-content/uploads/file/sbj/8910/8910_yomoyama-2.pdf)
- [Virtual Genome Project Blog](http://virtualgenomeproject.blogspot.jp)
 - 2009/03 [Genome's barcodes](http://virtualgenomeproject.blogspot.jp/2009/03/genomes-barcodes.html)
 - 2008/12 [Functions of horizontally transferred genes](http://virtualgenomeproject.blogspot.jp/2008/12/functions-of-horizontally-transferred.html)
 - 2008/09 [Contribution of horizontal gene transfer to microbial evolution](http://virtualgenomeproject.blogspot.jp/2008/09/contribution-of-horizontal-gene.html)
 - 2008/07 [Reticulate classification of mobile genetic elements](http://virtualgenomeproject.blogspot.jp/2008/07/reticulate-classification-of-mobile.html)
- Plasmids as genetic tools for microbial engineering
 - 2001-06 [Overcoming the codon bias of E. coli for enhanced protein expression](http://wolfson.huji.ac.il/expression/rosetta.pdf)

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

http://people.ibest.uidaho.edu/~etop/vgp/tnsBasics.html


https://www.ncbi.nlm.nih.gov/pubmed/10430917
Proc Natl Acad Sci U S A. 1999 Aug 3;96(16):9184-9.
Genome signature comparisons among prokaryote, plasmid, and mitochondrial DNA.
Campbell A1, Mrázek J, Karlin S.

![](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC17754/bin/pq1692140001.jpg)

http://www.ncbi.nlm.nih.gov/pubmed/18953039
Nucleic Acids Res. 2008 Dec;36(22):e147. doi: 10.1093/nar/gkn753. Epub 2008 Oct 25.
Using Mahalanobis distance to compare genomic signatures between bacterial plasmids and chromosomes.
Suzuki H1, Sota M, Brown CJ, Top EM.

http://www.ncbi.nlm.nih.gov/pubmed/20851899
J Bacteriol. 2010 Nov;192(22):6045-55. doi: 10.1128/JB.00277-10. Epub 2010 Sep 17.
Predicting plasmid promiscuity based on genomic signature.
Suzuki H, Yano H, Brown CJ, Top EM.

![](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2976448/bin/zjb9990999330003.jpg)

FIG. 3.
Bar plot showing the number of candidate evolutionary hosts for each plasmid. 

![](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2976448/bin/zjb9990999330004.jpg)

FIG. 4.
Box-and-whisker plots summarizing the distributions of diversity among candidate evolutionary hosts for plasmids from six incompatibility (Inc) groups (F, H, I, N, P, and W).

http://link.springer.com/referenceworkentry/10.1007/978-1-4614-6436-5_574-1#page-1
Suzuki H, Brown CJ, Top EM. "Genomic Signature Analysis to Predict Plasmid Host Range", Molecular Life Sciences, DOI 10.1007/978-1-4614-6436-5_574-1, Springer Science+Business Media New York 2014

----------


