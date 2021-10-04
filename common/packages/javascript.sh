#!/bin/bash

#*******************************
#          javascript
#*******************************

cd $(dirname $0)
source ../linked/.extra.zshrc

echo -e "\n[$(color-blue install javascript packages)]"

app=(
    commitizen
    husky
)

echo "install packages..."
sudo yarn global add ${app[@]}