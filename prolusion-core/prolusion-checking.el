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
;; Fly-checking
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'flycheck)
(prolusion-require-package 'flycheck-irony)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define fringe indicators
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables '(flycheck-indication-mode 'right-fringe))

(when (fboundp 'define-fringe-bitmap)
  (define-fringe-bitmap 'prolusion-flycheck-fringe-indicator
    (vector #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00111000
            #b01111100
            #b01111100
            #b01111100
            #b00111000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000)))

(flycheck-define-error-level 'error
  :overlay-category 'flycheck-error-overlay
  :fringe-bitmap 'prolusion-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-error)

(flycheck-define-error-level 'warning
  :overlay-category 'flycheck-warning-overlay
  :fringe-bitmap 'prolusion-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-warning)

(flycheck-define-error-level 'info
  :overlay-category 'flycheck-info-overlay
  :fringe-bitmap 'prolusion-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-info)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable for c/c++/objc
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

(add-hook    'c-mode-hook 'flycheck-mode)
(add-hook  'c++-mode-hook 'flycheck-mode)
(add-hook 'objc-mode-hook 'flycheck-mode)

(eval-after-load 'flycheck '(diminish 'flycheck-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-checking)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-semantic.el ends here
