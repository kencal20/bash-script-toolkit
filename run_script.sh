#!/usr/bin/env bash

read -p "Specify Path of Script to be run: " SCRIPT_PATH

if [[ -z "${SCRIPT_PATH}" ]]; then
  echo "Input for the file is empty"
  exit
fi

if [[ -f "${SCRIPT_PATH}" ]]; then
  echo "${SCRIPT_PATH} is running .........."
  ./"${SCRIPT_PATH}"
else
  echo "${SCRIPT_PATH} file specified is invalid"
  exit
fi
