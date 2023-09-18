#!/usr/bin/env bash

# Get the current script's directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Changing to script directory ${SCRIPT_DIR}..."
cd "${SCRIPT_DIR}"

# SourceSourceSourceSource necessary environment from the script's directory
echo "Loading environment file..."
set -a; source .env; set +a

# Change to directory remote src directory where compiled code is.
echo "Changing to src directory ${SRC_DIR}..."
cd "${SRC_DIR}"

# Build Java file list from files with main method and store in options.
unset options i
while IFS= read -r -d $'\0' f; do
  options[i++]="$f"
done < <(find . -maxdepth 1 -type f -name "*.class" -exec grep -q main '{}' \; -print0 )

# Use files stored in options to present select menu.
while true; do
    echo "-----------------------------"
    select opt in "${options[@]}" "Stop the script"; do
      case $opt in
        *.class)
          echo "Selected Java file $opt"
          jfile=$(basename ${opt%.*})
          echo "Running 'java ${jfile}' from $(pwd)"
          # Run compiled test program
          java $jfile
          break
          ;;
        "Stop the script")
          echo "You chose to stop"
          break 2
          ;;
        *)
          echo "This is not a number"
          break
          ;;
      esac
    done
done