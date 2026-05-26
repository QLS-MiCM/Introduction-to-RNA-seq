#!/usr/bin/env bash

cd "$(dirname "$0")/../data"

R1=SRR1039508_subset_1.fastq
R2=SRR1039508_subset_2.fastq

awk 'NR%4==1' $R1 | wc -l
awk 'NR%4==1' $R2 | wc -l
cat $R1 $R2 | awk 'NR%4==1' | wc -l

awk 'NR%4==2' $R1 | grep -c N
awk 'NR%4==2' $R2 | grep -c N

awk 'NR%4==2 {print substr($0,1,6)}' $R1 | sort | uniq -c | sort -nr | head
awk 'NR%4==2 {print substr($0,1,6)}' $R2 | sort | uniq -c | sort -nr | head

awk 'NR%4==2' $R1 | grep -c ACGTAC
awk 'NR%4==2' $R2 | grep -c ACGTAC

head -n 400 $R1 > subset_100reads.fastq
