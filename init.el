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
;; (package-initialize)

(defvar prolusion-dir          (file-name-directory load-file-name))
(defvar prolusion-core-dir     (expand-file-name "prolusion-core"     prolusion-dir) "")
(defvar prolusion-docs-dir     (expand-file-name "prolusion-docs"     prolusion-dir) "")
(defvar prolusion-elpa-dir     (expand-file-name "prolusion-elpa"     prolusion-dir) "")
(defvar prolusion-save-dir     (expand-file-name "prolusion-save"     prolusion-dir) "")
(defvar prolusion-irony-dir    (expand-file-name "prolusion-irony"    prolusion-dir) "")
(defvar prolusion-snippets-dir (expand-file-name "prolusion-snippets" prolusion-dir) "")

(make-directory prolusion-docs-dir  t)
(make-directory prolusion-elpa-dir  t)
(make-directory prolusion-save-dir  t)
(make-directory prolusion-irony-dir t)

(add-to-list 'load-path prolusion-core-dir)

(require 'prolusion-packages)
(require 'prolusion-ui)
(require 'prolusion-behavior)
(require 'prolusion-eshell)
(require 'prolusion-editor)
(require 'prolusion-modes)
(require 'prolusion-snippets)
;;(require 'prolusion-irony)
(require 'prolusion-completion)
(require 'prolusion-checking)
(require 'prolusion-compilation)
(require 'prolusion-www)
(require 'prolusion-vc)
(require 'prolusion-docs)
(require 'prolusion-projectile)
(require 'prolusion-builtins)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
