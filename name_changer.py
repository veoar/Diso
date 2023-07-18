#This script renames the newick tree produced from roary
import re
import pandas as pd

# Read the Newick tree file
with open('my_tree.newick', 'r') as file:
    tree_data = file.read()

# Define a regular expression pattern to match branch names
pattern = r'([^\s:,()]+)'

# Find all branch names in the tree using regular expressions
branch_names = re.findall(pattern, tree_data)

# Load the output CSV file into a dataframe
output_df = pd.read_csv('removed_bracket_name_changer.csv')

# Create a mapping dictionary from the output dataframe
output_dict = dict(zip(output_df['Input_file'].str[:15], output_df['Organism Name'].str[:65]))

# Print the mappings for debugging
print(output_dict)

# Replace branch names using the mapping dictionary
for name in branch_names:
    new_name = output_dict.get(name[:15], name[:65])
    tree_data = tree_data.replace(name, new_name, 1)  # Replace the first occurrence only

# Write the modified tree data to a new file
with open('tree.newick', 'w') as file:
    file.write(tree_data)
