#!/bin/bash

echo "backup..."

cd $DOTFILE_PATH
$(which codium) --list-extensions > ./common/linked/codium/extensions.txt

LINE=$(git status -s | wc -l)
if [ $LINE -gt 0 ]; then
    MSG="[$(date +%d-%m-%Y)]- Backup"
    git add .
    git commit -m "$MSG"
    git push
    echo $MSG
else
    echo "no change found..."
fi
