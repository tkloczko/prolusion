;; Version: $Id$
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tabs
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight current line
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-hl-line-mode +1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Diminish
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'diminish)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Parentheses
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'smartparens)

(require 'smartparens-config)

(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whitespaces
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'whitespace)

(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs empty trailing lines-tail))

(add-hook   'find-file-hook (lambda () (whitespace-mode +1)))
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

(diminish 'whitespace-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global key bindings
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-x O")
   (lambda ()
     (interactive)
     (other-window -1)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global keys guide
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'guide-key)

(setq guide-key/guide-key-sequence
      '("C-x"
	"C-x r"
	"C-x 4"
	"C-x 5"
	"C-x C-g"
	"C-x C-h"
	"C-x C-j"))

(setq guide-key/highlight-command-regexp "git")
(setq guide-key/idle-delay 1.5)

(guide-key-mode 1)

(diminish 'guide-key-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'semantic)
(require 'semantic/sb)
(require 'srecode)

(semantic-mode 1)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-decoration-mode 0)
(global-semantic-highlight-func-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-mru-bookmark-mode 1)
(global-semantic-idle-breadcrumbs-mode 1)

(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

(setq semanticdb-default-save-directory prolusion-semantic-dir)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'helm)
(prolusion-require-package 'helm-ack)
(prolusion-require-package 'helm-company)
(prolusion-require-package 'helm-dash)

(setq helm-c-ack-use-ack-grep t)

(eval-after-load 'company
  '(progn
     (define-key company-mode-map   (kbd "<C-return>") 'helm-company)
     (define-key company-active-map (kbd "<C-return>") 'helm-company)))

(setq helm-dash-docsets-path prolusion-docs-dir)
(setq helm-dash-common-docsets '("C" "C++" "Qt"))

(custom-set-faces
 '(helm-source-header ((t (:background "black" :foreground "gainsboro" :underline nil :weight normal :height 1.0)))))

(global-set-key (kbd "C-x C-j a") 'helm-ack)
(global-set-key (kbd "C-x C-j i") 'helm-apt)
(global-set-key (kbd "C-x C-j d") 'helm-dash)
(global-set-key (kbd "C-x C-j m") 'helm-mini)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'company)

(global-company-mode)

(diminish 'company-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Headers
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'header2)

(setq header-author 'user-full-name)
(setq header-file-name 'buffer-file-name)
(setq header-modification-author 'user-full-name)

(setq make-header-hook
  '(header-rcs-id
    header-blank
    header-end-line
    header-commentary
    header-blank
    header-end-line
    header-history
    header-blank
    header-end-line
    header-code
    header-eof))

(global-set-key (kbd "C-x C-h m") 'make-header)
(global-set-key (kbd "C-x C-h c") 'make-box-comment)
(global-set-key (kbd "C-x C-h d") 'make-divider)
(global-set-key (kbd "C-x C-h r") 'make-revision)
(global-set-key (kbd "C-x C-h g") 'update-file-header)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git gutter
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'fringe-helper)
(prolusion-require-package 'git-gutter)
(prolusion-require-package 'git-gutter-fringe)

(when (display-graphic-p)
  (require 'git-gutter-fringe)
  (require 'git-gutter))

(when (display-graphic-p)
  (set-face-foreground 'git-gutter-fr:modified "orange")
  (set-face-foreground 'git-gutter-fr:added    "green")
  (set-face-foreground 'git-gutter-fr:deleted  "red"))

(when (display-graphic-p)
  (setq git-gutter-fr:side 'right-fringe))

(global-set-key (kbd "C-x C-g g") 'git-gutter:toggle)
(global-set-key (kbd "C-x C-g =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x C-g p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x C-g n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-x C-g s") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-x C-g r") 'git-gutter:revert-hunk)

(global-git-gutter-mode t)

(diminish 'git-gutter-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Buffer based title
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq frame-title-format
  '("Emacs - "
    (:eval
     (if (buffer-file-name)
	 (abbreviate-file-name (buffer-file-name)) "%b"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-editor)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-editor.el ends here
