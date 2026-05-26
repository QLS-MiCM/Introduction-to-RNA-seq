#!/usr/bin/env bash

mkdir -p ~/workshop/data
cd ~/workshop/data

wget "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE251nnn/GSE251845/suppl/GSE251845_htseq_raw_counts.csv.gz"
ls -lh GSE251845_htseq_raw_counts.csv.gz
zcat GSE251845_htseq_raw_counts.csv.gz | head -n 5

wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR390/SRR390728/SRR390728.fastq.gz"
ls -lh SRR390728.fastq.gz
zcat SRR390728.fastq.gz | head -n 8

fastq-dump --version
fastq-dump -X 10000 --split-files --gzip SRR390728
ls -lh SRR390728*.fastq.gz
zcat SRR390728.fastq.gz | awk 'NR%4==1' | wc -l
