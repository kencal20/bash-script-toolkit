#!/usr/bin/env bash

# color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}=== Backup Utility ===${NC}\n"

read -p $'Enter path (file or directory) to backup:\n> ' BACKUP_SOURCE

if [[ ! -e "$BACKUP_SOURCE" ]]; then
  echo -e "${RED}Invalid source path.${NC}"
  exit 1
fi

read -p $'Enter destination directory:\n> ' BACKUP_DESTINATION

if [[ ! -d "$BACKUP_DESTINATION" ]]; then
  echo -e "${RED}Invalid destination directory.${NC}"
  exit 1
fi

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Extract name of file/folder
SOURCE_NAME=$(basename "$BACKUP_SOURCE")

# Build new backup name
BACKUP_NAME="${SOURCE_NAME}_backup_${TIMESTAMP}"

echo -e "\n${YELLOW}Starting backup...${NC}"

if [[ -f "$BACKUP_SOURCE" ]]; then
  cp -v "$BACKUP_SOURCE" "${BACKUP_DESTINATION}/${BACKUP_NAME}"
elif [[ -d "$BACKUP_SOURCE" ]]; then
  cp -rv "$BACKUP_SOURCE" "${BACKUP_DESTINATION}/${BACKUP_NAME}"
fi

echo -e "\n${GREEN}Backup completed successfully.${NC}"
