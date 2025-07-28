#!/bin/bash
# This script renames all .txt files in the current directory.

# The pattern '*.txt' expands to a list of all matching files.
for filename in *.txt; do
  # Check if a file with the .txt extension actually exists to avoid errors.
  if [ -f "${filename}" ]; then
    echo "Backing up: ${filename}"
    # 'mv' is the move/rename command.
    mv "${filename}" "${filename}.bak"
  fi
done

echo "Backup complete."