#!/bin/bash
#SBATCH --job-name=Prokka
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --output=/home/mbxjt11/scratch/OE/prokka1.out
#SBATCH --error=/home/mbxjt11/scratch/OE/prokka1.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /home/mbxjt11/scratch



# Set the input and output directories
input_dir="/home/mbxjt11/scratch/clean"
output_dir="/home/mbxjt11/scratch/Prokka_results"

# Create the output directory if it doesn't exist
mkdir -p $output_dir

# Loop through all .fna files in the input directory
for f in $input_dir/*.fna
do
    # Get the original file name without the extension
    base=$(basename $f .fna)

    # Run Prokka on the file with the original file name as the output prefix
    prokka --outdir $output_dir/$base --prefix $base $f
done

