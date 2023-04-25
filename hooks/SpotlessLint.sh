#!/usr/bin/env bash
set -eu

if [[ -f "mvnw" ]] && [[ -x "mvnw" ]]; then
    ./mvnw spotless:apply --batch-mode --quiet
    echo -ne "\nFiles successfully reformatted.\nPlease run git add and commit once again to commit your code."
    exit 0
fi

if [[ -x "$(command -v mvn)" ]]; then
    mvn spotless:apply --batch-mode --quiet
    echo -ne "\nFiles successfully reformatted.\nPlease run git add and commit once again to commit your code."
    exit 0
else
    echo "ERROR: Maven is not installed in your system."
    exit 1
fi
