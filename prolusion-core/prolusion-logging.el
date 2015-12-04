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
;; Logging requirements
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'log4e)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Logging setup
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'log4e)

(log4e:deflogger "prolusion" "%t [%l] %m" "%H:%M:%S"
    '((fatal . "fatal")
      (error . "error")
      (warn  .  "warn")
      (info  .  "info")
      (debug . "debug")
      (trace . "trace")))

;; provides
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; prolusion--log-fatal
;; prolusion--log-error
;; prolusion--log-warn
;; prolusion--log-info
;; prolusion--log-debug
;; prolusion--log-trace
;; prolusion--log
;; prolusion--log-fatal*
;; prolusion--log-error*
;; prolusion--log-warn*
;; prolusion--log-info*
;; prolusion--log-debug*
;; prolusion--log-trace*
;; prolusion--log*
;; prolusion--log-set-level
;; prolusion--log-enable-logging
;; prolusion--log-disable-logging
;; prolusion--log-enable-debugging
;; prolusion--log-disable-debugging
;; prolusion--log-enable-messaging
;; prolusion--log-disable-messaging
;; prolusion--log-debugging-p
;; prolusion--log-set-coding-system
;; prolusion--log-set-author-mail-address
;; prolusion--log-clear-log
;; prolusion--log-open-log
;; prolusion--log-open-log-if-debug

(prolusion--log-set-level 'trace 'fatal)
(prolusion--log-open-log)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-logging)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-logging.el ends here
