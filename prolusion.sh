# prolusion.sh ---
#
# Author: Julien Wintz
# Created: Thu Feb 20 10:41:34 2014 (+0100)
# Version:
# Last-Updated:
#           By:
#     Update #: 80
#

# Change Log:
#
#

## #################################################################
## Helper functions
## #################################################################

prolusion_colors () {

      RESET = '\e[0m'
        RED = '\e[0;31m' # Red
      GREEN = '\e[0;32m' # Green
     YELLOW = '\e[0;33m' # Yellow
       BLUE = '\e[0;34m' # Blue
     PURPLE = '\e[0;35m' # Purple
       CYAN = '\e[0;36m' # Cyan
      WHITE = '\e[0;37m' # White
       BRED = '\e[1;31m' # Bold Red
     BGREEN = '\e[1;32m' # Bold Green
    BYELLOW = '\e[1;33m' # Bold Yellow
      BBLUE = '\e[1;34m' # Bold Blue
    BPURPLE = '\e[1;35m' # Bold Purple
      BCYAN = '\e[1;36m' # Bold Cyan
     BWHITE = '\e[1;37m' # Bold White
}

prolusion_install () {

    printf "$YELLOW Cloning the Prolusion's GitHub repository...\n$RESET"

    /usr/bin/env git clone $PROLUSION_URL "$PROLUSION_INSTALL_DIR" > /dev/null

    printf "$YELLOW Setting up links ...\n$RESET"

    ln -s prolusionrc   $HOME/.prolusionrc
    ln -s prolusion.py  $HOME/.prolusion.py
    ln -s prolusion.gpg $HOME/.prolusion.gpg

    printf "$YELLOW Fetching mail ...\n$RESET"

    offlineimap -c $HOME/.prolusionrc

    if ! [ $? -eq 0 ]
    then
        printf "$RED A fatal error occurred during Prolusion's installation. Aborting..."
        exit 1
    fi
}

prolusion_usage() {

    printf "Usage: $0 [OPTION]\n"
    printf "  -h, --help \t \t \t Display this help and exit\n"
    printf "\n"
}

## #################################################################
## Command line options
## #################################################################

while [ $# -gt 0 ]
do
    case $1 in
        -h | --help)
            usage
            exit 0
            ;;
        *)
            printf "Unkown option: $1\n"
            shift 1
            ;;
    esac
done

## #################################################################
## Behavior
## #################################################################

prolusion_colors

PROLUSION_URL="https://github.com/jwintz/prolusion.git"
PROLUSION_INSTALL_DIR="$HOME/.prolusion.d"

printf "$BYELLOW"
printf "PROLUSION_INSTALL_DIR = $PROLUSION_INSTALL_DIR\n"
printf "PROLUSION_SOURCE_URL  = $PROLUSION_URL\n"
printf "$RESET"

if [ -d "$PROLUSION_INSTALL_DIR" ]
then
    printf "\n\n$BRED"
    printf "You already have Prolusion installed.$RESET\nYou'll need to remove $PROLUSION_INSTALL_DIR/prolusion if you want to install Prolusion again.\n"
    printf "If you want to update your copy of prolusion, run 'git pull origin master' from your prolusion directory\n\n"
    exit 1;
fi

printf  "$CYAN Checking to see if git is installed... $RESET"
if hash git 2>&-
then
    printf "$GREEN found.$RESET\n"
else
    printf "$RED not found. Aborting installation!$RESET\n"
    exit 1
fi;

printf  "$CYAN Checking to see if offlineimap is installed... "
if hash offlineimap 2>&-
then
    printf "$GREEN found.$RESET\n"
else
    printf "$RED not found. Aborting installation!!$RESET\n"
    exit 1
fi

prolusion_install

printf "$BPURPLE ______          _           _              \n"
printf "$BPURPLE | ___ \        | |         (_)             \n"
printf "$BPURPLE | |_/ / __ ___ | |_   _ ___ _  ___  _ __   \n"
printf "$BPURPLE |  __/ '__/ _ \| | | | / __| |/ _ \| '_ \  \n"
printf "$BPURPLE | |  | | | (_) | | |_| \__ \ | (_) | | | | \n"
printf "$BPURPLE \_|  |_|  \___/|_|\__,_|___/_|\___/|_| |_| \n\n"
printf "$GREEN ... is now installed and ready to do thy bidding, Master $USER!$RESET\n"
