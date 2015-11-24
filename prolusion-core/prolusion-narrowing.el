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
;; Helm
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'helm)
(prolusion-require-package 'helm-ag)
(prolusion-require-package 'helm-dash)
(prolusion-require-package 'helm-company)
(prolusion-require-package 'helm-flycheck)
(prolusion-require-package 'helm-c-yasnippet)

(setq helm-dash-docsets-path prolusion-docs-dir)
(setq helm-dash-common-docsets '("C" "C++" "Qt"))

(global-set-key (kbd "C-c h a") 'helm-ag)
(global-set-key (kbd "C-c h d") 'helm-dash)
(global-set-key (kbd "C-c h m") 'helm-mini)
(global-set-key (kbd "C-c h c") 'helm-company)
(global-set-key (kbd "C-c h f") 'helm-flycheck)
(global-set-key (kbd "C-c h y") 'helm-yas-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-narrowing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-narrowing.el ends here
