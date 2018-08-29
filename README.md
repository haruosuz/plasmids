Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2018-02-04

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
