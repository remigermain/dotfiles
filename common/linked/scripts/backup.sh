#!/bin/bash

source $HOME/.extra.zshrc
echo $(color-blue "backup...")

cd $DOTFILE_PATH
$(which codium) --list-extensions > ./common/linked/codium/extensions.txt

LINE=$(git status -s | wc -l)
if [ $LINE -gt 0 ]; then
	echo $1
	echo "$1 $([[ $1 != \"-y\" ]] && echo "oui" || echo "non" )"
	if [[ $1 != "-y" ]]; then
		echo -e "the change:"
		git status -s
		read -p "want to continue ? (y/n): " -n 1 yn
		case $yn in
        	"Y" | "y" | "yes")
        	;;
        	"N" | "n" | "no")
            	exit 0
        	;;
        	*)
        	echo "wrong value, only (y/n) accepted"
        	echo "exit..."
        	exit 1
    	    ;;
	    esac

	fi
    MSG="[$(date +%d-%m-%Y)]- Backup"
    git add .
    git commit -m "$MSG"
    git push
    echo $MSG
else
    echo "no change found..."
fi
