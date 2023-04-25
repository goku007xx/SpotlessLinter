#!/usr/bin/env bash
set -eu

if [[ -f "mvnw" ]] && [[ -x "mvnw" ]]; then
    echo "Going to format files local"
    ./mvnw spotless:apply
    echo "INFO: Formatted files local"
    exit 0
fi

if [[ -x "$(command -v mvn)" ]]; then
    echo "Going to format files"
    mvn spotless:apply
    echo "INFO: Formatted files"
    exit 0
else
    echo "ERROR: Maven is not installed in your system."
    exit 1
fi
