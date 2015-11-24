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
;; Auto Completion
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'company)
(prolusion-require-package 'company-irony)
(prolusion-require-package 'company-irony-c-headers)

(eval-after-load 'company '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony-c-headers))
(eval-after-load 'company '(add-to-list 'company-backends 'company-cmake))

(setq company-idle-delay 0.2)
(setq company-echo-delay 0.0)
(setq company-minimum-prefix-length 1)

(add-hook          'c-mode-hook 'company-mode)
(add-hook        'c++-mode-hook 'company-mode)
(add-hook       'objc-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook      'cmake-mode-hook 'company-mode)

(eval-after-load 'company '(diminish 'company-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-completion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-syntactic.el ends here
