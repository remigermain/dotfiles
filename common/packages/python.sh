#!/bin/bash

#*******************************#
#          python
#*******************************#


cd $(dirname $0)
source ../linked/.extra.zshrc

echo -e "\n[$(color-blue install python packages)]"

app=(
    regex
    Xlib
    ytmdl
    pip-review
    
    pycodestyle
    black
    pylint
    pep8
    flake8

)

echo "upgrade pip..."
pip install --upgrade pip

echo "install pipx..."
pip install pipx --user
python -m pipx install ensurepath

echo "install packages..."
python -m pipx install ${app[@]}

eval "$(register-python-argcomplete pipx)"
