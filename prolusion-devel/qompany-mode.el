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

(defvar qompany-mode-hook nil "")
(defvar qompany-mode-indent-offset 4 "")
(defvar qompany-mode-indent-tabs nil)
;; (defvar qompany-mode-keywords  '(%1))
;; (defvar qompany-mode-types     '(%2))
;; (defvar qompany-mode-constants '(%3))

(defvar qompany-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?\' "\"'"   table)
    (modify-syntax-entry ?\" "\"\""  table)
    (modify-syntax-entry ?/  ". 124" table)
    (modify-syntax-entry ?*  ". 23b" table)
    (modify-syntax-entry ?\n ">"     table)
    table))

;;;###autoload
(define-derived-mode qompany-mode prog-mode "Qompany"
  "Major mode for editing QML files."
  (set-syntax-table qompany-mode-syntax-table)
  (set (make-local-variable 'tab-width) qompany-mode-indent-offset)
  (set (make-local-variable 'indent-tabs-mode) qompany-mode-indent-tabs)
  (setq major-mode 'qompany-mode)
  (setq mode-name "Qompany")
  (run-hooks 'qompany-mode-hook))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'qompany-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; qompany-mode.el ends here
