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

MANPATH=/usr/share/man

# active last session tmux
tmux ls &>/dev/null
if [[ $? == 0 ]]; then
	tmux attach-session -t $(echo "1 - $(tmux ls | wc -l)" | bc) &>/dev/null
else
	tmux &>/dev/null
fi

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

function ydl () {
	youtube-dl -o  "$HOME/youtube-dl/%(artist)s-%(track)s.%(ext)s"  --extract-audio --audio-format best "$@"
}

# docker
function dps () {
	docker ps -a
}

function dfclean () {
	echo "clean image..."
	docker image rm -f $(sudo docker images -q) 1&>/dev/null
	echo "clean volume..."
	docker volume prune -f 1&>/dev/null
	echo "clean system..."
	docker system prune -f 1&>/dev/null
}

function fram () {
	sync
	# Clear PageCache, dentries and inodes.
	echo 3 > /proc/sys/vm/drop_caches 
	sudo swapoff -a
	sudo swapon -a
}
