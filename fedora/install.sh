#!/bin/bash

cd $(dirname "$0")
source ../common/linked/.extra.zshrc

echo -e "\n[install for $(color-blue fedora)]"

./packages.sh
../common/gnome.sh "dnf install -y" "dnf autoremove -y"
../common/install.sh
