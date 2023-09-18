#!/usr/bin/env bash

# Get the current script's directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Changing to script directory ${SCRIPT_DIR}..."
cd "${SCRIPT_DIR}"

# SourceSourceSourceSource necessary environment from the script's directory
echo "Loading environment file..."
set -a; source .env; set +a

# Change to directory remote src directory where src code is.
echo "Changing to src directory ${SRC_DIR}..."
cd "${SRC_DIR}"

# Run compiled test program
echo "Compiling java code..."
javac *.java

echo "All done, Goodbye."
