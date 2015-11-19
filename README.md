# Prolusion

From Latin prolusio(n- ), from prolus- ‘practised beforehand’, from the verb proludere, from pro ‘before’ + ludere ‘to play’.

## Beforehand

You may want to install the Inconsolata font that is shipped with prolusion (see `prolusion-fonts`) folder.

I also advise you to change the behaviour of the useless CapsLock key to perform as the control key, or use a Happy Hacker Keyboard.

## Prerequisites

    $ brew install gpg
    $ brew install curl
    $ brew install git
    $ brew install emacs --HEAD --cocoa
    $ brew install cmake
    $ brew install ninja
    $ brew installl llvm --with-clang
    $ brew install the_silver_searcher

## Installation

    $ curl -L https://raw.github.com/jwintz/prolusion/master/prolusion.sh | sh

## 3rd party packages

* `dimish`
* `whitespace`
* `smartparens-config`
* `guide-key`
* `helm`
* `helm-ag`
* `helm-dash`

## Afterhand

You may want to change your identity. To do so, open the `init.el` file and change the `prolusion-user` and the `prolusion-mail` variables.
