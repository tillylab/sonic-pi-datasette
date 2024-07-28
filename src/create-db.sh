#!/bin/zsh
# sqlite-utils create-table sonicpi.db samples group TEXT sample TEXT duration FLOAT channels INTEGER frames INTEGER rate FLOAT file TEXT --pk sample --replace 
sqlite-utils insert sonicpi.db samples samples.csv --csv --detect-types --pk sample