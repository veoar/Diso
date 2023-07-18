#This file opens up the name_changer.csv and removes all the brackets and other things so that it can be run on name_changer
import csv

input_file = 'name_changer.csv'  # Replace with your input CSV file name
output_file = 'removed_bracket_name_changer.csv'  # Replace with your desired output CSV file name

with open(input_file, 'r', newline='') as csvfile:
    reader = csv.reader(csvfile)
    rows = [row for row in reader]

# Remove parentheses and square brackets from each value in the CSV
modified_rows = [[value.replace('(', '').replace(')', '').replace('[', '').replace(']', '') for value in row] for row in rows]

with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(modified_rows)

print(f'Parentheses and square brackets removed and saved to {output_file}.')

