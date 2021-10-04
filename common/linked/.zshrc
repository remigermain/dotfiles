#--------------------------------------------
#   oh-my-zsh settings
#--------------------------------------------
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$(yarn global bin)"
source $HOME/.extra.zshrc
export PATH=$PATH:$APP_PATH:$BIN_PATH:"$HOME/.local/bin"

ZSH_THEME="agnoster"
plugins=(
    git
    python
    docker
    npm
	  yarn
)

source $ZSH/oh-my-zsh.sh
setopt shwordsplit

alias vgf="valgrind --tool=memcheck --leak-check=full"
alias open="xdg-open"
alias python="python3"

MANPATH=/usr/share/man

function backup() {
	$SCRIPTS_PATH/backup.sh
}

function full-upgrade() {
	sudo dnf upgrade $1
    flatpak upgrade $1
    sudo snap refresh $1
    pip install --upgrade pip
    pipx upgrade-all $1
    yarn global upgrade-interactive $1
}

# active last session tmux
# tmux ls &>/dev/null
# if [[ $? == 0 ]]; then
# 	tmux attach-session -t $(echo "1 - $(tmux ls | wc -l)" | bc) &>/dev/null
# else
# 	tmux &>/dev/null
# fi

############################################
###       multimedia
############################################

function ydl () {
	sudo ytmdl $1 --ignore-errors --on-meta-error skip --level DEBUG --nolocal
}

function ytdl () {
    PWD=$(pwd)
	cd $HOME/Music && youtube-dl --ignore-error --embed-thumbnail -x --audio-format mp3 --audio-quality 0 --metadata-from-title "%(artist)s - %(title)s" $@
	cd $PWD
}

############################################
###       docker
############################################
function dps () {
	docker ps -a
}

# docker
function dcps () {
	docker-compose ps -a
}

function dfclean () {
	echo "clean image..."
	docker image rm -f $(sudo docker images -q) 1&>/dev/null
	echo "clean volume..."
	docker volume prune -f 1&>/dev/null
	echo "clean system..."
	docker system prune -f 1&>/dev/null
}

############################################
###       utils
############################################

function fram () {
	sync
	# Clear PageCache, dentries and inodes.
	echo 3 > /proc/sys/vm/drop_caches 
	sudo swapoff -a
	sudo swapon -a
}

# git ignore
function gi() { 
    [ $# -lt 1 ] && echo "error need more than 1 arguments\nexit..." && return 1
    resp=$(curl -L -s -w "%{response_code}" -o "$(pwd)/.gitignore" https://www.toptal.com/developers/gitignore/api/$1)
    if [[ $resp != "200" ]]; then
      msg=$(cat .gitignore | grep "#\!! ERROR" | sed "s/\(#\!\! \)\|\( \!\!#\)//g" )
      rm -rf .gitignore
      echo "$msg\nexit..."
      return 1
    fi
    echo ".gitignore created!"
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

function genv() {
	python3 "$SCRIPTS_PATH/generate_env.py" $@
}

#utils
function tolower() {
 maj='ABCDEFGHIJQLMNOPQRSTUVWXYZ'
 min='abcdefghijklmnopqrstuvwxyz'
 from=$maj; to=$min
 lst=$@
 if [[ $1 == "-r" ]]; then
   from=$min; to=$maj
   lst=${@:2}
 fi
 [[ ${#lst} == 0 ]] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
 
 for val in "$lst"; do
    echo $val | tr $from $to
  done
}

function toupper () {
  tolower -r $@
}

function check-base() {
 [ $# -ne 2 ] && echo -e "need 2 arguments, <base> <values>\nexit..." && return 1
 av="0123456789abcdef"
 base=$1
 result=$(echo $2 | sed "s/[${av:0:$base}]//g")
 return ${#result}
}

function padding-bits()
{
    how_many_bits=$1
    number=$2
    zeros=$(echo "$how_many_bits - ${#number}" | bc )
    s=""
    for ((i=0;i<$zeros;i++)); do
        s=$(echo "0$s")
    done
    echo "$s$number"
}

function base-conv () {

 [ $# -lt 3 ] && echo -e "need more than 3 arguments, <input-base> <output-base> <values ....>\nexit..." && return 1
 IBASE=$1
 OBASE=$2
 error=0

 for nb in "${@:3}"; do
   check-base $IBASE $nb
   if [ $? -eq 0 ]; then
      value=$(toupper $nb)
      ret=$(echo "obase=$OBASE; ibase=$IBASE; $value" | bc)
      if [[ $OBASE == "2" ]]; then
        ret=$(padding-bits 8 $ret)
      fi
      echo $ret
   else
      error=1
      echo "wrong input from base $IBASE \"$nb\""
   fi
 done
 return $error
}
# hexa
function hex2dec () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "16" "10" $(tolower $@)
}
function hex2oct () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "16" "8" $(tolower $@)
}
function hex2bin () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "16" "2" $(tolower $@)
}

# decinmal
function dec2hex () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "10" "16" $@
}
function dec2oct () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "10" "8" $@
}
function dec2bin () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "10" "2" $@
}

#oct
function oct2hex () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "8" "16" $@
}
function oct2dec () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "8" "10" $@
}
function oct2bin () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "8" "2" $@
}

#bin
function bin2hex () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "2" "16" $@
}
function bin2dec () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "2" "10" $@
}
function bin2oct () {
 [ $# -lt 1 ] && echo -e "need more than 1 arguments, <values ....>\nexit..." && return 1
  base-conv "2" "8" $@
}


function bin2asc() {
  lsti=1
  for i in ${@}; do
    case $i in
        "-h" | "--help")
          echo "asc-bin [options] <values ....>\n-s, --space : values is separerate by space\n-d, --dot : value is separerate by dot"
          return 0
        ;;
        "-s" | "--space")
        space=true
        ;;
        "-d" | "--dot")
        dot=true
        ;;
        *)
        break
        ;;
    esac
    ((lsti++))
  done
  lst=${@:$lsti}
  [ ${#lst[@]} -lt 1 ] && echo -e "need more than 1 arguments, [options] <values ....>\nexit..." && return 1

  for val in ${lst[@]}; do
      s=""
      for (( i = 0 ; i < ${#val} ; i += 8 )); do
        ret=$(bin2dec ${val:$i:8})
        [ $? -ne 0 ] && echo $v && return 1
        s=$(echo -n -e "$s\\x$(dec2hex $ret)")
        if [[ $dot == true ]]; then
          [[ $ret[9] != '.' ]] && echo "values need to be separateby <dot>\nexit.." && return 1
          ((i++))
        elif [[ $space == true ]]; then
          [[ $ret[9] != ' ' ]] && echo "values need to be separate by <space>\nexit.." && return 1
          ((i++))
        fi
      done
      echo $s
  done
}


function asc2bin () {

  lsti=1
  for i in ${@}; do
    case $i in
        "-h" | "--help")
          echo "asc-bin [options] <values ....>\n-s, --space : add space betwen each character\n-d, --dot : add dot betwen each character"
          return 0
        ;;
        "-s" | "--space")
        space=true
        ;;
        "-d" | "--dot")
        dot=true
        ;;
        *)
        break
        ;;
    esac
    ((lsti++))
  done

  lst=${@:$lsti}
  
  [ ${#lst[@]} -lt 1 ] && echo -e "need more than 1 arguments, [options] <values ....>\nexit..." && return 1
  for val in "${lst[@]}"; do
    s=""
    for (( i = 0 ; i < ${#val} ; i++ )); do
        ret=($(ascii -t "${val:$i:1}"))
        s=$(echo $s${ret[4]})
        if [[ $space == true ]]; then
            s=$(echo "$s ")
        elif [[ $dot == true ]]; then
            s=$(echo "$s.")
        fi
    done
    echo $s
  done
}
