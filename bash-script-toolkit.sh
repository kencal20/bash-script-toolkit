#!/usr/bin/env bash

# basic ANSI colors for a friendlier UI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # no color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A scripts_sources=(
  [create]="$SCRIPT_DIR/create-script.sh"
  [debug]="$SCRIPT_DIR/debug_script.sh"
  [delete]="$SCRIPT_DIR/delete_script.sh"
  [run]="$SCRIPT_DIR/run_script.sh"
  [edit]="$SCRIPT_DIR/edit_script.sh"
  [backup]="$SCRIPT_DIR/backup_script.sh"
)
print_header() {
  echo -e "\n${CYAN}======================================${NC}"
  echo -e "${BLUE}        Bash Script Toolbox         ${NC}"
  echo -e "${CYAN}======================================${NC}\n"
}

confirmation() {
  PROMPT=$1
  SCRIPT=$2
  echo -ne "${YELLOW}${PROMPT}${NC} "
  read ANSWER
  if [[ "${ANSWER,,}" == "yes" || "${ANSWER}" == "y" ]]; then
    sleep 1
    "${SCRIPT}"
  else
    echo -e "${RED}Operation cancelled.${NC}"
  fi
}

while true; do
  print_header
  echo -e "${YELLOW}Select an option:${NC}"
  echo -e " ${GREEN}1)${NC} Create Script"
  echo -e " ${GREEN}2)${NC} Debug Script"
  echo -e " ${GREEN}3)${NC} List Scripts"
  echo -e " ${GREEN}4)${NC} Run a Script"
  echo -e " ${GREEN}5)${NC} Edit a Script"
  echo -e " ${GREEN}6)${NC} Backup Scripts"
  echo -e " ${GREEN}7)${NC} Delete a Script"
  echo -e " ${GREEN}8)${NC} Clear screen"
  echo -e " ${GREEN}0)${NC} Exit\n"

  read -p "> " TOOL_OPTION

  case "${TOOL_OPTION}" in
  1)
    confirmation "Are you sure you want to create a script?(yes/y)" "${scripts_sources[create]}"
    ;;
  2)
    confirmation "Are you sure you want to debug a script?(yes/y)" "${scripts_sources[debug]}"
    ;;
  3)
    echo -e "${CYAN}Listing scripts in ${PWD}:${NC}"
    ls -1 ./*.sh
    ;;
  4)
    confirmation "Do you want to run a script?(yes/y)" "${scripts_sources[run]}"
    ;;
  5)
    confirmation "Do you want to edit a script?(yes/y)" "${scripts_sources[edit]}"
    ;;
  6)
    confirmation "Do you want to backup scripts?(yes/y)" "${scripts_sources[backup]}"
    ;;
  7)
    confirmation "Are you sure you want to delete a script?(yes/y)" "${scripts_sources[delete]}"
    ;;
  8)
    clear
    ;;
  0)
    echo -e "${GREEN}Goodbye!${NC}"
    break
    ;;
  *)
    echo -e "${RED}Invalid selection, please try again.${NC}"
    ;;
  esac

done
