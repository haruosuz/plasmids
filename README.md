
----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-06-07  

----------

# Microbial Genome Sequence Analysis
微生物ゲノム配列解析

## Project directory structures

    mgsa/
     README.md: project documentation 
     data/: contains data files
     scripts/: contains Perl/Python/R/Shell scripts
     analysis/: contains results of data analyses
     images/: contains image files

本ページの[Clone or download -> Download ZIP](https://github.com/haruosuz/mgsa/archive/master.zip)をクリックして取得されたディレクトリ（例 `~/Downloads/mgsa-master`）に移動する。

----------

## Updates

G-language Systemウェブサービス (チュートリアル[日本語](http://www.g-language.org/wiki/restgenomeanalysisjapanese)・[English](http://www.g-language.org/wiki/restgenomeanalysisenglish)) を用いて、プラスミド配列の情報を取得
 - http://rest.g-language.org/NC_005088
 - http://rest.g-language.org/NC_005088/*/product
 - http://rest.g-language.org/NC_005088/output

### 2016-06-14
[How to perform a pangenome analysis using Roary | Pangenome sequence analysis](https://github.com/microgenomics/tutorials/blob/master/pangenome.md#pangenome-sequence-analysis)

#### Exercises
演習

以下の通り、Python3スクリプト[`DBGenerator.py`](https://github.com/EnzoAndree/tutorials/blob/patch-1/DBGenerator.py)を取得し、実行する:  

    # Downloading the Python3 script
    curl -O https://raw.githubusercontent.com/EnzoAndree/tutorials/patch-1/DBGenerator.py

    # Running the Python3 script
    python3 GeneratorDB.py ffn

### 2016-06-07
[How to perform a pangenome analysis using Roary | Determining the pangenome](https://github.com/microgenomics/tutorials/blob/master/pangenome.md#determining-the-pangenome)

#### Exercises
演習

[ターミナル](http://techacademy.jp/magazine/5155)を開き、Linuxサーバにリモートログインする。`ssh -X`で接続する。

	$ ssh -X user@remote.domain

以下の通り、シェルスクリプト[`scripts/run_roary-2016-06-07.sh`](https://github.com/haruosuz/mgsa/blob/master/scripts/run_roary-2016-06-07.sh)を取得し、実行する:  

    # Downloading the shell script
    curl -O https://raw.githubusercontent.com/haruosuz/mgsa/master/scripts/run_roary-2016-06-07.sh

    # Running the shell script
    (time bash run_roary-2016-06-07.sh &) >& log.roary-2016-06-07.txt

各ステップは以下の通り:  

1. GenBank形式ファイル(`.gbk`)をダウンロード。
2. GenBank形式ファイル(`.gbk`)をGFF3形式ファイル(`.gff`)に変換。
3. Roaryを実行し、pan-genome解析。`-e --dont_delete_files`オプションを付けると、`pan_genome_sequences/`サブディレクトリに各遺伝子クラスターのアライメント（MultiFASTA形式ファイル）が生成される。[3 Output files | 3.2 Multifasta files of each gene](http://bioinformatics.oxfordjournals.org/content/suppl/2015/07/20/btv421.DC1/Roary_supplementary_material.pdf)

        roary -f ./analysis/ -e --dont_delete_files -n -v ./data/*.gff

        Options: 
         -f STR    output directory [.]
         -e        create a multiFASTA alignment of core genes using PRANK
         -n        fast core gene alignment with MAFFT, use with -e
         -v        verbose output to STDOUT

4. [Roary plots](https://github.com/sanger-pathogens/Roary/tree/master/contrib/roary_plots)を実行し、pan-genome解析結果を視覚化。

        roary_plots.py analysis/core_gene_alignment.newick analysis/gene_presence_absence.csv

[出力ファイル](https://github.com/haruosuz/mgsa/tree/master/analysis/roary_plots)は以下の通り:  

	analysis/roary_plots/
	 pangenome_frequency.png
	 pangenome_matrix.png
	 pangenome_pie.png

Rスクリプト[`scripts/my_roary-2016-06-07.R`](https://github.com/haruosuz/mgsa/blob/master/scripts/my_roary-2016-06-07.R)は、Roaryの出力ファイル(`*.Rtab`)から[箱ひげ図](https://github.com/haruosuz/mgsa/blob/master/analysis/2016-06-07/Rplots.pdf)を作成する。これらは、[Roary: Supplementary Material | 2.3 Output](http://bioinformatics.oxfordjournals.org/content/suppl/2015/07/20/btv421.DC1/Roary_supplementary_material.pdf) の (Sup. Fig. 14-17) に対応する。以下の通り、Rスクリプトを取得し、実行する:  

    # Downloading the R script
    curl -O https://raw.githubusercontent.com/haruosuz/mgsa/master/scripts/my_roary-2016-06-07.R

    # Running the R script
    Rscript --vanilla my_roary-2016-06-07.R

#### 参考文献
- `ssh -X`
  - [Forwarding X11 using ssh on modern desktop](http://vega.sra-tohoku.co.jp/~kabe/vsd/ssh-x.html)
  - [Xアプリのssh越し起動方法 - ものぐさ備忘録](http://d.hatena.ne.jp/gikogeek/20080220)
  - [[メモ]リモートXの接続方法 - Akira's Tech Notes](http://luozengbin.github.io/blog/2014-06-21-%5Bメモ%5Dリモートxの接続方法.html)
  - [X11 Forwarding - なんなんなん行く？](https://sites.google.com/site/teyasn001/ubuntu-12-10/sshniyorux11zhuan-song)

----------

### 2016-05-31
[Roary: rapid large-scale prokaryote pan genome analysis.](http://sanger-pathogens.github.io/Roary)  
細菌ゲノム比較パイプライン。総当たり(all against all BLAST)配列比較に供するデータ量をCD-HITで縮小して高速化。MCLを用いて類似配列をクラスタリング（遺伝子のホモログ・グループを同定）し、周辺遺伝子の保存 conserved gene neighbourhood (CGN) 情報を利用してオーソログとパラログを識別する。FastTreeを用いて、遺伝子の有/無(1/0)に基づく樹形図と、コア遺伝子アライメントに基づく系統樹を作成する。

![http://www.slideshare.net/joaoandrecarrico/computational-resources-in-infectious-disease](http://image.slidesharecdn.com/escmidamsterdam2016meettheexperts-160413093351/95/computational-resources-in-infectious-disease-10-638.jpg)
![http://www.slideshare.net/leightonp/comparative-genomics-and-visualisation-bs32010](http://image.slidesharecdn.com/2016-03-21bs32010pritchard-160321141209/95/comparative-genomics-and-visualisation-bs32010-84-638.jpg)
![http://www.slideshare.net/MirkoRossi2/toolbox-for-bacterial-population-analysis-using-ngs](http://image.slidesharecdn.com/introductionbacterialpopulationgenomics-160414060754/95/toolbox-for-bacterial-population-analysis-using-ngs-26-638.jpg)
![https://twitter.com/DrKatHolt/status/685617597367193600](https://pbs.twimg.com/media/CYPNkjYVAAAL666.png)

#### Exercises
演習

シェルスクリプト[`scripts/run_roary.sh`](https://github.com/haruosuz/mgsa/blob/master/scripts/run_roary.sh)は、全ステップ（データの取得と変換、Roary、FastTree）を自動実行する。以下の通り、シェルスクリプトを取得し、実行する:  

    # Downloading the shell script
    curl -O https://raw.githubusercontent.com/haruosuz/mgsa/master/scripts/run_roary.sh

    # Running the shell script
    bash run_roary.sh >& log.txt &

各ステップは以下の通り:  

1. ディレクトリを作成し、配列データをダウンロード。GenBank形式ファイルの拡張子は`.gbk`（または`.gbff`）

        # Creating directories
        mkdir -p ./data

        # Downloading GenBank files
        ACCESSIONs=(NC_005088 NC_007337 NC_008459 NC_001735)
        URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Plasmids
        for ACCESSION in ${ACCESSIONs[@]}; do wget -nv -P data/ $URL/gbk/$ACCESSION.gbk; done

        # Output
        data/
         NC_005088.gbk
         NC_007337.gbk
         NC_008459.gbk
         NC_001735.gbk

2. Perlスクリプト[`bp_genbank2gff3.pl`](https://github.com/bioperl/bioperl-live/blob/master/scripts/Bio-DB-GFF/bp_genbank2gff3.pl)を用いて、GenBank形式ファイル(`.gbk`)をGFF3形式ファイル(`.gff`)に変換。

        # Converting GenBank files to GFF3
        perl bp_genbank2gff3.pl data/*.gbk; mv *.gff data/

        # Output
        data/
         NC_001735.gbk.gff
         NC_005088.gbk.gff
         NC_007337.gbk.gff
         NC_008459.gbk.gff

3. Roaryを実行し、pan-genome解析。入力ファイル(`.gff`)の最後にFASTA塩基配列が含まれていることに注意（[Input files](https://sanger-pathogens.github.io/Roary/)）。

        # Running Roary
        roary -f ./analysis/ -e -n -v ./data/*.gff

        # Output
        analysis/
         accessory.header.embl
         accessory.tab
         accessory_binary_genes.fa
         accessory_binary_genes.fa.newick
         accessory_graph.dot
         blast_identity_frequency.Rtab
         clustered_proteins
         core_accessory.header.embl
         core_accessory.tab
         core_accessory_graph.dot
         core_alignment_header.embl
         core_gene_alignment.aln
         gene_presence_absence.csv
         gene_presence_absence.Rtab
         number_of_conserved_genes.Rtab
         number_of_genes_in_pan_genome.Rtab
         number_of_new_genes.Rtab
         number_of_unique_genes.Rtab
         pan_genome_reference.fa
         summary_statistics.txt

4. [FastTree](http://www.microbesonline.org/fasttree/)を実行して、全株に保存されたコア遺伝子のマルチプルアラインメントに基づく系統解析。

        # Running FastTree
        FastTree -nt -gtr analysis/core_gene_alignment.aln > analysis/core_gene_alignment.newick
        
        # Output
        analysis/
         core_gene_alignment.newick

#### Output
出力ファイル

[Roary: Supplementary Material | 3 Output files](http://bioinformatics.oxfordjournals.org/content/suppl/2015/07/20/btv421.DC1/Roary_supplementary_material.pdf)

Sup. Table 1. Output files File

| File | Description |
|:-----|:------------|
| gene_presence_absence.csv | 各株における遺伝子の有無と統計を含むスプレッドシート |
| core_gene_alignment.aln | 全株に保存されたコア遺伝子のアライメント（MultiFASTA形式） |
| clustered_proteins | 遺伝子クラスターを構成する配列のID (locus_tag) |
| *.Rtab | Rでグラフを生成するためのタブ区切りファイル |
| *.embl | 遺伝子の有無を視覚化するためのEMBL形式ファイル |
| accessory_binary_genes.fa.newick | accessory遺伝子の有無に基づくtree（newick形式） |
| pan_genome_reference.fa | pan-genomeの遺伝子の塩基配列（FASTA形式） |
| pan_genome_sequences/ | 各遺伝子クラスターのアライメント（MultiFASTA形式） |

#### 参考文献
- Roary: rapid large-scale prokaryote pan genome analysis.
  - [github](https://github.com/sanger-pathogens/Roary)
  - [website](https://sanger-pathogens.github.io/Roary/)
  - 論文 Bioinformatics. 2015 [Abstract](http://www.ncbi.nlm.nih.gov/pubmed/26198102) | [Full text](http://bioinformatics.oxfordjournals.org/content/31/22/3691.long) | [Supplementary Data](http://bioinformatics.oxfordjournals.org/content/suppl/2015/07/20/btv421.DC1/Roary_supplementary_material.pdf)
  - [How to perform a pangenome analysis using Roary](https://github.com/microgenomics/tutorials/blob/master/pangenome.md) | tutorials by CBIB

- slideshare（[Roary](http://sanger-pathogens.github.io/Roary)に言及）
  - 2016-04-14 [Toolbox for bacterial population analysis using NGS](http://www.slideshare.net/MirkoRossi2/toolbox-for-bacterial-population-analysis-using-ngs)
  - 2016-04-13 [Computational Resources In Infectious Disease](http://www.slideshare.net/joaoandrecarrico/computational-resources-in-infectious-disease)
  - 2016-03-21 [Comparative Genomics and Visualisation BS32010](http://www.slideshare.net/leightonp/comparative-genomics-and-visualisation-bs32010)

- [CD-HIT](http://weizhongli-lab.org/cd-hit/)
  - [CD-HITの使い方](http://bio-info.biz/tips/other_cd-hit_usage.html)
  - [CD-HITのインストール](http://bio-info.biz/tips/other_install_cd-hit.html)
  - 2016.02.23 [CD-HIT | 核酸およびアミノ酸配列のクラスタリング](http://bi.biopapyrus.net/seq/cd-hit.html)
  - 2015-12 [配列クラスタリングプログラムCD-HITの使い方 - バイオインフォマティクス初心者の日常](http://sy41211.hatenablog.com/entry/2015/12/12/162232)

- [MCL - a cluster algorithm for graphs](http://micans.org/mcl/)
  - [The mclblastline manual](http://micans.org/mcl/man/mclblastline.html)
  - 2014-12-07 [mclblastlineを使いたい - Aide-memoire](http://abs-0110.hatenablog.com/entry/2014/12/07/161426)
  - 2016.02.20, [OrthoFinder の使い方 - Qiita](http://qiita.com/NariseT/items/e2c90d0235316f8878d8)

- [The Newick tree format](http://evolution.genetics.washington.edu/phylip/newicktree.html)
  - [Newick書式から系統樹を描く - ryamadaの遺伝学・遺伝統計学メモ](http://d.hatena.ne.jp/ryamada22/20050513/1115948852)
  - [2011年度・玉川大学「分子系統進化学」・実習1](http://cse.naro.affrc.go.jp/minaka/cladist/tamagawa2011-1.html)
  - [FigTree - 井上潤](http://www.geocities.jp/ancientfishtree/FigTree.html) | FigTree は newick 形式で作成された系統樹を graphical に表示するプログラムです．
  - [系統樹 ape ade4 | Rで系統樹を作成する方法](http://stat.biopapyrus.net/graph/r-phylogenetic-tree.html)
  - [ストリーミング配信 - BIRD | 平成21年度ゲノムリテラシー講座 | 分子系統解析](http://www.jst.go.jp/nbdc/bird/jinzai/literacy/streaming/h21_4_3.pdf)

----------

### 2016-05-24

DNA/タンパク質配列の情報（由来する生物の分類群など）を取得

#### 系統と分類
![http://www.niaes.affrc.go.jp/magazine/153/mgzn15305.html](http://www.niaes.affrc.go.jp/magazine/153/mgzn15305_5.jpg)
![](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/PhylogeneticTree.png/220px-PhylogeneticTree.png)
![https://edwards.sdsu.edu/research/entries-in-the-ncbi-taxonomy-database/](https://edwards.sdsu.edu/research/wp-content/uploads/2012/04/ncbi_taxon_entries-624x348.png)

#### FASTA形式ファイル
[NCBIは、配列のGIを廃止し、Accession.Versionを使用する。](http://www.ncbi.nlm.nih.gov/news/03-02-2016-phase-out-of-GI-numbers/)  
Example 3: [FASTA](https://ja.wikipedia.org/wiki/FASTA)形式の変更：[FASTA](http://www.ige.tohoku.ac.jp/joho/gmProject/manualJP/kiso.html#fasta)ヘッダからGIを削除

変更前

![](http://www.ncbi.nlm.nih.gov/core/assets/news/images/NoGIs_Fig3_Before.jpg)

変更後

![](http://www.ncbi.nlm.nih.gov/core/assets/news/images/NoGIs_Fig3_After.jpg)

#### Exercises
演習

本ページの[Clone or download -> Download ZIP](https://github.com/haruosuz/mgsa/archive/master.zip)をクリックして取得されたディレクトリ（例 `~/Downloads/mgsa-master`）に移動する。

##### BLASTヒット配列の情報を取得
[ターミナル](http://techacademy.jp/magazine/5155)で以下のコマンドを実行する:  

	bash scripts/2016-05-24.sh >& log.txt &

`tail -f`でファイル出力を監視する（Control-Cで動作中のプロセスを停止）:  

    # Use `tail -f` to constantly monitor files (use Control-C to stop)
    tail -f log.txt

シェルスクリプト[`scripts/2016-05-24.sh`](https://github.com/haruosuz/mgsa/tree/master/scripts/2016-05-24.sh)は、全工程（データ取得、BLASTプログラム、Rスクリプト）を実行する。

取得データは、プラスミドRNA配列を含む圧縮FASTA形式ファイル <ftp://ftp.ncbi.nlm.nih.gov/refseq/release/plasmid/plasmid.1.rna.fna.gz> と、分類学的情報として NCBI Taxonomy (Kingdom;Group;SubGroup) を含むNCBIゲノムリスト <ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/overview.txt> 。

作成したBLASTデータベースからキーワード（例えば、'Bacillus.megaterium'）にマッチする配列を抽出し、問い合わせ配列(query)としてデータベースに対するBLASTN検索を実行する。

Rスクリプト[`scripts/2016-05-24.R`](https://github.com/haruosuz/mgsa/tree/master/scripts/2016-05-24.R)は、タブ区切り形式のBLAST出力ファイルを読み込み、ヒット配列(sbjct)の[FASTA](http://www.ige.tohoku.ac.jp/joho/gmProject/manualJP/kiso.html#fasta)ヘッダと由来生物の分類群を追加したファイル[`analysis/2016-05-24/output.txt`](https://github.com/haruosuz/mgsa/tree/master/analysis/2016-05-24)を出力する。

##### Swiss-Protデータベースの情報を取得
シェルスクリプト[`scripts/my_sprot_getter.sh`](https://github.com/haruosuz/mgsa/tree/master/scripts/my_sprot_getter.sh)は、Swiss-Protデータベースの圧縮ファイル（*uniprot_sprot.dat.gz*）を取得する。

Pythonスクリプト[`scripts/my_sprot_parser.py`](https://github.com/haruosuz/mgsa/tree/master/scripts/my_sprot_parser.py)は、Biopythonを利用して`uniprot_sprot.dat`から以下の情報を抽出する。

	entry_name        Name of this entry, e.g. RL1_ECOLI.
	description       Free-format description.
	organism          The source of the sequence.
	organism_classification  The taxonomy classification.  List of strings.
	                         (http://www.ncbi.nlm.nih.gov/Taxonomy/)

##### 参考文献
- Swiss-Prot
  - [Swiss-Prot - Wikipedia](https://ja.wikipedia.org/wiki/Swiss-Prot)
  - [バイオインフォマティクスの基礎実習（データベース検索）](http://lecture.ecc.u-tokyo.ac.jp/~ashugo/database/lec1_2.html) 2.4. UniProt(Swiss-Prot)を用いたタンパク質データベースの検索
  - 平成21年度ゲノムリテラシー講座　分子生物学データベース[【講義１】](http://www.jst.go.jp/nbdc/bird/jinzai/literacy/streaming/h21_4_1.pdf)[【講義２】](http://www.jst.go.jp/nbdc/bird/jinzai/literacy/streaming/h21_4_2.pdf)
  - [Nucleic Acids Res. 2015 Jan;43(Database issue):D204-12. UniProt: a hub for protein information.](http://www.ncbi.nlm.nih.gov/pubmed/25348405)
  - [Database (Oxford). 2014 Mar 12;2014:bau016. Expert curation in UniProtKB: a case study on dealing with conflicting and erroneous data.](http://www.ncbi.nlm.nih.gov/pubmed/24622611)
  - [Parsing Swissprot With Biopython](https://www.biostars.org/p/59648/)
  - [Biopython Tutorial and Cookbook | 10.1  Parsing Swiss-Prot files](http://biopython.org/DIST/docs/tutorial/Tutorial.html#htoc136)

- BLAST
  - [Local BLAST の使い方〜導入・準備編（MacOSX版）〜 2011 - 統合TV (togotv)(2011-04-20)](http://togotv.dbcls.jp/20110420.html)
  - [Local BLAST の使い方〜検索実行・オプション編（MacOSX版）〜 2011 - 統合TV (togotv)(2011-06-08)](http://togotv.dbcls.jp/20110608.html)
  - [Local BLAST (togotv)(2011-02-25)](http://togotv.dbcls.jp/20110225.html)
  - [BLASTパッケージのインストール](http://bio-info.biz/tips/other_install_blast.html)
  - [BLASTデータベースの作り方について](http://bio-info.biz/tips/other_blast_db.html)
  - [井上 潤：Blast+](http://www.geocities.jp/ancientfishtree/BLASTplus_JI.html)

- BLAST® Command Line Applications User Manual - NCBI Bookshelf
 - [Options for the command-line applications.](http://www.ncbi.nlm.nih.gov/books/NBK279675/)

- [Building a BLAST database with local sequences](http://www.ncbi.nlm.nih.gov/books/NBK279688/)
 - [BLASTデータベースの作り方について](http://bio-info.biz/tips/other_blast_db.html)
 - [makeblastdb | blast検索用のデータベースを作成する方法](http://bi.biopapyrus.net/seq/blast/makeblastdb.html)

- [Extracting data from BLAST databases with blastdbcmd](http://www.ncbi.nlm.nih.gov/books/NBK279689/)
 - [自家製BLAST用DBから必要な配列エントリ取得 | ぼうのブログ](http://bonohu.jp/blog/2014/08/08/yetanother-blastdbcmd/)
 - [Blasted Bioinformatics!?: My IDs not good enough for NCBI BLAST+](http://blastedbio.blogspot.com/2012/10/my-ids-not-good-enough-for-ncbi-blast.html)

----------

### 2016-05-16

#### phylogenetic profiles
系統プロファイルとは、遺伝子の複数ゲノムにおける存在/非存在を1/0で表現した行列データ（[Pellegrini et al. 1999](http://www.ncbi.nlm.nih.gov/pubmed/10200254)）。ドラフトゲノム配列では、遺伝子の非存在は結論づけられないので、コンプリートゲノム配列を使用する必要がある。

![http://www.ncbi.nlm.nih.gov/pmc/articles/PMC16324/figure/F1/](https://github.com/haruosuz/mgsa/blob/master/images/pq0690185001.jpg)

[A method of analyzing protein phylogenetic profiles](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC16324/figure/F1/)

#### taxon-specific genes
分類群（種/株）に特有の遺伝子（species- or strain-specific genes）の同定

![http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2612414/figure/f4/](https://github.com/haruosuz/mgsa/blob/master/images/zjb0010983460004.jpg)

大腸菌8株におけるE2348/69株の遺伝子のホモログ数 [Conservation of E2348/69 genes in the eight sequenced E. coli strains. The numbers of E2348/69 genes conserved in each of the eight sequenced E. coli strains are indicated.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2612414/figure/f4/)

tBLASTnで検出
  - ['In order to avoid biases introduced by differences in gene prediction, we compared the E2348/69 gene set with the genomes of the other E. coli strains using one-way comparisons with TBLASTN.'](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2612414/)
  - [Searching for missing genes and identifying causes for absence with tblastn](https://github.com/mattb112885/clusterDbAnalysis/wiki/Searching-for-missing-genes-and-identifying-causes-for-absence-with-tblastn) | ITEP wrapper for tBLASTn
  - [KAAS - KEGG Automatic Annotation Server](http://www.genome.jp/tools/kaas/) | 双方向ヒット BBH (bi-directional best hit) | 一方向ヒット SBH (single-directional best hit)

#### Exercises
演習

本ページの[Clone or download -> Download ZIP](https://github.com/haruosuz/mgsa/archive/master.zip)をクリックして取得されたディレクトリ（例 `~/Downloads/mgsa-master`）に移動する。
ターミナルで以下のコマンドを実行する:  

	bash scripts/2016-05-16.sh

[出力ファイル](https://github.com/haruosuz/mgsa/tree/master/analysis/2016-05-16)は以下の通り:  

	analysis/2016-05-16/
	 phylogenetic_profiles.csv
	 phylogenetic_profiles_supp.csv
	 Rplots.pdf

#### 参考文献
- phylogenetic profiles
  - [統計数理(2006) カーネル法による複数のゲノムデータからのタンパク質間機能ネットワークの推定](http://www.ism.ac.jp/editsec/toukei/pdf/54-2-357.pdf)
  - [2005 系統プロファイルを利用した代謝反応ネットワーク中の保存領域抽出手法](http://ci.nii.ac.jp/naid/110003482755)
  - [Date SV, Marcotte EM. Nat Biotechnol. 2003 Sep;21(9):1055-62. Discovery of uncharacterized cellular systems by genome-wide analysis of functional linkages.](http://www.ncbi.nlm.nih.gov/pubmed/12923548)
  - [Pellegrini M et al. Proc Natl Acad Sci U S A. 1999 Apr 13;96(8):4285-8. Assigning protein functions by comparative genome analysis: protein phylogenetic profiles. ](http://www.ncbi.nlm.nih.gov/pubmed/10200254)

----------

### 2016-05-10

RによるDNA配列解析

[DNA Sequence Statistics (1) — Bioinformatics 0.1 documentation](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html)

#### テスト・データ

    #install.packages("seqinr")
    library(seqinr)

    dna <- s2c("acgt")

    # Length of a DNA sequence
    length(dna)

    # Base composition of a DNA sequence
    table(dna)

    # GC Content of DNA
    GC(dna)

    # DNA words
    count(dna, 2)
    count(dna, 3)
    count(dna, 4)

#### 実際のデータ

Rコンソールで、以下のコマンドを実行する:  

    # Downloading data intocurrent working directory 
    getwd()
    system('curl -O ftp://ftp.ncbi.nlm.nih.gov/refseq/release/plasmid/plasmid.1.rna.fna.gz')

    library(seqinr)

    # Reading sequence data into R
    lna <- read.fasta(file = 'plasmid.1.rna.fna.gz', seqtype = c('DNA'))

    # How many sequences
    length(lna)

    # Length of sequences
    len <- sapply(lna, length); summary(len)

    # GC Content
    gcc <- sapply(lna, GC); summary(gcc)

    # Get sequence annotations (FASTA headers)
    annotation <- unlist(getAnnot(lna))

    # Exporting Data
    d.f <- data.frame(len, gcc, annotation)
    write.csv(d.f, file="table.csv")

    # Exploring Data Visually
    plot(len, gcc, xlab = "Length (bp)", ylab = "GC Content")

#### 参考文献
- [micropan: an R-package for microbial pan-genomics. BMC Bioinformatics. 2015 Mar 12](http://www.ncbi.nlm.nih.gov/pubmed/25888166)
- [Recommend Your Favorite Introductory "R In Bioinformatics" Books And Resources](https://www.biostars.org/p/539/)
- [Exploratory Analysis of Biological Data using R (2014) | Bioinformatics.ca](http://bioinformatics.ca/workshops/2014/exploratory-analysis-biological-data-using-r-2014)

- [SeqinR](http://pbil.univ-lyon1.fr/software/seqinr/home?lang=eng)
  - [Welcome to a Little Book of R for Bioinformatics! — Bioinformatics 0.1 documentation](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html)
  - [Applied Statistics for Bioinformatics using R](https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)
  - [Using the R SeqinR package - Musings from an unlikely candidateMusings from an unlikely candidate](http://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/)
  - [SeqinR - biological data handling](http://www.slideshare.net/pau_corral/seqinr-biological-data-handling)
  - [(Rで)塩基配列解析](http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html#intro_general_translate_seqinr)
  - [(Rで)マイクロアレイデータ解析](http://www.iu.a.u-tokyo.ac.jp/~kadota/r.html)
  - [seqinr - 日々草(TEKの備忘録)](https://sites.google.com/site/adversariaoftekijima/r/seqinr)
  - [Rと系統樹(2)](https://www1.doshisha.ac.jp/~mjin/R/43/43.html)
  - [Rの初心者向けコード(生物系) - 驚異のアニヲタ社会復帰への道](http://d.hatena.ne.jp/MikuHatsune/20131214/1387003786)
  - [塩基配列上での変異とアミノ酸置換 - 驚異のアニヲタ社会復帰への道](http://d.hatena.ne.jp/MikuHatsune/20130404/1365068708)
  - [Rでfastaファイルを読み込む際におすすめのパッケージはありますか？ - #LSQA](http://qa.lifesciencedb.jp/questions/512/rでfastaファイルを読み込む際におすすめのパッケージはありますか)
  - [fastaファイルを一つにまとめる in R A springtail\'s sigh/ウェブリブログ](http://tullbergia.at.webry.info/201007/article_4.html)
  - [ギガシーケンサごっこ(1): shotgun配列を自作する A springtail\'s sigh/ウェブリブログ](http://tullbergia.at.webry.info/201006/article_2.html)
  - [phred互換の配列のクオリティファイルをR上で扱う： read.qual A springtail\'s sigh/ウェブリブログ](http://tullbergia.at.webry.info/201108/article_1.html)

----------

### 2016-04-26

#### Pan-genome
[Pan-genome](https://en.wikipedia.org/wiki/Pan-genome)は、分類群の構成者（例えば、種を構成する株）に存在する全遺伝子を意味し、全ての株に共有されたコア遺伝子（"core genome"）、2株以上に共有された遺伝子（"dispensable genome"）、単一の株に特有の遺伝子（"unique genes"）に分類される。

![http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4765519/figure/F1/](https://github.com/haruosuz/mgsa/blob/master/images/CG-16-245_F1.jpg)

[Venn diagram plot that represents the three parts of the pan-genome. In gray: core genome; yellow: accessory or dispensable genome, and blue: species-specific or strain-specific genes. Adapted: Muzzi et al., 2007.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4765519/figure/F1/)

#### Exercises
演習

各株における各遺伝子の有/無(1/0)を示すgene contentのデータ行列を作成し、遺伝子の共有に基づくベン図の作成とクラスター分析を行なう。解析の手順は次の通り。
本ページの[Clone or download -> Download ZIP](https://github.com/haruosuz/mgsa/archive/master.zip)をクリックして取得されたディレクトリ（例 `~/Downloads/mgsa-master`）に移動する。
以下の通りRスクリプト`scripts/test_gene_content.R`を実行する:  

	Rscript --vanilla scripts/test_gene_content.R

[出力ファイル](https://github.com/haruosuz/mgsa/tree/master/analysis/2016-04-26)は以下の通り:  

	analysis/2016-04-26/
	 Rplots.pdf
	 table.csv

Rパッケージ("limma","vegan")が無い場合には、Rコンソールで以下の通りインストールする:  

    # install "limma"
    source("http://bioconductor.org/biocLite.R")
    biocLite("limma")

    # install "vegan"
    install.packages("vegan")

#### 参考文献
  - [The bacterial pangenome as a new tool for analysing pathogenic bacteria. New Microbes New Infect. 2015 Jun](http://www.ncbi.nlm.nih.gov/pubmed/26442149)
  - Ten years of pan-genome analyses. Curr Opin Microbiol. 2015 Feb http://www.ncbi.nlm.nih.gov/pubmed/25483351
  - [ゲノムデザインに向けて | 森  浩禎](https://www.sbj.or.jp/wp-content/uploads/file/sbj/9006/9006_tokushu-1_4.pdf) | 図1. 3種類の大腸菌を比較したベン図 | 図2. 61種類の大腸菌比較. 共通に存在する遺伝子（コアゲノム）

----------

### 2016-04-19

微生物ゲノム解析の概要

- 参考文献
 - [Tools for bacterial comparative genomics | Holt Lab](http://holtlab.net/2015/02/25/tools-for-bacterial-comparative-genomics/)
 - [Inside the Pan-genome - Methods and Software Overview. Curr Genomics. 2015 Aug](http://www.ncbi.nlm.nih.gov/pubmed/27006628)
 - [A brief review of software tools for pangenomics. Genomics Proteomics Bioinformatics. 2015 Feb](http://www.ncbi.nlm.nih.gov/pubmed/25721608)
 - [ITEP: an integrated toolkit for exploration of microbial pan-genomes. BMC Genomics. 2014 Jan](http://www.ncbi.nlm.nih.gov/pubmed/24387194)
 - [Computing for Comparative Microbial Genomics, Springer, 2009, 270p.](http://link.springer.com/book/10.1007%2F978-1-84800-255-5)

----------

## References
- 細菌ゲノム比較ツール
- [ITEP: Integrated Toolkit for Exploration of Pan-genomes | The Price Lab](https://price.systemsbiology.org/research/itep/)
- Tools for bacterial comparative genomics | Holt Lab http://holtlab.net/2015/02/25/tools-for-bacterial-comparative-genomics/
 - Bacterial genomics tutorial | Holt Lab https://holtlab.net/2014/12/27/bacterial-genomics-tutorial-2/
 - Bacterial genomics tutorial | BacPathGenomics https://bacpathgenomics.wordpress.com/2013/04/13/bacterial-genomics-tutorial/
 - Beginner's guide to comparative bacterial genome analysis using next-generation sequence data. Microb Inform Exp. 2013. http://www.ncbi.nlm.nih.gov/pubmed/23575213

- 細菌ゲノム比較に関する論文
 - 大腸菌 [Comparative genomics of recent Shiga toxin-producing Escherichia coli O104:H4: short-term evolution of an emerging pathogen. MBio. 2013 Jan 22](http://www.ncbi.nlm.nih.gov/pubmed/23341549)
 - 大腸菌 [Genomic epidemiology of the Escherichia coli O104:H4 outbreaks in Europe, 2011. Proc Natl Acad Sci U S A. 2012 Feb](http://www.ncbi.nlm.nih.gov/pubmed/22315421)
 - 大腸菌 [Comparative genomics reveal the mechanism of the parallel evolution of O157 and non-O157 enterohemorrhagic Escherichia coli. Proc Natl Acad Sci U S A. 2009 Oct](http://www.ncbi.nlm.nih.gov/pubmed/19815525)
 - [下毛類](https://ja.wikipedia.org/wiki/下毛類)Euplotesの共生細菌 [Polynucleobacter necessarius, a model for genome reduction in both free-living and symbiotic bacteria. Proc Natl Acad Sci U S A. 2013 Nov ](http://www.ncbi.nlm.nih.gov/pubmed/24167248)
 - サルモネラ [Evolutionary Genomics of Salmonella enterica Subspecies. MBio. 2013 Mar](http://www.ncbi.nlm.nih.gov/pubmed/23462113)
 - []()
 - クロストリジウム属 [Comparative genomic and phenomic analysis of Clostridium difficile and Clostridium sordellii, two related pathogens with differing host tissue preference. BMC Genomics. 2015 Jun](http://www.ncbi.nlm.nih.gov/pubmed/26059449)
 - ゾウリムシ核内共生細菌 [Draft genome sequences of three Holospora species (Holospora obtusa, Holospora undulata, and Holospora elegans), endonuclear symbiotic bacteria of the ciliate Paramecium caudatum. FEMS Microbiol Lett. 2014 Oct](http://www.ncbi.nlm.nih.gov/pubmed/25115770)
 - 大腸菌 [Inflammation-associated Adherent-invasive Escherichia coli Are Enriched in Pathways for Use of Propanediol and Iron and M-cell Translocation. Inflamm Bowel Dis. 2014 Nov](http://www.ncbi.nlm.nih.gov/pubmed/25230163)
 - 膣内乳酸桿菌 [Comparative Functional Genomics of Lactobacillus spp. Reveals Possible Mechanisms for Specialization of Vaginal Lactobacilli to Their Environment. J Bacteriol. 2014 Apr](http://www.ncbi.nlm.nih.gov/pubmed/24488312)
 - ブドウ球菌 [Comparative genomic analysis of the genus Staphylococcus including Staphylococcus aureus and its newly described sister species Staphylococcus simiae. BMC Genomics. 2012 Jan](http://www.ncbi.nlm.nih.gov/pubmed/22272658)
 - レンサ球菌 [Comparative genomic analysis of the Streptococcus dysgalactiae species group: gene content, molecular adaptation, and promoter evolution. Genome Biol Evol. 2011](http://www.ncbi.nlm.nih.gov/pubmed/21282711)

- SFC授業
 - [SFC 2015年度 秋学期 基礎バイオインフォマティクス](https://github.com/haruosuz/introBI)
  - [R言語入門](https://dl.dropboxusercontent.com/u/33495171/introBI/2015-11-11/README.md.html)
 - [SFC 2016年度 春学期 生命動態のデータサイエンス](https://github.com/haruosuz/DS4GD)
  - [Rを用いたデータの解析と可視化](https://dl.dropboxusercontent.com/u/33495171/DS4GD/BBS.md.html#chapter-4-analysis-and-visualisation-of-data-using-r)

- [バイオインフォマティクス](http://crusade1096.web.fc2.com/katei.html) > [BLAST](http://crusade1096.web.fc2.com/blast.html)
- [NGS Surfer's Wiki | コンバータ・パーサ](https://cell-innovation.nig.ac.jp/wiki/tiki-index.php?page=コンバータ・パーサ)

- Rによる系統解析
  - [R - 井上 潤](http://www.geocities.jp/ancientfishtree/R_JI.html)
  - [系統樹 ape ade4 | Rで系統樹を作成する方法](http://stat.biopapyrus.net/graph/r-phylogenetic-tree.html)
  - [Rと系統樹(1)](https://www1.doshisha.ac.jp/~mjin/R/42/42.html)
  - [Rと系統樹(2)](https://www1.doshisha.ac.jp/~mjin/R/43/43.html)

- rarefaction curve
 - plot - accumulation curve in R - Stack Overflow http://stackoverflow.com/questions/21615628/accumulation-curve-in-r
 - Vegan: ecological diversity https://cran.r-project.org/web/packages/vegan/vignettes/diversity-vegan.pdf
 - Gene accumulation curves in R | smoke&umami http://smokeandumami.com/2010/01/21/gene-accumulation-curves-in-r/
 - 自前でrarefactionカーブ in R http://tullbergia.at.webry.info/201009/article_3.html
 - 自前でrarefactionカーブ in R vol.2: マルチコア対応 http://tullbergia.at.webry.info/201111/article_1.html
 - データ解析｜種多様性の測定｜希薄化曲線(rarefaction curves)｜上の計算を R で行うためのコード http://www.lab2.toho-u.ac.jp/sci/bio/theoeco/wiki/index.php?plugin=attach&pcmd=open&file=jissyusyo_DA.pdf&refer=2013%CC%EE%B3%B0%C0%B8%C2%D6%B3%D8%BC%C2%BD%ACI

![https://en.wikipedia.org/wiki/Rarefaction_(ecology)](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Sogin-Huber-CombinedRarefac.jpg/220px-Sogin-Huber-CombinedRarefac.jpg)

- de Bruijn Graph
 - [de Bruijn Graph を使った de novo アセンブリの発想がすごい件 - ほくそ笑む](http://d.hatena.ne.jp/hoxo_m/20100930/p1)
 - [CLCバイオジャパン - De Novo アセンブリ](http://www.clcbio.co.jp/fileadmin/user_upload/Mari/DeNovo_6.5.pdf)
 - ["de Bruijn"はどう発音する？ - Wolfeyes Bioinformatics beta](http://yagays.github.io/blog/2013/08/01/de-bruijn-pronounce/)
 - [de Bruijn graphを使ったアセンブラーのヘテロなサイトの取り扱いについて - #LSQA](http://qa.lifesciencedb.jp/questions/623/de-bruijn-graphを使ったアセンブラーのヘテロなサイトの取り扱いについて) 質問日 Aug 31 '12

----------
