#!/usr/bin/env bash
# Pattern Matching -- grep practice on happiness.csv
# Matches the slide deck: head/wc + four grep commands.

cd "$(dirname "$0")/../data"
F=happiness.csv

# Peek at the file.
head -n 5 $F
wc -l $F

# 1. Plain match -- also catches "Female" because "Male" is a substring of it.
grep    Male  $F

# 2. -w forces a whole-word match -- now only the Male rows.
grep -w Male  $F

# 3. -v inverts -- drop every row that contains "Both", keep only Male/Female rows.
grep -v Both  $F

# 4. -n adds line numbers, useful when you want to jump back to a row in an editor.
grep -n DK    $F
