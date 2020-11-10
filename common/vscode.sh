#!/bin/bash

echo -e "\n[VSCODE SETTINGS]"

#
# $1 = path codium binary
# $2 = path codium settings
#

if [[ $# != 2 ]]; then
    echo "missing path codium binary or path settings..."
    exit 0
fi

echo "link settings vscode..."
mkdir -p $2
rm -rf $2/User/
ln -s $(pwd)/settings/vscode/User $2/User

echo "install extensions..."
$(cat $(pwd)/settings/vscode/extensions.txt | xargs -L 1 echo $2 --install-extension)
