#!/usr/bin/env bash

read -p "Specify A file to edit: " SCRIPT_PATH

if [[ -f "${SCRIPT_PATH}" ]]; then
  :
else
  echo "Path Specofied ${SCRIPT_PATH} is invalid"
fi

echo 'what editor do u want to use: '
echo
echo
echo '1) vim '
echo '2) nano'
echo
echo

read EDITOR

select_editor() {

  local editor=$1

  if ! command -v "${editor}" &>/dev/null; then
    echo "${editor} is not installed. Please install or choose another editor."
    exit 1
  fi

  "${editor}" "${SCRIPT_PATH}"

}

case "$EDITOR" in
1)
  select_editor "vim"
  ;;
2)
  select_editor "nano"
  ;;
*)
  echo "Option is invalid. try again later"
  ;;
esac
