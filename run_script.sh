#!/usr/bin/env bash

# colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== Run Script ===${NC}"

read -p $'Specify path of script to run:\n> ' SCRIPT_PATH

if [[ -z "${SCRIPT_PATH}" ]]; then
  echo -e "${RED}No input provided.${NC}"
  exit 1
fi

if [[ -f "${SCRIPT_PATH}" ]]; then
  echo -e "${YELLOW}Running ${SCRIPT_PATH}...${NC}"
  ."${SCRIPT_PATH}"
else
  echo -e "${RED}'${SCRIPT_PATH}' is not a valid file.${NC}"
  exit 1
fi
