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
;;
;; (package-initialize) ;; Required as of 25.1.50.1

(defvar prolusion-dir          (file-name-directory load-file-name))
(defvar prolusion-core-dir     (expand-file-name "prolusion-core"     prolusion-dir) "")
(defvar prolusion-www-dir      (expand-file-name "prolusion-www"      prolusion-dir) "")
(defvar prolusion-docs-dir     (expand-file-name "prolusion-docs"     prolusion-dir) "")
(defvar prolusion-elpa-dir     (expand-file-name "prolusion-elpa"     prolusion-dir) "")
(defvar prolusion-eshell-dir   (expand-file-name "prolusion-eshell"   prolusion-dir) "")
(defvar prolusion-save-dir     (expand-file-name "prolusion-save"     prolusion-dir) "")
(defvar prolusion-irony-dir    (expand-file-name "prolusion-irony"    prolusion-dir) "")
(defvar prolusion-semantic-dir (expand-file-name "prolusion-semantic" prolusion-dir) "")
(defvar prolusion-theme-dir    (expand-file-name "prolusion-theme"    prolusion-dir) "")
(defvar prolusion-snippets-dir (expand-file-name "prolusion-snippets" prolusion-dir) "")

(make-directory prolusion-www-dir t)
(make-directory prolusion-docs-dir t)
(make-directory prolusion-elpa-dir t)
(make-directory prolusion-eshell-dir t)
(make-directory prolusion-irony-dir t)
(make-directory prolusion-save-dir t)
(make-directory prolusion-semantic-dir t)

(add-to-list              'load-path prolusion-core-dir)
(add-to-list              'load-path prolusion-theme-dir)
(add-to-list 'custom-theme-load-path prolusion-theme-dir)

(require 'prolusion-ui)
(require 'prolusion-www)
(require 'prolusion-packages)
(require 'prolusion-behavior)
(require 'prolusion-eshell)
(require 'prolusion-editor)
(require 'prolusion-modes)
(require 'prolusion-snippets)
(require 'prolusion-irony)
(require 'prolusion-completion)
(require 'prolusion-checking)
(require 'prolusion-vc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
