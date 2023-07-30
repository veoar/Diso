# Diso
# Instructions on the methods of the experiment
# Download the dataset and move it to the HPC
# Install conda using the following link and run the commands after installing conda
https://conda.io/projects/conda/en/latest/user-guide/getting-started.html) <br>
conda config --add channels r <br>
conda config --add channels defaults <br>
conda config --add channels conda-forge <br>
conda config --add channels bioconda <br>
# Run clean.sh to move all the .fna files into a directory
sbatch clean.sh
# Install mamba using conda and create a prokka environment
conda install -c conda-forge mamba <br>
conda create --prefix prokka <br>
conda activate prokka <br>
conda install -c bioconda prokka <br>
# Run the prokka script
sbatch prokka.sh
# Run clean1.sh to move all the prokka gff files into a separate directory
sbatch clean1.sh
# Create a BUSCO environment and run busco on the .fna
conda create --prefix busco <br>
conda activate busco <br>
mamba install -c conda-forge -c bioconda busco=5.4.7 <br>
sbatch busco.sh <br>
# Create a roary enviroment
conda create --prefix roary <br>
mamba install roary <br>
# Run roary_plots.py. This needs to be in the same directory as the "my_tree.newick", "core_gene_alignment.aln" and "gene_presence_absence.csv"
FastTree –nt –gtr core_gene_alignment.aln > my_tree.newick <br>
roary_plots.py my_tree.newick gene_presence_absence.csv <br>
# Install CRISPRCasFinder by downloading all the files and moving them into the HPC in the following link and run the following code
https://github.com/dcouvin/CRISPRCasFinder <br>
conda env create -f ccf.environment.yml -n crisprcasfinder <br>
conda activate crisprcasfinder <br>
mamba init <br>
mamba activate <br>
mamba install -c bioconda macsyfinder=2.1.2 <br>
macsydata install -u CASFinder==3.1.0 <br>
# Run CRISPRCasFinder
sbatch Finder.sh <br>
# Run the following scripts to merge it into one file
sbatch rename.sh <br>
merge_CRISPR-Cas_summary1.sh <br>
merge_Crispr_REPORT.sh <br>
# Create a conda enviroment for the making of the traits file
conda create --prefix ENVS <br>
conda activate ENVS <br>
mamba install -c anaconda pandas <br>
mamba install -c anaconda numpy <br>
sbatch jordan.py <br>
