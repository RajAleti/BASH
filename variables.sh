#!/bin/bash

# --- Configuration Section ---
# This script demonstrates variable usage, including constants.
# A good practice is to define configurable items at the top.

readonly SCRIPT_NAME="variables.sh"
readonly SCRIPT_VERSION="1.1"

# Define user-configurable variables.
TARGET_USER="Alice"
LOG_FILE="/var/log/${TARGET_USER}.log"

# --- Execution Section ---
# The main logic of the script begins here.

echo "Running script: ${SCRIPT_NAME} (Version: ${SCRIPT_VERSION})"
echo "Preparing to log activity for user: ${TARGET_USER}."
echo "Log entries will be written to: ${LOG_FILE}"

# This line would cause an error because SCRIPT_VERSION is read-only:
# SCRIPT_VERSION="1.2"