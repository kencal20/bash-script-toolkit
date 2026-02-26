#!/usr/bin/env bash

echo
echo "=== Backup Utility ==="
echo

read -p $'Enter path (file or directory) to backup:\n> ' BACKUP_SOURCE

if [[ ! -e "$BACKUP_SOURCE" ]]; then
  echo "Invalid source path."
  exit 1
fi

read -p $'Enter destination directory:\n> ' BACKUP_DESTINATION

if [[ ! -d "$BACKUP_DESTINATION" ]]; then
  echo "Invalid destination directory."
  exit 1
fi

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Extract name of file/folder
SOURCE_NAME=$(basename "$BACKUP_SOURCE")

# Build new backup name
BACKUP_NAME="${SOURCE_NAME}_backup_${TIMESTAMP}"

echo
echo "Starting backup..."

if [[ -f "$BACKUP_SOURCE" ]]; then
  cp -v "$BACKUP_SOURCE" "${BACKUP_DESTINATION}/${BACKUP_NAME}"
elif [[ -d "$BACKUP_SOURCE" ]]; then
  cp -rv "$BACKUP_SOURCE" "${BACKUP_DESTINATION}/${BACKUP_NAME}"
fi

echo
echo "Backup completed successfully."
