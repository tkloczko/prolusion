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
;; Fetching
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'mu4e)

(setq mu4e-maildir prolusion-mail-dir)
(setq mu4e-get-mail-command
 (concat "offlineimap -c "
  (expand-file-name "prolusion-mail.rc" prolusion-mail-dir)))
(setq mu4e-maildir-shortcuts
 '(("/inria/INBOX"  . ?i)
   ("/gmail/INBOX"  . ?g)
   ("/icloud/INBOX" . ?c)))

(setq user-mail-address prolusion-mail)

(setq message-kill-buffer-on-exit t)

(setq mu4e-sent-folder   "/local/Sent")
(setq mu4e-drafts-folder "/local/Drafts")
(setq mu4e-trash-folder  "/local/Trash")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sending
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq starttls-gnutls-program "gnutls-cli")
(setq starttls-use-gnutls t)
(setq starttls-extra-arguments nil)

(setq         send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)

(setq smtpmail-stream-type 'starttls)
(setq smtpmail-smtp-server "smtp.inria.fr")
(setq smtpmail-smtp-service 587)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Postamble
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun prolusion-mail ()
  (interactive)
  (mu4e))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-mail)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-mail.el ends here
