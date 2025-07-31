#!/bin/bash

# Define a function that accepts two arguments.
print_greeting() {
  # It's good practice to check if the required arguments were provided.
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: print_greeting <name> <time_of_day>"
    return 1 # 'return' is like 'exit' but just for the function.
  fi

  local name="$1"
  local time_of_day="$2"

  echo "Good ${time_of_day}, ${name}!"
}

# --- Main Script Logic ---
echo "Calling the function with arguments:"
print_greeting "Alice" "Morning"
print_greeting "Bob" "Evening"

echo
echo "Calling the function with missing arguments:"
print_greeting