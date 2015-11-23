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
;; Git
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git gutter
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'git-gutter)
(prolusion-require-package 'git-gutter-fringe)

(custom-set-variables
 '(git-gutter:modified-sign "±")
 '(git-gutter:added-sign    "+")
 '(git-gutter:deleted-sign  "-"))

(custom-set-faces
 '(git-gutter:added    ((t (:foreground "green"  :weight bold))))
 '(git-gutter:deleted  ((t (:foreground "red"    :weight bold))))
 '(git-gutter:modified ((t (:foreground "orange" :weight bold)))))

(global-set-key (kbd "C-c g g") 'git-gutter:toggle)
(global-set-key (kbd "C-c g =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-c g p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c g n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c g s") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)

(global-git-gutter-mode t)

(diminish 'git-gutter-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-vc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-vc.el ends here
