#!/bin/bash

# Define a directory where we likely don't have write permission.
PROTECTED_DIR="/etc/new_test_dir"

echo "Attempting to create directory: ${PROTECTED_DIR}"
mkdir "${PROTECTED_DIR}"

# Check the exit code of the 'mkdir' command.
if [ $? -ne 0 ]; then
  echo "Error: Failed to create directory. Do you have permissions?"
  exit 1 # Exit the script with a failure code.
fi

# This part will only run if the command was successful.
echo "Directory created successfully."
exit 0