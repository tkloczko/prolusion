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

(defvar qompany-mode-hook nil
  "Qompany mode hooks")

(defvar qompany-mode-indent-offset 4
  "Qompany mode indent offset")

(defvar qompany-mode-indent-tabs nil
  "Qompany mode indent tabs")

;; (defvar qompany-mode-keywords  '("import"))
;; (defvar qompany-mode-types     '())
;; (defvar qompany-mode-enums     '(%3))
;; (defvar qompany-mode-constants '(%4))

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
