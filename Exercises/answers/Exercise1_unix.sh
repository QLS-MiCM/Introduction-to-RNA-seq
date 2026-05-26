#!/usr/bin/env bash

pwd
ls -la

mkdir -p ~/workshop/intro_unix
mkdir -p ~/workshop/intro_unix/data/{ho1,ho2,ho3}
mkdir -p ~/workshop/intro_unix/data/ho1/folder1

cd ~/workshop/intro_unix/data/ho1/folder1

touch f1.txt .f2.txt
ls
ls -a

seq 1 10 > f1.txt
cat f1.txt

mv .f2.txt f2.txt

{ head -n 10 f1.txt; cat f2.txt; } > f3.txt
cat f3.txt
