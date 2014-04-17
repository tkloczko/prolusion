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

(require 'cl)
(require 'prolusion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun prolusion-import-faces (&optional regexp already-defined)
 (interactive (list (read-regexp "List faces matching regexp")))
 (let*
  ((all-faces (zerop (length regexp)))
   (faces
    (delq nil
     (mapcar
      (lambda (face)
        (let ((s (symbol-name face)))
          (when (or all-faces (string-match regexp s))
            face)))
      (sort (face-list) #'string-lessp)))))
  (mapc
   (lambda(face)
     (when (or (not (get face 'theme-face)) already-defined)
       (insert
        (format
         "`(%s ((,class %s)))%s
"
         face
         (let (result)
           (dolist (entry face-attribute-name-alist result)
             (let* ((attribute (car entry))
                    (value (face-attribute face attribute)))
               (unless (eq value 'unspecified)
                 (setq result
                   (nconc (list attribute
                     (cond
                      ((member* attribute
                                '(":background"
                                  ":foreground")
                                :test 'string=)
                       (format "\"%s\"" value))
                      (t value))) result))))))
         (if (get face 'theme-face)
             (format " ;; Already set by current theme!")
           "")))))
   faces)))

(provide 'prolusion-theme-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-theme-utils.el ends here
