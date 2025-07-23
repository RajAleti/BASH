#!/bin/bash

# This script gathers system information using command substitution.

# Using command substitution to create a dynamic report title.
echo "--- System Report for $(hostname) ---"

# Get the current system uptime.
UPTIME=$(uptime -p)
echo "System Uptime: ${UPTIME}"

# Get the current disk usage for the root filesystem.
# We use 'awk' to grab just the percentage used from the 'df' output.
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
echo "Root Disk Usage: ${DISK_USAGE}"

# Get the number of currently running processes.
# 'ps aux' lists processes, 'wc -l' counts the lines.
PROCESS_COUNT=$(ps aux | wc -l)
echo "Running Processes: ${PROCESS_COUNT}"
