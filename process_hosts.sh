#!/bin/bash
# This script reads hostnames from a file and processes each one.

# Define the input file.
HOSTS_FILE="hosts.txt"

# Check if the input file exists and is readable.
if [ ! -r "${HOSTS_FILE}" ]; then
  echo "Error: Input file not found or not readable: ${HOSTS_FILE}"
  exit 1
fi

echo "Reading hosts from ${HOSTS_FILE}..."

# The 'while read -r line' construct reads the file line by line.
# The input to the loop is redirected from our file using '<'.
while read -r hostname; do
  echo "Processing host: ${hostname}"
  # Add commands to run for each host here.
done < "${HOSTS_FILE}"

echo "Finished processing all hosts."