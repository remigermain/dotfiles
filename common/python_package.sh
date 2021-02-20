#!/bin/bash

echo -e "\n[PYTHON PACKAGE]"

app=(
    regex
    Xlib
    ytmdl
)

echo "install app..."
pip install ${app[@]}
