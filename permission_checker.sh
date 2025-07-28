#!/bin/bash
# This script checks the effective user ID to see if it's root.

# The '$EUID' variable holds the user's ID. Root's ID is always 0.
if [ "$EUID" -eq 0 ]; then
  echo "You are running this script as root. Full privileges granted."
elif [ "$EUID" -ge 1000 ]; then
  echo "You are running as a regular user."
else
  echo "You are running as a system user (UID < 1000)."
fi