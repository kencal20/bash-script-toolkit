#!/usr/bin/env bash

# color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== Debug Script ===${NC}"
echo -n "Enter name or path of script to debug: "
read SCRIPT_PATH

if [[ -d "${SCRIPT_PATH}" ]]; then
  echo -e "${RED}The path '${SCRIPT_PATH}' is a directory.${NC}"
  exit 1
fi

if ! [[ -f "${SCRIPT_PATH}" ]]; then
  echo -e "${RED}'${SCRIPT_PATH}' is not a valid file.${NC}"
  exit 1
fi

echo -e "${YELLOW}Starting debug...${NC}\n"
PS4='<DEBUG>:  ' bash -x "${SCRIPT_PATH}"
echo -e "\n${GREEN}Debugging complete for ${SCRIPT_PATH}.${NC}"
