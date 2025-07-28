#!/bin/bash
# A script that simulates a service controller.

# Check if an argument was provided. -z checks for an empty string.
if [ -z "$1" ]; then
  echo "Usage: $0 {start|stop|status}"
  exit 1 # Exit with an error code
fi

# Use a case statement to check the first argument ($1).
case "$1" in
  start)
    echo "Starting the service..."
    # Add real start commands here
    ;;
  stop)
    echo "Stopping the service..."
    # Add real stop commands here
    ;;
  status)
    echo "Checking service status..."
    # Add real status-check commands here
    ;;
  *)
    echo "Error: Invalid argument '$1'."
    echo "Usage: $0 {start|stop|status}"
    exit 1
    ;;
esac

exit 0