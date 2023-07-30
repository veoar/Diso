# Diso
# Instructions on the methods of the experiment
# Download the dataset and move it to the HPC
# Install conda (https://conda.io/projects/conda/en/latest/user-guide/getting-started.html)
Run clean.sh to move all the .fna files into a directory
install mamba using conda
conda install -c conda-forge mamba
create a conda env for prokka
conda create --prefix prokka
conda activate prokka
conda install -c bioconda prokka
run the prokka script
sbatch prokka.sh

