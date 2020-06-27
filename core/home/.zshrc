#--------------------------------------------
#   oh-my-zsh settings
#--------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
    git
    python
    django
    docker
    npm
)

source $ZSH/oh-my-zsh.sh
setopt shwordsplit

alias valgrind-flags="valgrind --tool=memcheck --leak-check=full"
alias open="xdg-open"

alias key_tablet="sh $HOME/scripts/Huion_WH1409.sh"
MANPATH=/usr/share/man


# git ignore
function gi() {
    curl -sLw "\n" https://www.gitignore.io/api/$@ ;
}
