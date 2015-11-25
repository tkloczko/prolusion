# Prolusion

From Latin prolusio(n- ), from prolus- ‘practised beforehand’, from
the verb proludere, from pro ‘before’ + ludere ‘to play’.

Prolusion is meant to be as light a possible, and is completely
tweaked towards my own use of emacs. For those who are looking for a
more polished configuration kit, I can only recommand
[Prelude](https://github.com/bbatsov/prelude) or
[Spacemacs](https://github.com/syl20bnr/spacemacs).

Prolusion is organized as a set layers, each of which is organized as
follows:
* requirements
* setup
* functions
* hooks
* modeline
* keybindings

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

## Upgrade

### Emacs

    $ brew   install emacs --use-git-head --cocoa # if emacs is not installed
    $ brew reinstall emacs --use-git-head --cocoa # if emacs is     installed

### Emacs configuration

    ~/.prolusion.d $ git pull origin master

### Emacs packages

    M-x prolusion-upgrade-packages

## Bindings

### prolusion-packages

| Keybinding           | Function                   |
| -------------------- | -------------------------- |
| <kbd>`C-c p l`</kbd> | package-list-package       |
| <kbd>`C-c p r`</kbd> | package-refresh-contents   |
| <kbd>`C-c p u`</kbd> | prolusion-upgrade-packages |

### prolusion-behavior

| Keybinding         | Function          |
| ------------------ | ----------------- |
| <kbd>`C-x o`</kbd> | `other-window`    |
| <kbd>`C-x 0`</kbd> | `other-window -1` |

| Keybinding       | Function              |
| ---------------- | --------------------- |
| <kbd>`C-+`</kbd> | `text-scale-increase` |
| <kbd>`C--`</kbd> | `text-scale-decrease` |

### prolusion-builtins

| Keybinding           | Function           |
| -------------------- | ------------------:|
| <kbd>`C-c r c`</kbd> |  `clear-rectangle` |
| <kbd>`C-c r d`</kbd> | `delete-rectangle` |
| <kbd>`C-c r k`</kbd> |   `kill-rectangle` |
| <kbd>`C-c r o`</kbd> |   `open-rectangle` |
| <kbd>`C-c r s`</kbd> | `string-rectangle` |
| <kbd>`C-c r y`</kbd> |   `yank-rectangle` |

### prolusion-editor

| Keybinding           | Function                   |
| -------------------- | -------------------------- |
| <kbd>`C-c e f`</kbd> | `ff-find-other-file`       |
| <kbd>`C-c e f`</kbd> | `make-header`              |
| <kbd>`C-c e f`</kbd> | `make-box-comment`         |
| <kbd>`C-c e f`</kbd> | `make-divider`             |
| <kbd>`C-c e f`</kbd> | `make-revision`            |
| <kbd>`C-c e f`</kbd> | `update-file-header`       |
| <kbd>`C-c e f`</kbd> | `prolusion-duplicate-line` |
| <kbd>`C-c e f`</kbd> | `iedit-mode`               |

| Keybinding       | Function              |
| ---------------- | --------------------- |
| <kbd>`C-+`</kbd> | `text-scale-increase` |
| <kbd>`C--`</kbd> | `text-scale-decrease` |

### prolusion-snippets

| Keybinding           | Function               |
| -------------------- | ---------------------- |
| <kbd>`C-c y n`</kbd> | yas-new-snippet        |
| <kbd>`C-c y s`</kbd> | yas-insert-snippet     |
| <kbd>`C-c y v`</kbd> | yas-visit-snippet-file |

### prolusion-narrowing

| Keybinding           | Function               |
| -------------------- | ---------------------- |
| <kbd>`C-c n a`</kbd> | helm-ag                |
| <kbd>`C-c n d`</kbd> | helm-dash              |
| <kbd>`C-c n m`</kbd> | helm-mini              |
| <kbd>`C-c n c`</kbd> | helm-company           |
| <kbd>`C-c n f`</kbd> | helm-flycheck          |
| <kbd>`C-c n y`</kbd> | helm-yas-complete      |

### prolusion-vc

| Keybinding           | Function                    |
| -------------------- | --------------------------- |
| <kbd>`C-c g m`</kbd> | `magit-status`              |
| <kbd>`C-c g g`</kbd> | `git-gutter::toggle`        |
| <kbd>`C-c g =`</kbd> | `git-gutter::popup-hunk`    |
| <kbd>`C-c g p`</kbd> | `git-gutter::previous-hunk` |
| <kbd>`C-c g n`</kbd> | `git-gutter::next-hunk`     |
| <kbd>`C-c g s`</kbd> | `git-gutter::stage-hunk`    |
| <kbd>`C-c g r`</kbd> | `git-gutter::revert-hunk`   |

## Caveats

Some functionalities are not available in terminal mode. They include:
* test scaling
* fringe indicators
