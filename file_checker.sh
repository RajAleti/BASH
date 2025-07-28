#!/bin/bash
# This script checks if a file exists.

# Store the filename to check in a variable for easy modification.
FILE_TO_CHECK="/etc/hosts"

echo "Checking for file: ${FILE_TO_CHECK}"

# Use the -f operator to test if it's a file.
if [ -f "${FILE_TO_CHECK}" ]; then
  echo "Result: File found."
else
  echo "Result: File not found."
fi
