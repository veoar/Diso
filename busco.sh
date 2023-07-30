#!/bin/bash

--cpus [N]         Number of CPUs to use [0=all]

# Set the paths
input_dir="/home/mbxjt11/scratch/prokka_clean"
lineage_path="/home/mbxjt11/scratch/busco_downloads/lineages/alphaproteobacteria_odb10"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Iterate over the .fna files in the input directory
for file in "$input_dir"/*.fna; do
    # Get the filename without extension
    filename=$(basename "$file" .fna)

    # Run BUSCO QC
    busco -i "$file" -l "$lineage_path" -m genome -o Busco_QC
done

