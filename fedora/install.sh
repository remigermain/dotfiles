#!/bin/bash

echo -e "[FEDORA]"

cd $(dirname "$0")

./app.sh
./gnome.sh
./vscode.sh
../common/install.sh