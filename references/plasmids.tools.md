# plasmid tools

## Table of Contents
- [review](#review)
- [updates](#updates)
- [data](#data)
- [tools](#tools)


----------


### MOB-suite
https://github.com/phac-nml/mob-suite

11:40 PM · Sep 25, 2020
https://twitter.com/JohnHENash/status/1309503134423748608
John Nash on Twitter: "Our new paper on plasmid typing is out. I have the most amazing co-authors... https://t.co/49iOzFSWvz" / Twitter

https://pubmed.ncbi.nlm.nih.gov/32969786/
Microb Genom
. 2020 Sep 24. doi: 10.1099/mgen.0.000435. Online ahead of print.
Universal whole-sequence-based plasmid typing and its utility to prediction of host range and epidemiological surveillance
James Robertson 1, Kyrylo Bessonov 1, Justin Schonfeld 1, John H E Nash 1
https://www.microbiologyresearch.org/content/journal/mgen/10.1099/mgen.0.000435#tab2

https://www.ncbi.nlm.nih.gov/pubmed/30052170
Microb Genom. 2018 Aug;4(8). doi: 10.1099/mgen.0.000206. Epub 2018 Jul 27.
MOB-suite: software tools for clustering, reconstruction and typing of plasmids from draft assemblies.
Robertson J1, Nash JHE2.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6159552/
- Introduction
  - There is a strong need for automatic tools for the detection of plasmids from WGS data and numerous tools have been developed using a diverse array of approaches [1, 4, 16–18]. 
  - Additionally, the suite provides a scalable nomenclature for identifying plasmids over short evolutionary periods by estimating genomic distances based on mash min-hashing [22]. 
- MOB-cluster method
MOB-cluster uses mash dist [22] with default parameters to calculate all pairwise genomic distances for each plasmid contained in the closed plasmid reference database. 
We selected a permissive mash dist clustering threshold of 0.05, which resulted in clusters consisting largely of single replicon and MOB types. The distance metric used by mash dist allows for plasmids with considerable differences in size to be grouped together.

PlasFlowの論文（17.）は、引用されているものの、議論されていない。



----------
## ZhuLab
Zhencheng Fang

### Fang_2020_PlasGUN
http://cqb.pku.edu.cn/ZhuLab/PlasGUN/
https://github.com/zhenchengfang/PlasGUN/

https://pubmed.ncbi.nlm.nih.gov/32091572/
Bioinformatics
. 2020 May 1;36(10):3239-3241. doi: 10.1093/bioinformatics/btaa103.
PlasGUN: gene prediction in plasmid metagenomic short reads using deep learning
Zhencheng Fang 1, Jie Tan 1, Shufang Wu 1, Mo Li 1, Chunhui Wang 1, Yongchu Liu 1, Huaiqiu Zhu 1
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7214025/

### Fang_2019_PPR-Meta
http://cqb.pku.edu.cn/ZhuLab/PPR_Meta
https://github.com/zhenchengfang/PPR-Meta

https://www.ncbi.nlm.nih.gov/pubmed/31220250
Gigascience
. 2019 Jun 1;8(6):giz066. doi: 10.1093/gigascience/giz066.
PPR-Meta: a tool for identifying phages and plasmids from metagenomic fragments using deep learning
Zhencheng Fang 1 2, Jie Tan 1 2, Shufang Wu 1 2, Mo Li 1 2 3, Congmin Xu 1 2 4, Zhongjie Xie 1 2, Huaiqiu Zhu 1 2
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6586199/
- Mathematical model of DNA sequences
Here, we use a more detailed approach to represent the DNA fragments. Specifically, each sequence is represented by “base one-hot matrix (BOH)” and “codon one-hot matrix (COH).”

----------
## review

----------
### PlasmidFinder

https://cge.cbs.dtu.dk/services/PlasmidFinder/
PlasmidFinder 2.1
Software version: 2.0.1 (2020-02-07)
Database version: (2020-04-02)

https://bitbucket.org/genomicepidemiology/plasmidfinder_db/src/master/
クローンの作成

Oct 10, 2018
https://github.com/tseemann/abricate/issues/66
PlasmidFinder data should be downloaded from BitBucket · Issue #66 · tseemann/abricate

http://www.ncbi.nlm.nih.gov/pubmed/24777092
Antimicrob Agents Chemother
. 2014 Jul;58(7):3895-903. doi: 10.1128/AAC.02412-14. Epub 2014 Apr 28.
In Silico Detection and Typing of Plasmids Using PlasmidFinder and Plasmid Multilocus Sequence Typing
Alessandra Carattoli 1, Ea Zankari 2, Aurora García-Fernández 1, Mette Voldby Larsen 3, Ole Lund 3, Laura Villa 1, Frank Møller Aarestrup 2, Henrik Hasman 4
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4068535/
https://aac.asm.org/content/58/7/3895.long


----------
## updates

## 2020

Aug 20, 2020
https://twitter.com/mSphereJ/status/1296110566424141825
mSphere EIC on Twitter: "Tracking of Antibiotic Resistance Transfer and Rapid Plasmid Evolution in a Hospital Setting by Nanopore Sequencing https://t.co/VLrQf6hJsc @ASMicrobiology #mSphere" / Twitter
https://msphere.asm.org/content/5/4/e00525-20
Tracking of Antibiotic Resistance Transfer and Rapid Plasmid Evolution in a Hospital Setting by Nanopore Sequencing | mSphere 
- We developed the computational platform plasmIDent for Nanopore-based characterization of clinical isolates and monitoring of ARG transfer, comprising de novo assembly of genomes and plasmids, plasmid circularization, ARG annotation, comparative genome analysis of multiple isolates, and visualization of results."
- pathoLogic, plasmIDent and a graphical user interface (GUI) are freely available on github (plasmIDent pipeline, https://github.com/imgag/plasmIDent; pathoLogic pipeline, https://github.com/imgag/pathoLogic).


https://www.ncbi.nlm.nih.gov/pubmed/32265894
Front Microbiol. 2020 Mar 24;11:483. doi: 10.3389/fmicb.2020.00483. eCollection 2020.
Analysis of COMPASS, a New Comprehensive Plasmid Database Revealed Prevalence of Multireplicon and Extensive Diversity of IncF Plasmids.
Douarre PE1, Mallet L1, Radomski N1, Felten A1, Mistou MY2.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7105883/
https://www.frontiersin.org/articles/10.3389/fmicb.2020.00483/full
https://github.com/itsmeludo/COMPASS



Posted August 12, 2020.
https://www.biorxiv.org/content/10.1101/2020.01.12.903252v3
Posted January 14, 2020.
https://www.biorxiv.org/content/10.1101/2020.01.12.903252v1
SCAPP: An algorithm for improved plasmid assembly in metagenomes | bioRxiv
https://github.com/Shamir-Lab/SCAPP
SCAPP (Sequence Contents Aware Plasmid Peeler) は、メタゲノム・アセンブリ・グラフからプラスミド配列を構築する。他のツール（RecyclerやmetaplasmidSPAdes）と同等以上のパフォーマンス。

https://www.ncbi.nlm.nih.gov/pubmed/31584171
Methods Mol Biol. 2020;2075:295-308. doi: 10.1007/978-1-4939-9877-7_21.
MOBscan: Automated Annotation of MOB Relaxases.
Garcillán-Barcia MP1, Redondo-Salvo S2, Vielva L3, de la Cruz F4.



### gplas
https://gitlab.com/sirarredondo/gplas

https://pubmed.ncbi.nlm.nih.gov/32271863/
Bioinformatics
. 2020 Jun 1;36(12):3874-3876. doi: 10.1093/bioinformatics/btaa233.
gplas: a comprehensive tool for plasmid analysis using short-read graphs
Sergio Arredondo-Alonso 1, Martin Bootsma 2 3, Yaïr Hein 3, Malbert R C Rogers 1, Jukka Corander 4 5 6, Rob J L Willems 1, Anita C Schürch 1



## 2019

### WASPS

https://www.ncbi.nlm.nih.gov/pubmed/31589313
Bioinformatics. 2019 Oct 7. pii: btz745. doi: 10.1093/bioinformatics/btz745. [Epub ahead of print]
WASPS: Web-Assisted Symbolic Plasmid Synteny Server.
Badel C1, Da Cunha V1, Catchpole R1, Forterre P1,2, Oberto J1.
https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btz745/5582648

Recently, plasmid assets have been developed proposing either a comprehensive manually curated bacterial plasmid list (Brooks et al., 2019) or a bacterial plasmid database which can be interrogated using sequence similarity programs (Galata et al., 2019). 

https://twitter.com/search?q=plasmid%20database&src=typed_query&f=live
Oct 15
WASPS, a new plasmid web service for similarity analyses and synteny map construction. Also includes a comprehensive and updated natural plasmid database.


### 

https://www.ncbi.nlm.nih.gov/pubmed/31187446
Genes Genomics. 2019 Sep;41(9):1077-1083. doi: 10.1007/s13258-019-00839-1. Epub 2019 Jun 11.
Comparison of de-novo assembly tools for plasmid metagenome analysis.
Gupta SK1, Raza S1, Unno T2,3.
https://link.springer.com/article/10.1007/s13258-019-00839-1
we suggest that the use of MEGAHIT for plasmid metagenome analysis may offer more diverse plasmids with less computer resource required.

### HyAsP
https://github.com/cchauve/HyAsP

https://www.ncbi.nlm.nih.gov/pubmed/31116364
Bioinformatics. 2019 May 22. pii: btz413. doi: 10.1093/bioinformatics/btz413. [Epub ahead of print]
HyAsP, a greedy tool for plasmids identification.
Müller R1, Chauve C2.
https://academic.oup.com/bioinformatics/article-abstract/35/21/4436/5497247?redirectedFrom=fulltext
You do not currently have access to this article.

http://kazumaxneo.hatenablog.com/entry/2019/07/14/073000
アセンブリグラフからプラスミドを検出する HyAsP - macでインフォマティクス


### DoriC

https://pubmed.ncbi.nlm.nih.gov/30364951/
Nucleic Acids Res
. 2019 Jan 8;47(D1):D74-D77. doi: 10.1093/nar/gky1014.
DoriC 10.0: an updated database of replication origins in prokaryotic genomes including chromosomes and plasmids
Hao Luo 1 2 3, Feng Gao 1 2 3

http://kazumaxneo.hatenablog.com/entry/2019/06/21/073000
バクテリア、アーキア、プラスミドの複製起点（ori）データベース DoriC - macでインフォマティクス

### tiptoft

https://twitter.com/andrewjpage/status/1101497825324609537
Andrew Page on Twitter: "Small plasmids can disappear at the read correction step of long read assembly.Tiptoft published today in #JOSS by @andrewjpage & @torstenseemann takes uncorrected long reads & identifies what plasmids are actually present. Install: pip3 install tiptoft https://t.co/xru3UyeIL0"
10:02 AM - 1 Mar 2019
http://joss.theoj.org/papers/10.21105/joss.01021
The Journal of Open Source Software: TipToft: detecting plasmids contained in uncorrected long read sequencing data

http://kazumaxneo.hatenablog.com/entry/2019/03/05/073000
ナノポアのrawロングリードからプラスミドを探索する tiptoft - macでインフォマティクス

### RefSoil
https://msystems.asm.org/content/4/1/e00349-18
RefSoil+: a Reference Database for Genes and Traits of Soil Plasmids
Taylor K. Dunivin, Jinlyung Choi, Adina Howe, Ashley Shade
RefSoil+ applications.RefSoil+ is publicly available on GitHub (https://github.com/ShadeLab/RefSoil_plasmids). 

### meta_arsenic
ヒ素耐性遺伝子を検出するためのツールキット

https://github.com/ShadeLab/meta_arsenic
ShadeLab/meta_arsenic: Toolkit for detecting arsenic resistance genes in nucleotide and amino acid sequences. A meta-analysis of arsenic resistance genes in soil genomes (RefSoil+) and metagenomes

https://www.biorxiv.org/content/10.1101/445502v1
Targeting microbial arsenic resistance genes: a new bioinformatic toolkit informs arsenic ecology and evolution in soil genomes and metagenomes | bioRxiv
https://www.biorxiv.org/content/biorxiv/early/2018/10/17/445502.full.pdf

 All arsenic resistance
gene databases are freely available on FunGene (http://fungene.cme.msu.edu/). 

 Reference and BLAST databases are publicly
available on GitHub (https://github.com/ShadeLab/meta_arsenic). 

## 2018

https://www.ncbi.nlm.nih.gov/pubmed/30619542
Comput Struct Biotechnol J. 2018 Dec 15;17:70-81. doi: 10.1016/j.csbj.2018.12.001. eCollection 2019.
Reconsidering plasmid maintenance factors for computational plasmid design.
Yano H1, Shintani M2,3, Tomita M4,5, Suzuki H4,5, Oshima T6.
https://doi.org/10.1016/j.csbj.2018.12.001
https://www.sciencedirect.com/science/article/pii/S2001037018301685

3. Publicly Available Resources
3.1. Plasmid Sequence Data

Orlek et al. [135] presented a curated dataset of complete Enterobacteriaceae plasmids compiled from the NCBI database (https://figshare.com/s/18de8bdcbba47dbaba41). The web servers PLSDB (https://ccb-microbe.cs.uni-saarland.de/plsdb/) [136] and pATLAS (http://www.patlas.site) [137] provide a more comprehensive collection of bacterial plasmids retrieved from the NCBI nucleotide database.

3.2. Bioinformatics Tools

## 2017

2017年12月20日
https://www.yodosha.co.jp/yodobook/book/9784758125031/
実験医学：どこでも　誰でも　より長く　ナノポアシークエンサーが研究の常識を変える！ - 羊土社
■サマリーを表示する
ナノポアシークエンサーによる薬剤耐性菌ゲノムの解析【鈴木仁人，矢原耕史，平林亜希，柴山恵吾】
近年，ナノポアシークエンサーによる1 分子長鎖（ロングリード）型シークエンシング技術の革新により，超長鎖DNA配列（～1 Mbp）の解読，RNA配列の直接解読，メチル化などの修飾塩基の検出などが可能になってきた．これらの技術は，細菌の染色体やプラスミドを含む完全配列の解析に加え，

https://www.ncbi.nlm.nih.gov/pubmed/29220507
Brief Bioinform. 2017 Dec 5. doi: 10.1093/bib/bbx162. [Epub ahead of print]
Assessing the heterogeneity of in silico plasmid predictions based on whole-genome-sequenced clinical isolates.
Laczny CC, Galata V, Plum A, Posch AE, Keller A.
- tools (cBar, PlasmidFinder, plasmidSPAdes and Recycler)

https://gitlab.com/sirarredondo/Plasmid_Assembly/tree/master
Sergio_Arredondo / Plasmid_Assembly · GitLab

https://www.ncbi.nlm.nih.gov/pubmed/29177087
Microb Genom. 2017 Aug 18;3(10):e000128. doi: 10.1099/mgen.0.000128. eCollection 2017 Oct.
On the (im)possibility of reconstructing plasmids from whole-genome short-read sequencing data.
Arredondo-Alonso S1, Willems RJ1, van Schaik W1,2, Schürch AC1.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5695206/
- four programs (PlasmidSPAdes, Recycler, cBar and PlasmidFinder) 
- Table 1.
Overview of the programs to predict plasmids from short-read sequencing data


## 2016

https://www.cell.com/molecular-therapy-family/molecular-therapy/fulltext/S1525-0016(16)32965-3
156. A Plasmid Manager, a Comprehensive Database for Archiving Plasmid DNA Sequence: Molecular Therapy
OLIGONUCLEOTIDE THERAPEUTICS I| VOLUME 24, SUPPLEMENT 1, S61, MAY 01, 2016

## 2014

Apr 22, 2014
https://github.com/mscook/VFDB
Sequences of 19 plasmid replicon types.
https://github.com/mscook/VFDB/blob/master/plasmid_replicons.fa

----------

## data

https://twitter.com/BioMickWatson/status/1055412464039460865
Mick Watson on Twitter: "Best database of microbial plasmid sequences?"
6:55 AM - 25 Oct 2018
not sure if "best" but: pATLAS (http://www.patlas.site/ ) and our, recently created, database PLSDB (https://ccb-microbe.cs.uni-saarland.de/plsdb/ )

### Sistrom
Sistrom, Mark (2018), Plasmids database, Dryad, Dataset, https://doi.org/10.15146/R33X2J

https://www.ncbi.nlm.nih.gov/pubmed/30637385
Microbiol Resour Announc. 2019 Jan 3;8(1). pii: e01325-18. doi: 10.1128/MRA.01325-18. eCollection 2019 Jan.
A Curated, Comprehensive Database of Plasmid Sequences.
Brooks L1, Kaze M2, Sistrom M2.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6318356/
ftp://ftp.ncbi.nlm.nih.gov/refseq/release/plasmid/, resulting in 11,677 plasmid sequences. 
This resulted in 7,426 complete and assembled plasmid sequences following this initial screening.
(https://www.ncbi.nlm.nih.gov/genome/browse#!/prokaryotes/).
This allowed us to include an additional 3,466 complete, annotated plasmid sequences, resulting in our database of 10,892 complete and annotated plasmid sequences for subsequent analyses.

Data availability. The plasmid database is available in fasta format and associated metadata are available in csv format at https://doi.org/10.15146/R33X2J.

https://www.ncbi.nlm.nih.gov/pubmed/30625112
Microb Genom. 2019 Jan;5(1). doi: 10.1099/mgen.0.000244.
Where the plasmids roam: large-scale sequence analysis reveals plasmids with large host ranges.
Brooks LE1,2, Kaze M2, Sistrom M2.

https://twitter.com/Tyu_Shi/status/1083013705514680320
Tyu_Shi on Twitter: "論文読んだ限りこのmethodでcuratedでcomprehensiveなplasmid sequence databaseと言う気にはならないな。"A Curated, Comprehensive Database of Plasmid Sequences" https://t.co/hndJfjzrYd 出張先なので800MB超のファイルダウンロードするのは避けたいが、 帰ったら一応ダウンロードしてみよう。"
9:52 AM - 9 Jan 2019

### pATLAS
http://www.patlas.site/

https://github.com/tiagofilipe12/pATLAS
http://www.patlas.site
Plasmid Atlas is a web interface that allow users to browse plasmid sequences available in the NCBI refseq database.

https://www.ncbi.nlm.nih.gov/pubmed/30395323
Nucleic Acids Res. 2019 Jan 8;47(D1):D188-D194. doi: 10.1093/nar/gky1073.
Plasmid ATLAS: plasmid visual analytics and identification in high-throughput sequencing data.
Jesus TF1, Ribeiro-Gonçalves B1, Silva DN1, Bortolaia V2, Ramirez M1, Carriço JA1.
pATLAS allows searching by plasmid name, bacterial host taxa, antibiotic resistance and virulence genes, plasmid families, and by sequence length and similarity.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6323984/
- INTRODUCTION
Currently, there are 13 924 entries in NCBI’s RefSeq plasmid database (14) and 
- DATABASE CREATION
  - With this filtered dataset, pairwise distances were calculated using Mash software (v2.0) (18) with the mash dist command, a sketch size of 1000 (-s option) and K-mer size of 21 (-k option). Pairwise distances were filtered to exclude distances with a p-value>0.05 and a mash distance<0.1. These values were selected in order to retain for display only the pairwise distances that correlate well with an Average Nucleotide Identity (ANI)>0.9 (18) (Supplementary Figures S2 and 3). 
  - Sequences of all the 13 232 plasmids are stored in pATLAS database so that users are able to download sequences and annotations from the pATLAS website or through requests to the REST API.

https://integbio.jp/dbcatalog/record/nbdc02514
pATLAS:  Plasmid Atlas
説明: 	NCBI RefSeqに登録されているプラスミドとそのメタデータを検索できるデータベースです。プラスミド名、生物種、抗生物質耐性、病原性、プラスミドファミリー、配列長、類似性による検索が可能で、プラスミド間の関係を可視化することができます。また外部パイプラインによって同定されたプラスミドセットをプラスミドネットワークに表示することもできます。



http://kazumaxneo.hatenablog.com/entry/2019/11/08/073000
pATLASflow - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2019/11/06/073000
プラスミドの分析と視覚化のwebサービス Plasmid ATLAS - macでインフォマティクス

https://twitter.com/WvSchaik/status/1060486271557091328
Willem van Schaik on Twitter: "Very interesting tool by @jacarrico: 'Plasmid ATLAS: plasmid visual analytics and identification in high-throughput sequencing data' https://t.co/CWIAoV3449"
5:56 AM - 8 Nov 2018

### PLSDB
https://ccb-microbe.cs.uni-saarland.de/plsdb/

https://integbio.jp/dbcatalog/record/nbdc02515
NCBI nucleotide database から取得したバクテリアプラスミドの配列とメタデータを整理したデータベースです。各レコードには配列長、トポロジー、分類学的情報のような種々のパラメータを付けており、これらでフィルタリングができます。 また、コンティグやロングリードのようなより長い配列についてはMashを使用することによって、遺伝子のようなより短い配列についてはBLASTnを使用することによって配列を検索することが可能です。

https://www.ncbi.nlm.nih.gov/pubmed/30380090
Nucleic Acids Res. 2018 Oct 31. doi: 10.1093/nar/gky1050. [Epub ahead of print]
PLSDB: a resource of complete bacterial plasmids.
Galata V1, Fehlmann T1, Backes C1, Keller A1.
Here, we present PLSDB, a resource containing 13 789 plasmid records collected from the NCBI nucleotide database. 
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6323999/
Data retrieval and processing pipeline
Data collection
Plasmid records were searched in the NCBI nucleotide database by using the query from Orlek et al. (4) and filtering the results to have ‘plasmid’ as location tag, being assigned to a bacterial organism and being from the specified resource (INSDC or RefSeq). 

Overview of collected plasmids
In total, 13 789 plasmid records (2945 from INSDC and 10 844 from RefSeq) were retrieved from the NCBI nucleotide database.

### Orlek

#### Orlek_2017-05_Plasmid

https://www.ncbi.nlm.nih.gov/pubmed/28286183
Plasmid
. 2017 May;91:42-52. doi: 10.1016/j.plasmid.2017.03.002. Epub 2017 Mar 9.
Ordering the mob: Insights into replicon and MOB typing schemes from analysis of a curated dataset of publicly available plasmids
Alex Orlek 1, Hang Phan 2, Anna E Sheppard 2, Michel Doumith 3, Matthew Ellington 4, Tim Peto 2, Derrick Crook 2, A Sarah Walker 2, Neil Woodford 4, Muna F Anjum 5, Nicole Stoesser 6
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5466382/

#### Orlek_2017-04

https://www.ncbi.nlm.nih.gov/pubmed/28516137
Data Brief
. 2017 Apr 23;12:423-426. doi: 10.1016/j.dib.2017.04.024. eCollection 2017 Jun.
A curated dataset of complete Enterobacteriaceae plasmids compiled from the NCBI nucleotide database
Alex Orlek 1 2, Hang Phan 1 2, Anna E Sheppard 1 2, Michel Doumith 3, Matthew Ellington 2 3, Tim Peto 1 2, Derrick Crook 1 2, A Sarah Walker 1 2, Neil Woodford 2 3, Muna F Anjum 2 4, Nicole Stoesser 1
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5426034/
Data accessibility	Data is publicly available in the Figshare repository.
https://figshare.com/s/18de8bdcbba47dbaba41

A bioinformatic protocol and code for MOB typing using the protein dataset are provided on GitHub (https://github.com/AlexOrlek/MOBtyping).

review
https://www.ncbi.nlm.nih.gov/pubmed/28232822
Front Microbiol. 2017 Feb 9;8:182. doi: 10.3389/fmicb.2017.00182. eCollection 2017.
Plasmid Classification in an Era of Whole-Genome Sequencing: Application in Studies of Antibiotic Resistance Epidemiology.
Orlek A1, Stoesser N2, Anjum MF3, Doumith M4, Ellington MJ5, Peto T1, Crook D1, Woodford N5, Walker AS1, Phan H1, Sheppard AE1.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5299020/
Table 2
Summary of common in silico tools used for plasmid analysis.



### aclame
ACLAME は、version 0.4 (5 August 2009) 以降は更新されていない。

http://aclame.ulb.ac.be/

https://www.ncbi.nlm.nih.gov/pubmed/19933762
Nucleic Acids Res. 2010 Jan;38(Database issue):D57-61. doi: 10.1093/nar/gkp938. Epub 2009 Nov 23.
ACLAME: a CLAssification of Mobile genetic Elements, update 2010.
Leplae R1, Lima-Mendez G, Toussaint A.

https://www.ncbi.nlm.nih.gov/pubmed/17064288
FEMS Microbiol Rev. 2006 Nov;30(6):980-94.
A first global analysis of plasmid encoded proteins in the ACLAME database.
Leplae R1, Lima-Mendez G, Toussaint A.

----------
## tools

https://omictools.com/plasmid-detection-category
Plasmid detection bioinformatics tools | Metagenomic sequencing analysis - omicX


----------

### oriTfinder

https://www.ncbi.nlm.nih.gov/pubmed/29733379
Nucleic Acids Res. 2018 Jul 2;46(W1):W229-W234. doi: 10.1093/nar/gky352.
oriTfinder: a web-based tool for the identification of origin of transfers in DNA sequences of bacterial mobile genetic elements.
Li X1, Xie Y1, Liu M1, Tai C1, Sun J2, Deng Z1, Ou HY1,3.
http://bioinfo-mml.sjtu.edu.cn/oriTfinder

### MacSyFinder
CONJscan

https://research.pasteur.fr/en/software/conjscan-t4ssscan/
Eduardo Rocha - CONJscan-T4SSscan • Research - Institut Pasteur
MacSyFinder. The T4SS for protein secretion can be identified using TXSScan. The CONJscan part is now a module in MacSyFinder.

https://www.ncbi.nlm.nih.gov/pubmed/29905872
Mol Biol Evol. 2018 Jun 14. doi: 10.1093/molbev/msy123. [Epub ahead of print]
Host range and genetic plasticity explain the co-existence of integrative and extrachromosomal mobile genetic elements.
Cury J1,2, Oliveira PH1,2,3, de la Cruz F4, Rocha EPC1,2.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6107060/
Conjugative systems were detected using the CONJscan module of MacSyFinder (Abby et al. 2014), with protein profiles and definitions of the MPF type T, published previously (Guglielmini et al. 2014).

https://www.ncbi.nlm.nih.gov/pubmed/28911112
Nucleic Acids Res. 2017 Sep 6;45(15):8943-8956. doi: 10.1093/nar/gkx607.
Integrative and conjugative elements and their hosts: composition, distribution and organization.
Cury J1,2, Touchon M1,2, Rocha EPC1,2.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5587801/
Detection of conjugative systems
Conjugative systems were found with the CONJscan module of MacSyFinder (29), using protein profiles and definitions following a previous work (16) 

https://www.ncbi.nlm.nih.gov/pubmed/24623814
Nucleic Acids Res. 2014 May;42(9):5715-27. doi: 10.1093/nar/gku194. Epub 2014 Mar 12.
Key components of the eight classes of type IV secretion systems involved in bacterial conjugation or protein secretion.
Guglielmini J1, Néron B2, Abby SS3, Garcillán-Barcia MP4, de la Cruz F4, Rocha EP3.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4027160/
Webservers
We had previously made available a web site (now called CONJscan, http://mobyle.pasteur.fr/cgi-bin/portal.py#forms::CONJscan-T4SSscan or the short URL http://bit.ly/CONJscan) that allows searching for T4SS and conjugation-related protein profiles.

https://www.ncbi.nlm.nih.gov/pubmed/25330359
PLoS One. 2014 Oct 17;9(10):e110726. doi: 10.1371/journal.pone.0110726. eCollection 2014.
MacSyFinder: a program to mine genomes for molecular systems with an application to CRISPR-Cas systems.
Abby SS1, Néron B2, Ménager H2, Touchon M1, Rocha EP1.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4201578/
Macromolecular System Finder (MacSyFinder)

### metaplasmidSPAdes

https://www.ncbi.nlm.nih.gov/pubmed/31048319
Genome Res. 2019 Jun;29(6):961-968. doi: 10.1101/gr.241299.118. Epub 2019 May 2.
Plasmid detection and assembly in genomic and metagenomic data sets.
Antipov D#1, Raiko M#1, Lapidus A1, Pevzner PA1,2.


### [plasmidSPAdes](http://spades.bioinf.spbau.ru/plasmidSPAdes/)
  - [plasmidSPAdes - Twitter Search](https://twitter.com/search?f=tweets&vertical=default&q=plasmidSPAdes&src=typd)
  - [SPAdes – Center for Algorithmic Biotechnology](http://cab.spbu.ru/software/spades/)
    - [SPAdes 3.10.1 Manual](http://cab.spbu.ru/files/release3.10.1/manual.html)
  - [SPAdes Genome Assembler | Algorithmic Biology Lab](http://bioinf.spbau.ru/spades)
    - [SPAdes 3.9.0 Manual](http://spades.bioinf.spbau.ru/release3.9.0/manual.html)

https://www.ncbi.nlm.nih.gov/pubmed/27466620
Bioinformatics. 2016 Nov 15;32(22):3380-3387. Epub 2016 Jul 27.
plasmidSPAdes: assembling plasmids from whole genome sequencing data.
Antipov D1, Hartwick N2, Shen M3, Raiko M2, Lapidus A1, Pevzner PA1,2



### mlplasmids
https://gitlab.com/sirarredondo/mlplasmids

https://www.ncbi.nlm.nih.gov/pubmed/30383524
Microb Genom. 2018 Nov;4(11). doi: 10.1099/mgen.0.000224. Epub 2018 Nov 1.
mlplasmids: a user-friendly tool to predict plasmid- and chromosome-derived sequences for single species.
Arredondo-Alonso S1, Rogers MRC1, Braat JC1, Verschuuren TD2, Top J1, Corander J3,4,5, Willems RJL1, Schürch AC1.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6321875/
We evaluated the performance of mlplasmids against PlasFlow (version 1.0), PlasmidSPAdes (version 3.8.2) and cBar (version 1.2). 


### PlaScope
https://github.com/GuilhemRoyer/PlaScope

https://www.ncbi.nlm.nih.gov/pubmed/30265232
Microb Genom. 2018 Sep;4(9). doi: 10.1099/mgen.0.000211.
PlaScope: a targeted approach to assess the plasmidome from genome assemblies at the species level.
Royer G1,2,3, Decousser JW1,3, Branger C1, Dubois M2, Médigue C2, Denamur E4,1, Vallenet D2.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6202455/
Compared to other plasmid classifiers, PlasFlow and cBar, it achieves better recall (0.87), specificity (0.99), precision (0.96) and accuracy (0.98) on a dataset of 70 genomes of Escherichia coli containing plasmids. 


### PlasmidSeeker
https://github.com/bioinfo-ut/PlasmidSeeker
A k-mer based program for the identification of known plasmids from bacterial whole genome sequencing reads

https://www.ncbi.nlm.nih.gov/pubmed/29629246
PeerJ. 2018 Apr 2;6:e4588. doi: 10.7717/peerj.4588. eCollection 2018.
PlasmidSeeker: identification of known plasmids from bacterial whole genome sequencing reads.
Roosaare M1, Puustusmaa M1, Möls M1,2, Vaher M1, Remm M1.
The PlasmidSeeker algorithm is based on k-mers and uses k-mer abundance to distinguish between plasmid and bacterial sequences. 

### PlasmidTron
https://github.com/sanger-pathogens/plasmidtron

https://www.ncbi.nlm.nih.gov/pubmed/29533742
Microb Genom. 2018 Mar 12. doi: 10.1099/mgen.0.000164. [Epub ahead of print]
PlasmidTron: assembling the cause of phenotypes and genotypes from NGS data.
Page AJ1,2, Wailan A1, Shao Y1, Judge K1, Dougan G3,1, Klemm EJ1, Thomson NR4,1, Keane JA1.
PlasmidTron uses a k-mer-based approach to identify reads associated with a phylogenetically unlinked phenotype. 
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5885016/
Recently a number of methods have been developed to address the problem of assembling mobile genetic elements from next generation sequencing (NGS) data [1].
plasmidSPAdes[2] 
Unicycler [3] 
Recycler [5] 

https://twitter.com/pathogenomenick/status/978273798687477763
Nick Loman on Twitter: ".@andrewjpage - @TheQuadram's new Head of Informatics presenting his open wares to the @MRCClimb quarterly strategy meeting: 1. Docker containers for MLST software evaluation: https://t.co/1Qy0qCIVdd 2. PlasmidTron - k-mer approaches to detect plasmids: https://t.co/ZoFHCAhT5N… https://t.co/kBZ066JeyH"
10:13 AM - 26 Mar 2018

https://twitter.com/andrewjpage/status/908946651548717056
Andrew Page on Twitter: "Check out our latest paper PlasmidTron, it's like GWAS but focused on assembling MGEs https://t.co/B2T3d0ZU0k"
2:52 AM - 16 Sep 2017

### PlasFlow
https://github.com/smaegol/PlasFlow

https://www.ncbi.nlm.nih.gov/pubmed/29346586
Nucleic Acids Res. 2018 Jan 13. doi: 10.1093/nar/gkx1321. [Epub ahead of print]
PlasFlow: predicting plasmid sequences in metagenomic data using genome signatures.
Krawczyk PS1,2, Lipinski L1, Dziembowski A1,2.

https://galaxyproject.github.io/training-material/topics/metagenomics/tutorials/plasmid-metagenomics-nanopore/tutorial.html
Species and plasmids
Prediction of plasmid sequences and classes using PlasFlow

### Recycler
https://github.com/Shamir-Lab/Recycler

https://www.ncbi.nlm.nih.gov/pubmed/28003256
Bioinformatics. 2017 Feb 15;33(4):475-482. doi: 10.1093/bioinformatics/btw651.
Recycler: an algorithm for detecting plasmids from de novo assembly graphs.
Rozov R1, Brown Kav A2, Bogumil D2, Shterzer N2, Halperin E1,3,4, Mizrahi I2, Shamir R1.

- [Rozov R et al. (2017) Bioinformatics. 33(4):475-482. "Recycler: an algorithm for detecting plasmids from de novo assembly graphs."](https://www.ncbi.nlm.nih.gov/pubmed/28003256)

### PLACNET (PLAsmid Constellation NET)
  - [Placnet download | SourceForge.net](https://sourceforge.net/projects/placnet/)

https://www.ncbi.nlm.nih.gov/pubmed/29036591
Bioinformatics. 2017 Dec 1;33(23):3796-3798. doi: 10.1093/bioinformatics/btx462.
PLACNETw: a web-based tool for plasmid reconstruction from bacterial genomes.
Vielva L1, de Toro M2, Lanza VF3, de la Cruz F4.

http://www.ncbi.nlm.nih.gov/pubmed/25522143
PLoS Genet. 2014 Dec 18;10(12):e1004766. doi: 10.1371/journal.pgen.1004766. eCollection 2014 Dec.
Plasmid flux in Escherichia coli ST131 sublineages, analyzed by plasmid constellation network (PLACNET), a new method for plasmid reconstruction from whole genome sequences.
Lanza VF1, de Toro M1, Garcillán-Barcia MP1, Mora A2, Blanco J2, Coque TM3, de la Cruz F1.

### AcCNET
http://sourceforge.net/projects/accnet

https://www.ncbi.nlm.nih.gov/pubmed/27663497
Bioinformatics. 2017 Jan 15;33(2):283-285. doi: 10.1093/bioinformatics/btw601. Epub 2016 Sep 23.
AcCNET (Accessory Genome Constellation Network): comparative genomics software for accessory genome analysis using bipartite networks.
Lanza VF1,2,3, Baquero F1,2,3, de la Cruz F4, Coque TM1,2,3.
https://academic.oup.com/bioinformatics/article/33/2/283/2525709


### [cBar](http://csbl.bmb.uga.edu/~ffzhou/cBar/)
- [Zhou F, Xu Y. Bioinformatics. 2010 Aug 15;26(16):2051-2. "cBar: a computer program to distinguish plasmid-derived from chromosome-derived sequence fragments in metagenomics data."](https://www.ncbi.nlm.nih.gov/pubmed/20538725)

リンク切れ




----------
### PlasMapper

リンク切れ
http://wishart.biology.ualberta.ca/PlasMapper/
Service Temporarily Unavailable

https://www.ncbi.nlm.nih.gov/pubmed/15215471
Nucleic Acids Res. 2004 Jul 1;32(Web Server issue):W660-4.
PlasMapper: a web server for drawing and auto-annotating plasmid maps.
Dong X1, Stothard P, Forsythe IJ, Wishart DS.

https://en.wikipedia.org/wiki/Plasmapper
PlasMapper (Plasmid Mapper) [1] is a freely available web server that automatically generates and annotates high-quality circular plasmid maps.

http://togodb.biosciencedbc.jp/entry/stga_tool/410
プラスミドなどの塩基配列に対して、制限酵素切断部位を始め、複製開始点、プロモーターなどの情報、さらに自分の定義した領域のマッピングを同時に行い、ベクトル形式(SVG)で描画するツール。

----------

### SnapGene
http://www.snapgene.com
SnapGene | Software for everyday molecular biology

### ApE
ApE(A plasmid Editor)

- 2013/12/04 [ApEでシーケンスアライメント - ニュートラルな研究者のメモ](http://cobucchii.hatenablog.com/entry/2013/12/04/214725)
- [ApE(A plasmid Editor)を利用してプラスミドを設計する - 統合TV (togotv)(2013-05-27)](http://togotv.dbcls.jp/20130527.html)
- 2012/7/7 [ApEでできること一覧 | LifeScienceProject](http://life-science-project.com/540/)
- 2009.08.03 [DNA情報の取得とApEでの操作 - 花井＠産総研](https://staff.aist.go.jp/s-hanai/gene_download.html)
- [堀田研究室｜リンク](http://www.cira.kyoto-u.ac.jp/hotta/link.html) ApE フリーであるにも関わらず、非常に優秀な塩基配列編集ソフトウェア。GeneBank形式等の各種塩基配列ファイルを読み込んで、アノテーション付きで表示や編集が可能。制限酵素の切断部位やサイズを様々に表示したり、さらにはDam/Dcm依存性の制限酵素の切り替えもボタン一つ。プラスミドマップの描画にも対応しており、シンプルだが実用上は十分。Mac, Win, Unix/Linux対応。

### [Addgene](https://www.addgene.org) non-profit plasmid repository
- [Addgene (@Addgene) | Twitter](https://twitter.com/addgene)

----------
### cira.kyoto-u

https://www.cira.kyoto-u.ac.jp/hotta/link.html
京大CiRA堀田研｜リンク集

分子生物学実験関連
- PlasMapperr
未知のプラスミドDNAの配列を入力すると、自動的にアノテーションをして美しいマップを表示してくれる。アノテーション結果をGeneBank形式で書き出しApEで開く事も可能。

研究用ソフトウェア
- ApE
無償であるにも関わらず、非常に優秀な塩基配列編集ソフトウェア。GeneBank形式等の各種塩基配列ファイルを読み込んで、アノテーション付きで表示や編集が可能。制限酵素の切断部位やサイズを様々に表示したり、さらにはDam/Dcm依存性の制限酵素の切り替えもボタン一つ。プラスミドマップの描画にも対応しており、シンプルだが実用上は十分。Mac, Win, Unix/Linux対応。
- SnapGene Viewer
有償ソフトSnapGeneのトライアル版的な位置付けで、プラスミドDNAなどの塩基配列管理ソフトウェア。GeneBank形式等の各種塩基配列ファイルを読み込んで、アノテーション付きで表示が可能。編集機能を利用するには有償版を購入する必要があるが、グラフィックスの美しさはさすが商用ソフト。Mac, Win, Linux対応。

研究用データベース
- Addgenes
研究用プラスミドDNAの非営利分与団体。MTA(研究資料分与契約書)を締結すれば、登録されているプラスミドDNA一つをUS$65程度(+送付料)で分与してもらえる。また、自身の構築したプラスミドDNAを委託して、世界中に分与してもらうことも可能。

----------

### kazumaxneo
http://kazumaxneo.hatenablog.com/archive/category/plasmid
plasmid カテゴリーの記事一覧 - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2019/10/09/234533
メタゲノムのアセンブリ配列からファージやプラスミドを予測する PPR-Meta - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2019/06/05/073000
metaplasmidSPAdes - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2019/05/11/073000
メタゲノムのアセンブリ配列からプラスミド配列を予測する PlasFlow - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2018/07/03/113439
抗生物質耐性遺伝子や病原性遺伝子を素早く検索できる ABRicate - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2018/07/02/142609
腸内細菌科（エンテロバクター科）のプラスミド同定ツール PlasmidFinder - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2018/05/28/203726
NGSデータからプラスミドを検出するplasmidseeker - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2018/04/02/123713
ロングリードを使い環状DNAかどうか調べる Circlator - macでインフォマティクス
多くの重要な抗菌剤耐性および病原性決定因子がプラスミド上に担持され、これらの環状配列について完全で正確な情報を有することの重要性が示される。

http://kazumaxneo.hatenablog.com/entry/2017/12/17/142135
cBarでプラスミド配列を区別する - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2017/10/01/182022
環状ゲノムを探す ccontigs - macでインフォマティクス
ccontigsはコンティグ末端の配列がオーバーラップしているかどうか調べることで、コンティグからclosed circularなゲノムを探すツール。環状のプラスミドやウィルスを検出できるとされる。論文にはなっていない。

http://kazumaxneo.hatenablog.com/entry/2017/08/27/233654
アセンブルのgraphからプラスミドデータを検出するツール Recycler - macでインフォマティクス

http://kazumaxneo.hatenablog.com/entry/2017/06/27/133058
DNA解析ソフト1 Snapgene - macでインフォマティクス
SnapGeneはプラスミドやゲノムの解析ソフトである。ビジュアルで見やすく表示する機能に特化しており、制限酵素処理結果を画面で見やすく表示したり、TA cloningやgibson、in fuisionなどの反応結果を表示し設計を支援する機能などを持つ。

----------

