#!/usr/bin/env bash

# colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${RED}=== Delete Script ===${NC}"

read -p $'Specify path of script to be deleted:\n> ' SCRIPT_PATH

if [[ -d "${SCRIPT_PATH}" ]]; then
  echo -e "${RED}Path '${SCRIPT_PATH}' is a directory. Please specify a file.${NC}"
  exit 1
fi

if ! [[ -f "${SCRIPT_PATH}" ]]; then
  echo -e "${RED}Path '${SCRIPT_PATH}' is invalid.${NC}"
  exit 1
fi

echo -e "${YELLOW}Deleting script: ${SCRIPT_PATH}${NC}"
rm "${SCRIPT_PATH}"
echo -e "${GREEN}Deletion complete.${NC}"
