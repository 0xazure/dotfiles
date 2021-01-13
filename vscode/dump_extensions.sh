#!/usr/bin/env bash

set -e

cd "$(dirname "$0")" || exit

code --list-extensions > ./vscode_extensions.txt
