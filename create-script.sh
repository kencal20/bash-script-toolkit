#!/usr/bin/env bash

# color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== Create New Script ===${NC}\n"

DIRECTORY_PATH=$(pwd)

read -p $'Enter name for the new script:\n> ' SCRIPT_NAME

if [[ -f "${SCRIPT_NAME}" ]]; then
  echo -e "${RED}A script with that name already exists. Try another name.${NC}"
  exit 1
fi

SCRIPT_PATH=${DIRECTORY_PATH}/${SCRIPT_NAME}

touch "${SCRIPT_PATH}"
echo "#!/usr/bin/env bash " >${SCRIPT_PATH}
chmod u+x "${SCRIPT_PATH}"

echo -e "${GREEN}Script has been created successfully.${NC}"
echo -e "${YELLOW}Location:${NC} ${SCRIPT_PATH}"
