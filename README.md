# Prolusion

From Latin prolusio(n- ), from prolus- ‘practised beforehand’, from
the verb proludere, from pro ‘before’ + ludere ‘to play’.

Prolusion is meant to be as light a possible, and is completely
tweaked towards my own use of emacs. For those who are looking for a
more polished configuration kit, I can only recommand
[Prelude](https://github.com/bbatsov/prelude) or
[Spacemacs](https://github.com/syl20bnr/spacemacs).

Prolusion is organized as a set of layers, each of which is organized as
follows: requirements, setup, functions, hooks, modeline and
keybindings.

## Prerequisites

    $ brew install curl
    $ brew install gpg
    $ brew install git
    $ brew install emacs --use-git-head --cocoa
    $ brew install cmake
    $ brew install ninja
    $ brew install llvm --with-clang
    $ brew install cscope
    $ brew install the_silver_searcher

## Installation

    $ curl -L https://raw.github.com/jwintz/prolusion/master/prolusion-installer/prolusion-installer.sh | sh

## Upgrade

**Emacs**

    $ brew   install emacs --use-git-head --cocoa # if emacs is not installed
    $ brew reinstall emacs --use-git-head --cocoa # if emacs is     installed

**Emacs prolusion**

    M-x prolusion-upgrade

**Emacs prolusion packages**

    M-x prolusion-upgrade-packages

## Bindings

**prolusion-behavior**

| Keybinding         | Function          |
| ------------------ |:----------------- |
| <kbd>`C-x o`</kbd> | `other-window`    |
| <kbd>`C-x 0`</kbd> | `other-window -1` |

| Keybinding       | Function              |
| ---------------- |:--------------------- |
| <kbd>`C-+`</kbd> | `text-scale-increase` |
| <kbd>`C--`</kbd> | `text-scale-decrease` |

**prolusion-builtins**

| Keybinding           | Function           |
| -------------------- | ------------------:|
| <kbd>`C-c r c`</kbd> |  `clear-rectangle` |
| <kbd>`C-c r d`</kbd> | `delete-rectangle` |
| <kbd>`C-c r k`</kbd> |   `kill-rectangle` |
| <kbd>`C-c r o`</kbd> |   `open-rectangle` |
| <kbd>`C-c r t`</kbd> | `string-rectangle` |
| <kbd>`C-c r y`</kbd> |   `yank-rectangle` |

**prolusion-editor**

| Keybinding           | Function                   |
| -------------------- |:-------------------------- |
| <kbd>`C-c e f`</kbd> | `ff-find-other-file`       |
| <kbd>`C-c e m`</kbd> | `make-header`              |
| <kbd>`C-c e c`</kbd> | `make-box-comment`         |
| <kbd>`C-c e d`</kbd> | `make-divider`             |
| <kbd>`C-c e r`</kbd> | `make-revision`            |
| <kbd>`C-c e g`</kbd> | `update-file-header`       |
| <kbd>`C-c e l`</kbd> | `prolusion-duplicate-line` |
| <kbd>`C-c e e`</kbd> | `iedit-mode`               |

**prolusion-snippets**

| Keybinding           | Function                 |
| -------------------- |:------------------------ |
| <kbd>`C-c y n`</kbd> | `yas-new-snippet`        |
| <kbd>`C-c y s`</kbd> | `yas-insert-snippet`     |
| <kbd>`C-c y v`</kbd> | `yas-visit-snippet-file` |

**prolusion-narrowing**

| Keybinding           | Function            |
| -------------------- |:------------------- |
| <kbd>`C-c n a`</kbd> | `helm-ag`           |
| <kbd>`C-c n d`</kbd> | `helm-dash`         |
| <kbd>`C-c n m`</kbd> | `helm-mini`         |
| <kbd>`C-c n c`</kbd> | `helm-company`      |
| <kbd>`C-c n f`</kbd> | `helm-flycheck`     |
| <kbd>`C-c n y`</kbd> | `helm-yas-complete` |

**prolusion-scoping**

| Keybinding           | Function                                       |
| -------------------- |:---------------------------------------------- |
| <kbd>`C-c s L`</kbd> | `'cscope-create-list-of-files-to-index`        |
| <kbd>`C-c s I`</kbd> | `'cscope-index-files`                          |
| <kbd>`C-c s E`</kbd> | `'cscope-edit-list-of-files-to-index`          |
| <kbd>`C-c s W`</kbd> | `'cscope-tell-user-about-directory`            |
| <kbd>`C-c s S`</kbd> | `'cscope-tell-user-about-directory`            |
| <kbd>`C-c s T`</kbd> | `'cscope-tell-user-about-directory`            |
| <kbd>`C-c s D`</kbd> | `'cscope-dired-directory`                      |

| Keybinding           | Function                                       |
| -------------------- |:---------------------------------------------- |
| <kbd>`C-c s a`</kbd> | `'cscope-set-initial-directory`                |
| <kbd>`C-c s A`</kbd> | `'cscope-unset-initial-directory`              |

| Keybinding           | Function                                       |
| -------------------- |:---------------------------------------------- |
| <kbd>`C-c s s`</kbd> | `'cscope-find-this-symbol`                     |
| <kbd>`C-c s d`</kbd> | `'cscope-find-global-definition`               |
| <kbd>`C-c s g`</kbd> | `'cscope-find-global-definition`               |
| <kbd>`C-c s G`</kbd> | `'cscope-find-global-definition-no-prompting`  |
| <kbd>`C-c s =`</kbd> | `'cscope-find-assignments-to-this-symbol`      |
| <kbd>`C-c s c`</kbd> | `'cscope-find-functions-calling-this-function` |
| <kbd>`C-c s C`</kbd> | `'cscope-find-called-functions`                |
| <kbd>`C-c s t`</kbd> | `'cscope-find-this-text-string`                |
| <kbd>`C-c s e`</kbd> | `'cscope-find-egrep-pattern`                   |
| <kbd>`C-c s f`</kbd> | `'cscope-find-this-file`                       |
| <kbd>`C-c s i`</kbd> | `'cscope-find-files-including-file`            |

| Keybinding           | Function                                       |
| -------------------- |:---------------------------------------------- |
| <kbd>`C-c s b`</kbd> | `'cscope-display-buffer`                       |
| <kbd>`C-c s B`</kbd> | `'cscope-display-buffer-toggle`                |
| <kbd>`C-c s n`</kbd> | `'cscope-history-forward-line-current-result`  |
| <kbd>`C-c s N`</kbd> | `'cscope-history-forward-file-current-result`  |
| <kbd>`C-c s p`</kbd> | `'cscope-history-backward-line-current-result` |
| <kbd>`C-c s P`</kbd> | `'cscope-history-backward-file-current-result` |
| <kbd>`C-c s u`</kbd> | `'cscope-pop-mark`                             |

**prolusion-vc**

| Keybinding           | Function                    |
| -------------------- |:--------------------------- |
| <kbd>`C-c v m`</kbd> | `magi-status`               |
| <kbd>`C-c v g`</kbd> | `git-gutter::toggle`        |
| <kbd>`C-c v =`</kbd> | `git-gutter::popup-hunk`    |
| <kbd>`C-c v p`</kbd> | `git-gutter::previous-hunk` |
| <kbd>`C-c v n`</kbd> | `git-gutter::next-hunk`     |
| <kbd>`C-c v s`</kbd> | `git-gutter::stage-hunk`    |
| <kbd>`C-c v r`</kbd> | `git-gutter::revert-hunk`   |

**prolusion-projectile**

| Keybinding           | Function                                      |
| -------------------- |:--------------------------------------------- |
| <kbd>C-c p h</kbd>   | `helm-projectile`                             |
| <kbd>C-c p a</kbd>   | `helm-projectile-find-other-file`             |
| <kbd>C-c p f</kbd>   | `helm-projectile-find-file`                   |
| <kbd>C-c p F</kbd>   | `helm-projectile-find-file-in-known-projects` |
| <kbd>C-c p g</kbd>   | `helm-projectile-find-file-dwim`              |
| <kbd>C-c p d</kbd>   | `helm-projectile-find-dir`                    |
| <kbd>C-c p p</kbd>   | `helm-projectile-switch-project`              |
| <kbd>C-c p e</kbd>   | `helm-projectile-recentf`                     |
| <kbd>C-c p b</kbd>   | `helm-projectile-switch-to-buffer`            |
| <kbd>C-c p s g</kbd> | `helm-projectile-grep`                        |
| <kbd>C-c p s a</kbd> | `helm-projectile-ack`                         |
| <kbd>C-c p s s</kbd> | `helm-projectile-ag`                          |

## Caveats

Some functionalities are not available in terminal
mode.
* text scaling
* fringe indicators
