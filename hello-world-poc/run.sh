#!/usr/bin/env bash

set -e  # exit on any error

# Name of the executable
EXEC_NAME="main_exec"

# Ensure ./tmp exists
mkdir -p ./tmp

# Compile to ./tmp
echo "Compiling..."
ghc Main.hs -outputdir ./tmp -o ./tmp/$EXEC_NAME

# Run
echo "Running..."
./tmp/$EXEC_NAME
