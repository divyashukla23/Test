# Bash script for renaming files in a directory based on a user-defined naming pattern:
#!/bin/bash

# Prompt the user for the directory path
read -p "Enter the directory path where files are located: " directory

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory '$directory' does not exist."
  exit 1
fi

# Prompt the user for the naming pattern
read -p "Enter the naming pattern (use {} as a placeholder for numbering, e.g., 'file{}'): " pattern

# Counter for numbering
counter=1

# Loop through files in the directory
for file in "$directory"/*; do
  if [ -f "$file" ]; then
    # Extract the file extension
    extension="${file##*.}"

    # Generate the new filename based on the pattern
    new_filename=$(echo "$pattern" | sed "s/{}/$counter/g")."$extension"

    # Rename the file
    mv "$file" "$directory/$new_filename"

    # Increment the counter
    ((counter++))
  fi
done

echo "Files renamed according to the pattern."
