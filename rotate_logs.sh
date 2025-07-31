#!/bin/bash

# --- Configuration ---
# Using the home directory for logs and archives for development/testing.
# In a production environment, you would change these to system paths
# like "/var/log/my_app.log" and run the script with sudo.
LOG_DIR="$HOME/logs"
LOG_FILE="${LOG_DIR}/my_app.log"
ARCHIVE_DIR="${LOG_DIR}/archives/"

# The size threshold in bytes (e.g., 1048576 for 1MB).
# Setting a low threshold for easy testing.
SIZE_THRESHOLD=10
# How many days to keep archived logs.
RETENTION_DAYS=7

# --- Functions ---

# A function to log messages with a timestamp.
log_message() {
  local message="$1"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - ${message}"
}

# --- Main Logic ---

log_message "Starting log rotation check for ${LOG_FILE}..."

# 1. Ensure the log and archive directories exist.
mkdir -p "${ARCHIVE_DIR}"
# The -p flag prevents errors if the directory already exists.

# 2. Check if the log file exists.
if [ ! -f "${LOG_FILE}" ]; then
  log_message "Log file not found. Exiting."
  exit 1
fi

# 3. Get the current size of the log file.
current_size=$(wc -c <"${LOG_FILE}")

log_message "Current file size: ${current_size} bytes. Threshold: ${SIZE_THRESHOLD} bytes."

# 4. Check if the file size exceeds the threshold.
if [ "${current_size}" -gt "${SIZE_THRESHOLD}" ]; then
  log_message "Log file exceeds threshold. Rotating..."

  # Create a timestamped filename for the archive.
  timestamp=$(date '+%Y%m%d-%H%M%S')
  archive_file="${ARCHIVE_DIR}/$(basename "${LOG_FILE}")-${timestamp}.gz"

  # Compress and archive the log file.
  gzip -c "${LOG_FILE}" > "${archive_file}"

  # Check if the compression was successful.
  if [ $? -eq 0 ]; then
    log_message "Successfully archived to ${archive_file}."
    # Clear the original log file.
    > "${LOG_FILE}"
    log_message "Original log file cleared."
  else
    log_message "Error: Failed to compress and archive the log file."
    exit 1
  fi
else
  log_message "Log file is within size limits. No rotation needed."
fi

# 5. Clean up old archived logs.
log_message "Cleaning up archives older than ${RETENTION_DAYS} days..."
# The 'find' command is perfect for this.
# -mtime +N finds files modified more than N days ago.
find "${ARCHIVE_DIR}" -name "*.gz" -mtime +${RETENTION_DAYS} -exec rm {} \;

log_message "Log rotation check complete."
exit 0