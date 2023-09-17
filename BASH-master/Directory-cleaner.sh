# Bash script for a directory cleaner that moves files older than a specified number of days to an "archive" folder:
#!/bin/bash

# Prompt the user for the directory path
read -p "Enter the directory path to clean: " source_directory

# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
  echo "Source directory '$source_directory' does not exist."
  exit 1
fi

# Prompt the user for the age (in days) to determine which files to clean
read -p "Enter the maximum age (in days) for files to keep: " max_age_days

# Create an "archive" folder if it doesn't exist
archive_directory="$source_directory/archive"
if [ ! -d "$archive_directory" ]; then
  mkdir -p "$archive_directory"
fi

# Calculate the current timestamp in seconds
current_timestamp=$(date +%s)

# Loop through files in the source directory
for file in "$source_directory"/*; do
  if [ -f "$file" ]; then
    # Get the file's modification timestamp in seconds
    file_timestamp=$(date +%s -r "$file")

    # Calculate the age of the file in days
    file_age_days=$(( (current_timestamp - file_timestamp) / 86400 ))

    # Check if the file is older than the specified maximum age
    if [ "$file_age_days" -gt "$max_age_days" ]; then
      # Move the file to the archive directory
      mv "$file" "$archive_directory"
      echo "Moved '$file' to '$archive_directory'"
    fi
  fi
done

echo "Directory cleaning complete."
