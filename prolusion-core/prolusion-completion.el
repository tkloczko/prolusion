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
;; Completion requirements
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion-require-package 'company)
(prolusion-require-package 'company-irony)
(prolusion-require-package 'company-irony-c-headers)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion setup
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq company-idle-delay 0.2)
(setq company-echo-delay 0.0)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-flip-when-above t)

(setq qmltypes-parser-file-list `(
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/Controls/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/Dialogs/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/Extras/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/Layouts/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/LocalStorage/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/Particles.2/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/PrivateWidgets/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/Window.2/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick/XmlListModel/plugins.qmltypes"
      "/Users/jwintz/Development/qt/5.5/clang_64/qml/QtQuick.2/plugins.qmltypes"))

(prolusion-require-package 'company-qml)

(eval-after-load 'company '(add-to-list 'company-backends 'company-qml))
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony-c-headers))
(eval-after-load 'company '(add-to-list 'company-backends 'company-cmake))
(eval-after-load 'company '(add-to-list 'company-backends 'company-qml))
(eval-after-load 'company '(add-to-list 'company-backends 'company-yasnippet))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion hooks
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook          'c-mode-hook 'company-mode)
(add-hook        'c++-mode-hook 'company-mode)
(add-hook       'objc-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook      'cmake-mode-hook 'company-mode)
(add-hook       'html-mode-hook 'company-mode)
(add-hook        'qml-mode-hook 'company-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion modeline
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load 'company '(diminish 'company-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-completion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-syntactic.el ends here
