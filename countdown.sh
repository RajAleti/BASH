#!/bin/bash
# A simple countdown script using a while loop.

# Initialize a counter variable.
COUNTER=5

echo "Starting countdown..."

# Loop as long as the COUNTER is greater than 0.
while [ ${COUNTER} -gt 0 ]; do
  echo "T-minus ${COUNTER}"
  # Decrement the counter. This is the crucial step
  # that prevents an infinite loop.
  let COUNTER=COUNTER-1
  # Wait for 1 second.
  sleep 1
done

echo "Liftoff!"