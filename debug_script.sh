#!/usr/bin/env bash

echo Specify name/path of script to debug
read SCRIPT_PATH

if [[ -d "${SCRIPT_PATH}" ]]; then
  echo "filepath specified ${SCRIPT_PATH} is that of a directory, please try again later"
  exit 1
fi

if ! [[ -f "${SCRIPT_PATH}" ]]; then
  echo "filepath specified ${SCRIPT_PATH} is not correct. please try again later."
  exit 1
fi

PS4='<DEBUG>:  ' bash -x "${SCRIPT_PATH}"

echo "Debugging of ${SCRIPT_PATH} is complete "
