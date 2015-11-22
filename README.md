# Prolusion

From Latin prolusio(n- ), from prolus- ‘practised beforehand’, from the verb proludere, from pro ‘before’ + ludere ‘to play’.

## Prerequisites

    $ brew install curl
    $ brew install gpg
    $ brew install git
    $ brew install emacs --use-git-head --cocoa
    $ brew install cmake
    $ brew install ninja
    $ brew install llvm --with-clang
    $ brew install the_silver_searcher

## Installation

    $ curl -L https://raw.github.com/jwintz/prolusion/master/prolusion.sh | sh

## Builtins

...

## Additions

...

## Upgrades

Here is how to stay on the cutting edge.

### Emacs

    $ brew install emacs --use-git-head --cocoa

### Prolusion

    $ cd ~/.prolusion.d
    $ git pull origin master

### Prolusion packages

    M-x prolusion-upgrade-packages
