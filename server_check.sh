#!/bin/bash
# This script iterates over a list of servers and "pings" them.

# Define the list of servers to check.
SERVER_LIST="server1.example.com server2.example.com database1.example.com"

echo "Starting health check for all servers..."

for server in ${SERVER_LIST}; do
  echo "-----------------------------------"
  echo "Checking status of: ${server}"
  # The 'ping -c 1' command sends a single packet.
  # This is a simple way to check for network connectivity.
  ping -c 1 "${server}"
done

echo "-----------------------------------"
echo "Health check complete."