#!/usr/bin/env bash
# Pattern Matching -- awk practice on the paired-end FASTQ subsets.
# Matches the slide deck: read count, avg length, GC%, N-count, top hexamers.
#
# FASTQ recap (4 lines per read):
#   NR%4==1  header (starts with @)
#   NR%4==2  sequence
#   NR%4==3  +
#   NR%4==4  quality string

cd "$(dirname "$0")/../data"
R1=SRR1039508_subset_1.fastq

# read count
awk 'NR%4==1' $R1 | wc -l

# average read length
awk 'NR%4==2 { t+=length($0); n++ } END { print t/n }' $R1

# GC content (%)
awk 'NR%4==2 { n+=length($0); gc+=gsub(/[GCgc]/,"",$0) }
     END     { printf "GC%% = %.2f\n", 100*gc/n }' $R1

# reads containing an ambiguous base N
awk 'NR%4==2 && /N/ { c++ } END { print c }' $R1

# top 10 starting hexamers (5' end) -- classic library QC check
awk 'NR%4==2 { print substr($0,1,6) }' $R1 \
  | sort | uniq -c | sort -nr | head
