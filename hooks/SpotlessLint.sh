#!/usr/bin/env bash
set -eu
COLOR_GREEN='\033[1;32m'
COLOR_OFF='\033[0m'
DONE=0

if [[ -f "mvnw" ]] && [[ -x "mvnw" ]]; then
    ./mvnw spotless:apply --batch-mode --quiet >/dev/null 2>&1
    DONE=1
fi

if [[ -x "$(command -v mvn)" ]]; then
    if [[ "${DONE}" -ne 1 ]]; then
        mvn spotless:apply --batch-mode --quiet >/dev/null 2>&1
        DONE=1
    fi
else
    echo "ERROR: Maven is not installed in your system."
    exit 1
fi

echo -e "\n${COLOR_GREEN}Files successfully reformatted.\nPlease run git add and commit once again to commit your code.${COLOR_OFF}"
exit 0
