#!/usr/bin/env bash

# Get the current script's directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Changing to script directory ${SCRIPT_DIR}..."
cd "${SCRIPT_DIR}"

# SourceSourceSourceSource necessary environment from the script's directory
echo "Loading environment file..."
set -a; source .env; set +a

# Use files stored in options to present select menu.
select opt in "Compile" "Run" "Exit"; do
  case $opt in
    "Compile")
      ssh ${USER}@${HOST} "${REMOTE_SCRIPT_DIR}/WS281xBuild.sh"
      break
      ;;
    "Run")
      ssh ${USER}@${HOST} "/usr/bin/sudo ${REMOTE_SCRIPT_DIR}/WS281xRun.sh"
      break
      ;;
    "Exit")
      echo "You chose to exit"
      break
      ;;
    *)
      echo "This is not an option."
      break
      ;;
  esac
done