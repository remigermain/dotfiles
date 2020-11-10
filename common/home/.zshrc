#--------------------------------------------
#   oh-my-zsh settings
#--------------------------------------------
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:$HOME/app/bin
export PATH="$PATH:$(yarn global bin)"

ZSH_THEME="agnoster"
plugins=(
    git
    python
    django
    docker
    npm
	yarn
)

source $ZSH/oh-my-zsh.sh
setopt shwordsplit

alias valgrind-flags="valgrind --tool=memcheck --leak-check=full"
alias open="xdg-open"
alias python="python3"
alias py="python3"

alias key_tablet="sh $HOME/scripts/Huion_WH1409.sh"
MANPATH=/usr/share/man

#if [ -z $TMUX ];
#then
#	tmux;
#fi

# git ignore
function gi() {
    curl -sLw "\n" https://www.gitignore.io/api/$@ > "$(pwd)/.gitignore"
}

# source venv
function venv() {
	source ./venv/bin/activate
}

# create venv
function cvenv() {
	python3 -m venv venv
	source ./venv/bin/activate
	pip install --upgrade pip
	deactivate
}

function you-dl () {
	youtube-dl -o  "$HOME/youtube-dl/%(artist)s-%(track)s.%(ext)s"  --extract-audio --audio-format best "$@"
}

# docker
function dps () {
	sudo docker ps -a
}

function dfclean () {
	echo "clean image..."
	sudo docker image rm -f $(sudo docker images -q) 1&>/dev/null
	echo "clean volume..."
	sudo docker volume prune -f 1&>/dev/null
	echo "clean system..."
	sudo docker system prune -f 1&>/dev/null
}

function fram () {
	sync
	# Clear PageCache, dentries and inodes.
	echo 3 > /proc/sys/vm/drop_caches 
	sudo swapoff -a
	sudo swapon -a
}
