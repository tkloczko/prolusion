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

(defvar prolusion-user "Julien Wintz")
(defvar prolusion-mail "julien.wintz@inria.fr")

(defvar prolusion-dir          (file-name-directory load-file-name))
(defvar prolusion-core-dir     (expand-file-name "prolusion-core"        prolusion-dir) "")
(defvar prolusion-docs-dir     (expand-file-name "prolusion-docs"        prolusion-dir) "")
(defvar prolusion-elpa-dir     (expand-file-name "prolusion-elpa"        prolusion-dir) "")
(defvar prolusion-eshell-dir   (expand-file-name "prolusion-eshell"      prolusion-dir) "")
(defvar prolusion-save-dir     (expand-file-name "prolusion-save"        prolusion-dir) "")
(defvar prolusion-semantic-dir (expand-file-name "prolusion-semantic"    prolusion-dir) "")
(defvar prolusion-theme-dir    (expand-file-name "prolusion-theme"       prolusion-dir) "")
(defvar prolusion-snippets-dir (expand-file-name "prolusion-snippets"    prolusion-dir) "")

(make-directory prolusion-docs-dir t)
(make-directory prolusion-elpa-dir t)
(make-directory prolusion-eshell-dir t)
(make-directory prolusion-save-dir t)
(make-directory prolusion-semantic-dir t)

(add-to-list              'load-path prolusion-core-dir)
(add-to-list              'load-path prolusion-theme-dir)
(add-to-list 'custom-theme-load-path prolusion-theme-dir)

(require 'prolusion-ui)
(require 'prolusion-packages)
(require 'prolusion-behavior)
(require 'prolusion-editor)
(require 'prolusion-eshell)
(require 'prolusion-modes)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
