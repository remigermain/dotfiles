#!/bin/bash

#*******************************
#          variables
#*******************************

export BASE_DIR_PATH="$HOME/.myconfig"
export APP_PATH="$BASE_DIR_PATH/app"
export BIN_PATH="$BASE_DIR_PATH/bin"
export SCRIPTS_PATH="$BASE_DIR_PATH/scripts"
export WORKSPACES_PATH="$HOME/workspaces"
export DOTFILE_PATH="$WORKSPACES_PATH/dotfiles"

function color-format () {
    echo -e "\u001B[$1m${@:3}\u001B[$2m"
}

function color-reset () {
    color-format 0 0 $@
}
function color-bold () {
    color-format 1 22 $@
}
function color-dim () {
    color-format 2 22 $@
}
function color-italic () {
    color-format 3 23 $@
}
function color-underline () {
    color-format 4 24 $@
}
function color-overline () {
    color-format 53 55 $@
}
function color-inverse () {
    color-format 7 27 $@
}
function color-hidden () {
    color-format 8 28 $@
}
function color-strikethrough () {
    color-format 9 29 $@
}
function color-black () {
    color-format 30 39 $@
}
function color-red () {
    color-format 31 39 $@
}
function color-green () {
    color-format 32 39 $@
}
function color-yellow () {
    color-format 33 39 $@
}
function color-blue () {
    color-format 34 39 $@
}
function color-magenta () {
    color-format 35 39 $@
}
function color-cyan () {
    color-format 36 39 $@
}
function color-white () {
    color-format 37 39 $@
}
function color-gray () {
    color-format 90 39 $@
}
function color-bgBlack () {
    color-format 40 49 $@
}
function color-bgRed () {
    color-format 41 49 $@
}
function color-bgGreen () {
    color-format 42 49 $@
}
function color-bgYellow () {
    color-format 43 49 $@
}
function color-bgBlue () {
    color-format 44 49 $@
}
function color-bgMagenta () {
    color-format 45 49 $@
}
function color-bgCyan () {
    color-format 46 49 $@
}
function color-bgWhite () {
    color-format 47 49 $@
}
function color-bgGray () {
    color-format 100 49 $@
}