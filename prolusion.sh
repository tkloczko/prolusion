#!/bin/bash

# prolusion.sh ---
#
# Author: Julien Wintz
# Created: Thu Feb 20 10:41:34 2014 (+0100)
# Version:
# Last-Updated:
#           By:
#     Update #: 340
#

# Change Log:
#
#

## #################################################################
## Helper functions
## #################################################################

prolusion_colortext () {
    echo "[38;5;$2m$1[0m"
}

prolusion_green () {
    echo $(prolusion_colortext "$1" "82")
}

prolusion_red () {
    echo $(prolusion_colortext "$1" "196")
}

prolusion_blue () {
    echo $(prolusion_colortext "$1" "27")
}

prolusion_purple () {
    echo $(prolusion_colortext "$1" "141")
}

prolusion_yellow () {
    echo $(prolusion_colortext "$1" "190")
}

prolusion_cyan () {
    echo $(prolusion_colortext "$1" "45")
}

prolusion_clear () {
    echo "$1"
}

prolusion_install () {

    prolusion_yellow "Cloning the Prolusion GitHub repository..."

    /usr/bin/env git clone $PROLUSION_URL "$PROLUSION_INSTALL_DIR" > /dev/null

    # prolusion_yellow "Cloning the Irony GitHub repository..."

    # /usr/bin/env git clone --recursive $IRONY_URL "$IRONY_INSTALL_DIR" > /dev/null

    # cd $IRONY_INSTALL_DIR
    # mkdir build
    # cd build
    # cmake ../server
    # make
    # make install
    # cd $HOME

    prolusion_yellow "Setting up links ..."

    /usr/bin/env ln -s $PROLUSION_INSTALL_DIR $HOME/.emacs.d

    if ! [ $? -eq 0 ]
    then
        prolusion_red "A fatal error occurred during Prolusion's installation. Aborting..."
        exit 1
    fi
}

prolusion_usage() {
    prolusion_clear "Usage: $0 [OPTION]"
    prolusion_clear "  -h, --help \t \t \t Display this help and exit"
    prolusion_clear ""
}

## #################################################################
## Command line options
## #################################################################

while [ $# -gt 0 ]
do
    case $1 in
        -h | --help)
            prolusion_usage
            exit 0
            ;;
        *)
            prolusion_red "Unkown option: $1"
            shift 1
            ;;
    esac
done

## #################################################################
## Behavior
## #################################################################

PROLUSION_URL="https://github.com/jwintz/prolusion.git"
PROLUSION_INSTALL_DIR="$HOME/.prolusion.d"

IRONY_URL="https://github.com/Sarcasm/irony-mode.git"
IRONY_INSTALL_DIR="$PROLUSION_INSTALL_DIR/prolusion-irony"

if [ -d "$PROLUSION_INSTALL_DIR" ]
then
    prolusion_red   "You already have Prolusion installed."
    prolusion_clear "You'll need to remove $PROLUSION_INSTALL_DIR if you want to install Prolusion again."
    prolusion_clear "If you want to update your copy of prolusion, run 'git pull origin master' from your prolusion directory"
    exit 1;
fi

prolusion_cyan "Checking to see if git is installed..."
if hash git 2>&-
then
    prolusion_green "found."
else
    prolusion_red "not found. Aborting installation!"
    exit 1
fi;

prolusion_cyan "Checking to see if emacs is installed..."
if hash emacs 2>&-
then
    prolusion_green "found."
else
    prolusion_red "not found. Aborting installation!"
    exit 1
fi;

prolusion_cyan "Checking to see if cmake is installed..."
if hash cmake 2>&-
then
    prolusion_green "found."
else
    prolusion_red "not found. Aborting installation!"
    exit 1
fi;

prolusion_cyan "Checking to see if clang is installed..."
if hash clang 2>&-
then
    prolusion_green "found."
else
    prolusion_red "not found. Aborting installation!"
    exit 1
fi;

prolusion_install

prolusion_purple " ______          _           _              "
prolusion_purple " | ___ \        | |         (_)             "
prolusion_purple " | |_/ / __ ___ | |_   _ ___ _  ___  _ __   "
prolusion_purple " |  __/ '__/ _ \| | | | / __| |/ _ \| '_ \  "
prolusion_purple " | |  | | | (_) | | |_| \__ \ | (_) | | | | "
prolusion_purple " \_|  |_|  \___/|_|\__,_|___/_|\___/|_| |_| "
prolusion_purple ""
prolusion_green  "... is now installed and ready to do thy bidding, Master $USER!"
prolusion_clear  ""
