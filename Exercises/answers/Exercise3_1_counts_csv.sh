#!/usr/bin/env bash

cd ~/workshop/data 2>/dev/null || cd "$(dirname "$0")/../data"

F=GSE251845_htseq_raw_counts.csv.gz

zcat $F | head
zcat $F | tail -n 5
zcat $F | tail -n +2 | wc -l

zcat $F | head -n 1 | awk -F',' '{for(i=1;i<=NF;i++) printf("%d\t%s\n", i, $i)}'

zcat $F | cut -d',' -f1,3,5 > subset_cols.csv
head subset_cols.csv

( head -n 1 subset_cols.csv; tail -n +2 subset_cols.csv | sort -t',' -k3,3nr ) > sorted_subset.csv
head sorted_subset.csv

zcat $F | awk -F',' 'NR>1 && ($2==0 || $3==0){c++} END{print c}'
zcat $F | awk -F',' 'NR>1 && ($2==0 && $3==0){c++} END{print c}'
zcat $F | awk -F',' 'NR>1 && $3>=1000{c++}            END{print c}'
