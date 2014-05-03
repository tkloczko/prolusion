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
;; Semantic
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file (expand-file-name "cedet-devel-load.el" prolusion-semantic-dir))

(require 'semantic)
(require 'semantic/bovine/c)
(require 'semantic/bovine/clang)

(setq qt-base-dir "/usr/include/qt")
(semantic-add-system-include (concat qt-base-dir "/QtCore") 'c++-mode)
(semantic-add-system-include (concat qt-base-dir "/QtGui") 'c++-mode)
(semantic-add-system-include (concat qt-base-dir "/QtQuick") 'c++-mode)
(semantic-add-system-include (concat qt-base-dir "/QtQml") 'c++-mode)
(semantic-add-system-include (concat qt-base-dir "/QtCompositor") 'c++-mode)

(defun prolusion/c-mode-cedet-hook ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))

(add-hook 'c-mode-common-hook 'prolusion/c-mode-cedet-hook)

(setq semanticdb-default-save-directory prolusion-semantic-dir)

(provide 'prolusion-semantic)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-semantic.el ends here
