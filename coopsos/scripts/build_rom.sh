#!/bin/bash
echo "Starting ROM build..."
BUILD_DIR="/tmp/coops_build"
[ -d $BUILD_DIR ] || mkdir -p $BUILD_DIR
if ! command -v make &> /dev/null; then
    echo "Make is required!"
    exit 1
fi
echo "Building CoopsOS..."
make -C $BUILD_DIR
