#!/bin/bash
for i in {1..10}; do
  if [ ${i} -eq 3 ]; then
    echo "Skipping number 3..."
    continue # Skip this iteration
  fi
  if [ ${i} -eq 8 ]; then
    echo "Breaking loop at number 8!"
    break # Stop the loop entirely
  fi
  echo "Processing number: ${i}"
done