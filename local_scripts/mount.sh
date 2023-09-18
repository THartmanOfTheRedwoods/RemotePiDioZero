#!/usr/bin/env bash

is_mounted() {
    # Change the -t option to suite your environment.
    mount -t macfuse | grep "$1" &> /dev/null
    return $?
}

# Get the current script's directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Changing to script directory ${SCRIPT_DIR}..."
cd "${SCRIPT_DIR}"

# SourceSourceSourceSource necessary environment from the script's directory
echo "Loading environment file..."
set -a; source .env; set +a

# Define mount directory mapping
MOUNT_MAP=( "${LOCAL_SRC_DIR}:${REMOTE_SRC_DIR}"
        "${LOCAL_LIB_DIR}:${REMOTE_LIB_DIR}"
        "${LOCAL_SCRIPT_DIR}:${REMOTE_SCRIPT_DIR}" )

# Mount each of the local directories if they are not already mounted.
for entry in "${MOUNT_MAP[@]}" ; do
    L_DIR=${entry%%:*}
    R_DIR=${entry#*:}
    if is_mounted "${L_DIR}"; then
        echo "${L_DIR} already mounted"
    else
        printf "Mounting %s to %s.\n" "$R_DIR" "$L_DIR"
        sshfs ${USER}@${HOST}:${R_DIR} "${L_DIR}"
    fi
done
