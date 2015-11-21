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

(require 'package)

(load-library "url-handlers")

(setq package-user-dir prolusion-elpa-dir)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (message "Fetching package meta data")
  (package-refresh-contents))

(defun prolusion-require-package (package) ""
       (message "Loading package %s" package)
       (unless (package-installed-p package)
         (package-install package))
       (require 'package))

(defun prolusion-upgrade-packages () ""
       (interactive)
       (message "Upgrading packages")
       (save-window-excursion
         (package-list-packages t)
         (package-menu-mark-upgrades)
         (package-menu-execute t)))

(provide 'prolusion-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-packages.el ends here
