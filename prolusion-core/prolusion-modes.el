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
;; Retrieve 3rd party modes
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'cmake-mode)
(prolusion-require-package 'csharp-mode)
(prolusion-require-package 'markdown-mode)
(prolusion-require-package 'qml-mode)
(prolusion-require-package 'rbenv)
(prolusion-require-package 'rainbow-mode)
(prolusion-require-package 'json-mode)
(prolusion-require-package 'yaml-mode)
(prolusion-require-package 'js2-mode)
(prolusion-require-package 'js2-refactor)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom convenience modes
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.h$"          . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c$"          . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tpp$"        . c++-mode))
(add-to-list 'auto-mode-alist '(".gitignore"     . makefile-mode))
(add-to-list 'auto-mode-alist '(".gitattributes" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$"      . cmake-mode))
(add-to-list 'auto-mode-alist '("qmldir$"        . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.pr[io]$"     . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.qrc$"        . xml-mode))
(add-to-list 'auto-mode-alist '("\\.qs$"         . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.qml$"        . qml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$"        . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'"       . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'"     . json-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Convenience hooks
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'js2-mode-hook 'js2-refactor-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Info mode
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun info-mode ()
  (interactive)
  (let ((file-name (buffer-file-name)))
    (kill-buffer (current-buffer))
    (info file-name)))

(add-to-list 'auto-mode-alist '("\\.info\\'" . info-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-modes)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-modes.el ends here
