#!/bin/bash
#This script merges all the CRISPR Cas Summary into .xls and separates all the summary results by Results_GCF_$unique_id
# Define the source and destination paths
SOURCE_DIR="/home/mbxjt11/scratch/CRISPRCasFinder-master/RESULTS"
DEST_FILE="/home/mbxjt11/scratch/CRISPRCasFinder-master/RESULTS/merged_Final.xls"

# Create an empty merged file
cat /dev/null > "$DEST_FILE"

# Loop through all the directories starting with "Result_GCF"
for dir in "$SOURCE_DIR"/Result_GCF_*; do
  # Check if the directory exists and has a TSV directory
  if [ -d "$dir" ] && [ -d "$dir/TSV" ]; then
    # Extract the unique ID from the directory name
    unique_id=$(basename "$dir" | awk -F_ '{print $NF}')

    # Build the file path
    file="$dir/TSV/CRISPR-Cas_summary_$unique_id.xls"

    # Check if the file exists and cat its contents to the merged file
    if [ -f "$file" ]; then
      # Add the ID number as a line in the merged .xls file
      echo "Results_GCF_$unique_id" >> "$DEST_FILE"

      # Concatenate the file contents to the merged .xls file
      cat "$file" >> "$DEST_FILE"
    fi
  fi
done

echo "Merging completed successfully!"
