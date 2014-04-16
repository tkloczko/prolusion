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

    prolusion_yellow "Cloning the Protection's GitHub repository..."

    /usr/bin/env git clone $PROTECTION_URL "$PROTECTION_INSTALL_DIR" > /dev/null

    prolusion_yellow "Cloning the Prolusion's GitHub repository..."

    /usr/bin/env git clone $PROLUSION_URL "$PROLUSION_INSTALL_DIR" > /dev/null

    prolusion_yellow "Setting up links ..."

    ln -s $PROLUSION_INSTALL_DIR $HOME/.emacs.d

    prolusion_yellow "Fetching mail ..."

    offlineimap -c $PROLUSION_INSTALL_DIR/prolusion-mail/prolusion-mail.rc

    prolusion_yellow "Indexing mail ..."

    mu index --maildir=$HOME/.prolusion.d/prolusion-mail

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

PROTECTION_URL="https://github.com/jwintz/protection.git"
PROTECTION_INSTALL_DIR="$HOME/.password-store"

PROLUSION_URL="https://github.com/jwintz/prolusion.git"
PROLUSION_INSTALL_DIR="$HOME/.prolusion.d"

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

prolusion_cyan "Checking to see if offlineimap is installed..."
if hash offlineimap 2>&-
then
    prolusion_green "found."
else
    prolusion_red "not found. Aborting installation!!"
    exit 1
fi

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
