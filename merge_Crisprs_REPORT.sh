#!/bin/bash
#Mergees all Crisprs_REPORT into one .xls file
# Define the source and destination paths
SOURCE_DIR="/home/mbxjt11/scratch/CRISPRCasFinder-master/RESULTS"
DEST_FILE="/home/mbxjt11/scratch/CRISPRCasFinder-master/RESULTS/merged_Crisprs_REPORT.xls"

# Create an empty merged file
cat /dev/null > "$DEST_FILE"

# Loop through all the directories starting with "Result_GCF"
for dir in "$SOURCE_DIR"/Result_GCF_*; do
  # Check if the directory exists and has a TSV directory
  if [ -d "$dir" ] && [ -d "$dir/TSV" ]; then
    # Extract the unique ID from the directory name
    unique_id=$(basename "$dir" | awk -F_ '{print $NF}')

    # Build the file path
    file="$dir/TSV/Crisprs_REPORT_$unique_id.xls"

    # Check if the file exists and cat its contents to the merged file
    if [ -f "$file" ]; then
      cat "$file" >> "$DEST_FILE"
    fi
  fi
done

echo "Merging completed successfully!"

