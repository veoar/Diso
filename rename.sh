#!/bin/bash
#This renames the summary file from CRISPRCasFinder to have the time ID code
parent_directory="/home/mbxjt11/scratch/CRISPRCasFinder-master"

for directory in "$parent_directory"/Result_GCF*; do
    if [ -d "$directory" ]; then
        directory_id=$(basename "$directory" | awk -F '_' '{print $NF}')
        tsv_directory="$directory/TSV"
        for filename in "$tsv_directory"/*; do
            new_filename=$(basename "$filename" | sed -e "s/REPORT/REPORT_$directory_id/" -e "s/summary/summary_$directory_id/")
            mv "$filename" "$tsv_directory/$new_filename"
        done
    fi
done
