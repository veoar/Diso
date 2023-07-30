#!/bin/bash


# Set the source and destination directories
source_dir="/home/mbxjt11/scratch/Prokka_results"
dest_dir="/home/mbxjt11/scratch/prokka_clean"

# Create the destination directory if it doesn't exist
mkdir -p $dest_dir

# Move all .fna files from the source directory and its subdirectories to the destination directory
find $source_dir -name "*.gff" -exec mv {} $dest_dir \;
