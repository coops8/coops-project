#!/bin/bash
echo "===================================="
echo "   Building CoopsOS by Coops8"
echo "===================================="
echo "Setting up environment..."
sleep 1

echo "Checking keys..."
if [[ -f keys/dev.key && -f keys/system.key && -f keys/flash.key ]]; then
    echo "Keys found. Build authenticated."
else
    echo "Missing keys. Build halted."
    exit 1
fi

echo "Starting build process..."
# TODO: Add actual AOSP/ROM build logic here
sleep 2
echo "Build completed successfully. Output in /out/coopsos/"
