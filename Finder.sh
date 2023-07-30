#!/bin/bash

directory="/home/mbxjt11/scratch/CRISPRCasFinder-master"
for file in "$directory"/*.fna; do
        perl CRISPRCasFinder.pl -in "$file" -cas
done

