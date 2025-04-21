#!/bin/bash
source .env  # Load environment variables from .env file
read -p "Enter Developer Key: " entered
if [[ "$entered" == "$VALID_KEY" ]]; then
  echo "Key accepted. Access granted."
else
  echo "Invalid key. Access denied."
  exit 1
fi
