#!/bin/bash

echo -e "\n[JAVASRIPT PACKAGE]"

app=(
    commitizen
)

echo "install app..."
sudo yarn global add ${app[@]}