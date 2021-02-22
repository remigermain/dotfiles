#!/bin/bash

echo -e "\n[PYTHON PACKAGE]"

app=(
    regex
    Xlib
    ytmdl
)

echo "install app..."
pip install ${app[@]}

echo "install linter..."
pip install -r "../tools/python3_linter.txt"
