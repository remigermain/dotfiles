#!/bin/bash

echo -e "[FEDORA]"
cd $(dirname "$0")

./packages.sh
./gnome.sh
./vscode.sh
../common/install.sh
