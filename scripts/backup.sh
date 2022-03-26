#!/usr/bin/env bash

set -e

USB_PATH="/mnt"
DADES_PATH="/Dades"

# Move to the working directory
pushd ${USB_PATH}

# Create a new folder for the backup
BKP_PATH="backup-$(date +%F)"
if [ ! -d ${BKP_PATH} ]
then
  mkdir ${BKP_PATH}
fi

# Move to the backup folder
pushd ${BKP_PATH}

# Backup the Backup folder
rsync -av --progress --append ${DADES_PATH}/Backup .

# Backup the Documents folder
rsync -av --progress --append ${DADES_PATH}/Documents .

# Backup the Games folder
rsync -av --progress --append ${DADES_PATH}/Games .

# Backup the Music folder
rsync -av --progress --append ${DADES_PATH}/Music .

# Backup the Pictures folder
rsync -av --progress --append ${DADES_PATH}/Pictures .

# Backup the Others folder
rsync -av --progress --append --exclude Manuales_Linux ${DADES_PATH}/Others .

# Backup the Videos folder
rsync -av --progress --append --exclude Movies --exclude Series ${DADES_PATH}/Videos .
