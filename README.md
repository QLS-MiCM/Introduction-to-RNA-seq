# Introduction to UNIX and RNA-seq Repositories

Day 1 of the workshop. June 1st, 2026.

The slides are in `Slides/` (PDF and PPTX). Answer keys for each exercise are in `Exercises/answers/`. Data files used in the exercises are in `Exercises/data/`.

## Before the session

You need a terminal.

* Mac: just open Terminal.
* Linux: same, open your terminal.
* Windows: install WSL Ubuntu and open it. From PowerShell:

```
wsl --install -d Ubuntu
wsl -l -v
wsl -d Ubuntu
```

Then run the setup script from the repo:

```
bash setup.sh
```

That installs `wget`, `sra-toolkit`, and the small text utilities we use (`awk`, `grep`, `sed`, `tar`, `gzip`, `curl`). It creates `~/workshop/data` and prints a check at the end. Safe to re-run.

If it fails on your machine, do not panic. Come a few minutes early and we will sort it out.

## Outline

1. Setup and troubleshooting.
2. UNIX basics: navigation, inspection, pipes and redirects, text search.
3. GEO basics: accession types (GSE, GSM, SRR), common files, downloading with `wget` and `fastq-dump`.

## Exercises

* `Exercises/answers/Exercise1_unix.sh` — directory tree, file creation, `seq`, `mv`, concatenation.
* `Exercises/answers/Exercise2_geo_download.sh` — `wget` for a GEO supplementary file and an ENA FASTQ, then `fastq-dump -X 10000` for a capped SRA pull.
* `Exercises/answers/Exercise3_1_counts_csv.sh` — inspecting the gzipped count matrix from GSE251845.
* `Exercises/answers/Exercise3_2_fastq.sh` — counting reads, hexamer bias, motif search, and safely subsetting a FASTQ.

The demo accession is `SRR390728` (small, public, finishes fast). The count matrix is from [GSE251845](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE251845).

## References

* Count matrix: [GSE251845](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE251845).
* Paired-end FASTQ subsets: [statOmics SGA2019 airway data](https://github.com/statOmics/SGA2019/tree/data-rnaseq/airway/fastQ).

This workshop is part of the McGill Initiative in Computational Medicine.
