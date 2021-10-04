#!/bin/bash

#*******************************
#          flatpak
#*******************************

cd $(dirname "$0")
source ../linked/.extra.zshrc

echo -e "\n[$(color-blue install utils packages)]"


echo "install arduino-cli..."
cd $(dirname $BIN_PATH)
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh  | bash
