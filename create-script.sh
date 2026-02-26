#!/usr/bin/env bash

DIRECTORY_PATH=$(pwd)

read -p 'What name would you like to give the scipt: ' SCRIPT_NAME

if [[ -f "${SCRIPT_NAME}" ]]; then
  echo "Script Exist already try another name "
  exit 1
fi

SCRIPT_PATH=${DIRECTORY_PATH}/${SCRIPT_NAME}

touch "${SCRIPT_PATH}"
chmod u+x "${SCRIPT_PATH}"

echo "#!/usr/bin/env bash" >"${SCRIPT_PATH}"

echo "Script has been created successfully"
echo "The Scripted has been located at ${SCRIPT_PATH}"
