#!/usr/bin/env bash

set -e

cd "$(dirname "$0")" || exit

while read -r ext; do
    code --install-extension "$ext"
done < ./vscode_extensions.txt
