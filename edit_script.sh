#!/usr/bin/env bash

# color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}=== Edit Script ===${NC}"

read -p $'Specify a file to edit:\n> ' SCRIPT_PATH

if [[ ! -f "${SCRIPT_PATH}" ]]; then
  echo -e "${RED}Path '${SCRIPT_PATH}' is invalid.${NC}"
  exit 1
fi

echo -e "\n${YELLOW}Choose an editor:${NC}"
echo -e " ${GREEN}1)${NC} vim"
echo -e " ${GREEN}2)${NC} nano"
read -p "> " EDITOR

select_editor() {
  local editor=$1
  if ! command -v "${editor}" &>/dev/null; then
    echo -e "${RED}${editor} is not installed.${NC}"
    exit 1
  fi
  "${editor}" "${SCRIPT_PATH}"
}

case "$EDITOR" in
  1) select_editor "vim" ;;
  2) select_editor "nano" ;;
  *) echo -e "${RED}Invalid option.${NC}" ;;
esac
