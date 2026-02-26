#!/usr/bin/env bash

declare -A scripts_sources=(
  [create]=./create-script.sh
  [debug]=./debug_script.sh
  [delete]=./delete_script.sh
  [run]=./run_script.sh
  [edit]=./edit_script.sh
  [backup]=./backup_script.sh
)

while true; do
  echo
  echo "=== Bash Script Toolbox ==="
  echo "Select an option:"
  echo " 1) Create Script"
  echo " 2) Debug Script"
  echo " 3) List scripts"
  echo " 4) Run a script"
  echo " 5) Edit a script"
  echo " 6) Backup scripts"
  echo " 7) Delete a Script"
  echo " 8) clear "
  echo " 0) Exit"
  echo

  #SCRIPTS TO ADD TO THIS TOOKIT
  #3.LISTING OF SCRIPTS
  #4.RUNNING SCRIPT
  #5.EDIT SCRIPT
  #6.BACKUP SCRIPT
  #7,DELETE SCRIPT

  read TOOL_OPTION

  confirmation() {

    PROMPT=$1
    SCRIPT=$2

    read -p "${PROMPT} (yes/y to confirm): " ANSWER

    if [[ "${ANSWER,,}" == "yes" || "${ANSWER}" == "y" ]]; then
      sleep 1

      "${SCRIPT}"
    fi

  }

  case "${TOOL_OPTION}" in
  1) # Creating Scripts
    confirmation "Are You sure You want to create a Script? " "${scripts_sources[create]}"
    ;;
  2) # Debugging Script
    confirmation "Are You sure You want to debug a Script? " "${scripts_sources[debug]}"
    ;;

  3) # Listing Scripts
    echo "Listing scripts in the current directory $PWD"
    ls -1 ./*.sh
    ;;

  4) # Runing Script
    confirmation "Do you sure you want to run a script? " "${scripts_sources[run]}"
    ;;

  5) # Editing Script
    confirmation "Do you want to edit a script? " "${scripts_sources[edit]}"
    ;;

  6)
    confirmation "Do You want to do a backup? " "${scripts_sources[backup]}"
    ;;

  7) # Deleting a Script
    confirmation "Are you sure You want to delete a Script? " "${scripts_sources[delete]}"
    ;;
  8)
    clear
    ;;
  0)
    echo "Exiting toolbox........"
    break
    ;;

  *)
    echo character selected for script tool is invalid
    ;;
  esac

done
