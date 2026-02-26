#!/usr/bin/env bash

read -p "Specify Path of Script to be deleted: " SCRIPT_PATH

if [[ -d "${SCRIPT_PATH}" ]]; then
  echo "Path ${SCRIPT_PATH} Specified is a directory . Please try specify a file ."
  exit
fi

if ! [[ -f "${SCRIPT_PATH}" ]]; then
  echo "Path Specified ${SCRIPT_PATH} is invalid"
  exit
fi

echo "Deleting Script ${SCRIPT_PATH}"

rm "${SCRIPT_PATH}"
