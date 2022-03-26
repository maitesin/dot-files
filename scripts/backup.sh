#!/usr/bin/env bash

set -e

USB_PATH="/mnt"
DADES_PATH="/Dades"

# Move to the working directory
pushd ${USB_PATH}

# Create a new folder for the backup
BKP_PATH="backup-${date +%F}"
mkdir ${BKP_PATH}

# Move to the backup folder
pushd ${BKP_PATH}

# Backup the Backup folder
rsync -av --progress --append ${DADES_PATH}/Backup .
