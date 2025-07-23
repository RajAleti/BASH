#!/bin/bash

# This script demonstrates gathering user data for a setup process.
# It uses different 'read' flags for different types of input.

echo "--- New User Setup ---"

# 1. Prompt for a username using the -p flag.
read -p "Enter the new username: " USERNAME

# 2. Prompt for a password using the -s (silent) flag.
read -s -p "Enter the password for ${USERNAME}: " PASSWORD
echo # Add a newline because -s does not.

# 3. Prompt for confirmation with a timeout.
read -t 10 -p "Is this information correct? (y/n): " CONFIRMATION

# We will cover 'if' statements in detail later, but this shows the concept.
if [ "$CONFIRMATION" == "y" ]; then
  echo "Setup proceeding for user: ${USERNAME}..."
  # In a real script, you would add user creation logic here.
else
  echo "Setup cancelled."
fi
