#!/bin/bash

# --- Configuration ---
# Define the warning thresholds (as percentages).
CPU_THRESHOLD=80
MEM_THRESHOLD=85
DISK_THRESHOLD=90

# --- Functions ---

# A function to log messages with a timestamp.
log_message() {
  local message="$1"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - ${message}"
}

# --- Main Logic ---

log_message "--- Starting System Health Check ---"

# 1. Check CPU Usage
# Using 'top' in batch mode, then 'grep' and 'awk' to isolate the idle percentage.
# We then subtract the idle percentage from 100 to get the usage.
cpu_idle=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $8}')
cpu_usage=$(echo "100 - ${cpu_idle}" | bc)
log_message "CPU Usage: ${cpu_usage}%"
# Use 'bc' for floating point comparison.
if (( $(echo "${cpu_usage} > ${CPU_THRESHOLD}" | bc -l) )); then
  log_message "WARNING: CPU usage is above threshold!"
fi

# 2. Check Memory Usage
# Using 'free' and 'awk' to calculate the percentage of used memory.
mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
log_message "Memory Usage: ${mem_usage}%"
if (( $(echo "${mem_usage} > ${MEM_THRESHOLD}" | bc -l) )); then
  log_message "WARNING: Memory usage is above threshold!"
fi

# 3. Check Disk Usage for the root filesystem ('/')
# Using 'df' and 'awk' to get the usage percentage.
disk_usage=$(df -h / | grep '/' | awk '{ print $5 }' | sed 's/%//g')
log_message "Root Disk Usage: ${disk_usage}%"
if [ "${disk_usage}" -gt "${DISK_THRESHOLD}" ]; then
  log_message "WARNING: Disk usage is above threshold!"
fi

log_message "--- System Health Check Complete ---"
exit 0