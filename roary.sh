#!/bin/bash
#SBATCH --job-name=RF
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=168:00:00
#SBATCH --output=/gpfs01/home/mbxjt11/OandE/%RF1.out
#SBATCH --error=/gpfs01/home/mbxjt11/OandE/%RF1.err

source $HOME/.bash_profile
conda activate /gpfs01/home/mbxjt11/ENVS/roary

roary -f roary_output4 -e -v --mafft -p 40 -i 30 -s -g 400000 -iv 1.2 *.gff
