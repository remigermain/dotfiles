#!/bin/bash

echo -e "\n[PYTHON PACKAGE]"

app=(
    regex
    Xlib
)

echo "install app..."
pip install ${app[@]}