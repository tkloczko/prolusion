; Version: $Id$
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;; Commentary:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(defgroup prolusion nil
  "Prolusion theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom prolusion-distinct-fringe-background nil
  "Make the fringe background different from the normal background color.
Also affects linum-mode background."
  :type 'boolean
  :group 'prolusion)

(defcustom prolusion-use-variable-pitch t
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'prolusion)

(defcustom prolusion-high-contrast-mode-line nil
  "Make the active/inactive mode line stand out more."
  :type 'boolean
  :group 'prolusion)

(defcustom prolusion-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'prolusion)

(defcustom prolusion-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'prolusion)

(defcustom prolusion-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'prolusion)

(defcustom prolusion-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'prolusion)

(defcustom prolusion-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'prolusion)

(defun create-prolusion-theme (variant theme-name &optional childtheme)
  "Create a VARIANT of the theme named THEME-NAME.

   When optional argument CHILDTHEME function is supplied it's invoked to further
   customize the resulting theme."

  (let* ((class '((class color) (min-colors 89)))
         (base03    "#101010")
         (base02    "#202020")
         (base01    "#303030")
         (base00    "#505050")
         (base0     "#b0b0b0")
         (base1     "#d0d0d0")
         (base2     "#e0e0e0")
         (base3     "#f5f5f5")
         (yellow    "#b58900")
         (yellow-d  "#7B6000")
         (yellow-l  "#DEB542")
         (orange    "#cb4b16")
         (orange-d  "#8B2C02")
         (orange-l  "#F2804F")
         (red       "#dc322f")
         (red-d     "#990A1B")
         (red-l     "#FF6E64")
         (magenta   "#d33682")
         (magenta-d "#93115C")
         (magenta-l "#F771AC")
         (violet    "#6c71c4")
         (violet-d  "#3F4D91")
         (violet-l  "#9EA0E5")
         (blue      "#268bd2")
         (blue-d    "#00629D")
         (blue-l    "#69B7F0")
         (cyan      "#2aa198")
         (cyan-d    "#00736F")
         (cyan-l    "#69CABF")
         (green     "#859900")
         (green-d   "#546E00")
         (green-l   "#B4C342")

         (ml-light  "#e8e8e8")
         (ml-dark   "#151515")

         (prolusion-ml (if (eq variant 'light) ml-light ml-dark))
         (prolusion-fg (if (eq variant 'light) base00 base0))
         (prolusion-bg (if (eq variant 'light) base3 base03))
         (prolusion-hl (if (eq variant 'light) base2 base02))
         (prolusion-emph (if (eq variant 'light) base01 base1))
         (prolusion-comments (if (eq variant 'light) base0 base00))

         (prolusion-fg-hc (if (eq variant 'light) base3 base03))
         (prolusion-fg-lc (if (eq variant 'light) base03 base3))

         (yellow-hc (if (eq variant 'light) yellow-d yellow-l))
         (yellow-lc (if (eq variant 'light) yellow-l yellow-d))
         (orange-hc (if (eq variant 'light) orange-d orange-l))
         (orange-lc (if (eq variant 'light) orange-l orange-d))
         (red-hc (if (eq variant 'light) red-d red-l))
         (red-lc (if (eq variant 'light) red-l red-d))
         (magenta-hc (if (eq variant 'light) magenta-d magenta-l))
         (magenta-lc (if (eq variant 'light) magenta-l magenta-d))
         (violet-hc (if (eq variant 'light) violet-d violet-l))
         (violet-lc (if (eq variant 'light) violet-l violet-d))
         (blue-hc (if (eq variant 'light) blue-d blue-l))
         (blue-lc (if (eq variant 'light) blue-l blue-d))
         (cyan-hc (if (eq variant 'light) cyan-d cyan-l))
         (cyan-lc (if (eq variant 'light) cyan-l cyan-d))
         (green-hc (if (eq variant 'light) green-d green-l))
         (green-lc (if (eq variant 'light) green-l green-d))

         ;; customize based face properties
         (s-variable-pitch (if prolusion-use-variable-pitch 'variable-pitch 'default))
         (s-fringe-bg (if prolusion-distinct-fringe-background prolusion-hl prolusion-bg))

         (s-mode-line-fg (if prolusion-high-contrast-mode-line prolusion-bg prolusion-fg))
         (s-mode-line-bg (if prolusion-high-contrast-mode-line prolusion-fg prolusion-hl))

         (s-mode-line-buffer-id-fg (if prolusion-high-contrast-mode-line 'unspecified prolusion-emph))
         (s-mode-line-inactive-fg (if prolusion-high-contrast-mode-line prolusion-fg prolusion-comments))
         (s-mode-line-inactive-bg (if prolusion-high-contrast-mode-line prolusion-hl prolusion-ml))
         (s-mode-line-inactive-bc (if prolusion-high-contrast-mode-line prolusion-fg prolusion-hl)))

    (custom-theme-set-faces
     theme-name
     '(button ((t (:underline t))))

     ;; basic coloring
     `(default ((,class (:foreground ,prolusion-fg :background ,prolusion-bg))))
     `(shadow ((,class (:foreground ,prolusion-comments))))
     `(match ((,class (:background ,prolusion-hl :foreground ,prolusion-emph :weight bold))))
     `(cursor ((,class (:foreground ,prolusion-bg :background ,prolusion-fg :inverse-video t))))
     `(mouse ((,class (:foreground ,prolusion-bg :background ,prolusion-fg :inverse-video t))))
     `(escape-glyph-face ((,class (:foreground ,red))))
     `(fringe ((,class (:foreground ,prolusion-fg :background ,s-fringe-bg))))
     `(highlight ((,class (:background ,prolusion-hl))))
     `(link ((,class (:foreground ,yellow :underline t :weight bold))))
     `(link-visited ((,class (:foreground ,yellow :underline t :weight normal))))
     `(success ((,class (:foreground ,green ))))
     `(warning ((,class (:foreground ,yellow ))))
     `(error ((,class (:foreground ,orange))))
     `(lazy-highlight ((,class (:foreground ,prolusion-bg :background ,yellow :weight normal))))
     `(escape-glyph ((,class (:foreground ,violet))))

     ;; compilation
     `(compilation-column-face ((,class (:foreground ,cyan :underline nil))))
     `(compilation-column-number ((,class (:inherit font-lock-doc-face :foreground ,cyan :underline nil))))
     `(compilation-enter-directory-face ((,class (:foreground ,green :underline nil))))
     `(compilation-error ((,class (:inherit error :underline nil))))
     `(compilation-error-face ((,class (:foreground ,red : :underline nil))))
     `(compilation-face ((,class (:foreground ,prolusion-fg :underline nil))))
     `(compilation-info ((,class (:foreground ,prolusion-comments :underline nil :bold nil))))
     `(compilation-info-face ((,class (:foreground ,blue :underline nil))))
     `(compilation-leave-directory-face ((,class (:foreground ,green :underline nil))))
     `(compilation-line-face ((,class (:foreground ,green :underline nil))))
     `(compilation-line-number ((,class (:foreground ,green :underline nil))))
     `(compilation-warning ((,class (:inherit warning :underline nil))))
     `(compilation-warning-face ((,class (:foreground ,yellow :weight normal :underline nil))))
     `(compilation-mode-line-exit ((,class (:inherit compilation-info :foreground ,green :weight bold))))
     `(compilation-mode-line-fail ((,class (:inherit compilation-error :foreground ,red :weight bold))))
     `(compilation-mode-line-run ((,class (:foreground ,orange :weight bold))))

     ;; dired
     `(dired-directory ((,class (:foreground ,blue :weight normal))))
     `(dired-flagged ((,class (:foreground ,red))))
     `(dired-header ((,class (:foreground ,prolusion-bg :background ,blue))))
     `(dired-ignored ((,class (:inherit shadow))))
     `(dired-mark ((,class (:foreground ,yellow :weight bold))))
     `(dired-marked ((,class (:foreground ,magenta :weight bold))))
     `(dired-perm-write ((,class (:foreground ,prolusion-fg :underline t))))
     `(dired-symlink ((,class (:foreground ,cyan :weight normal :slant italic))))
     `(dired-warning ((,class (:foreground ,orange :underline t))))

     ;; dropdown
     `(dropdown-list-face ((,class (:background ,prolusion-hl :foreground ,cyan))))
     `(dropdown-list-selection-face ((,class (:background ,cyan-lc :foreground ,cyan-hc))))

     ;; grep
     `(grep-context-face ((,class (:foreground ,prolusion-fg))))
     `(grep-error-face ((,class (:foreground ,red :weight bold :underline t))))
     `(grep-hit-face ((,class (:foreground ,blue))))
     `(grep-match-face ((,class (:foreground ,orange :weight bold))))

     ;; faces used by isearch
     `(isearch ((,class (:foreground ,prolusion-bg :background ,magenta :weight normal))))
     `(isearch-fail ((,class (:foreground ,red :background ,prolusion-bg :bold t))))

     ;; man
     `(Man-overstrike ((,class (:foreground ,blue :weight bold))))
     `(Man-reverse ((,class (:foreground ,orange))))
     `(Man-underline ((,class (:foreground ,green :underline t))))

     ;; misc faces
     `(menu ((,class (:foreground ,prolusion-fg :background ,prolusion-bg))))
     `(minibuffer-prompt ((,class (:foreground ,prolusion-fg))))
     `(mode-line ((,class (:inverse-video unspecified :box (:line-width 1 :color ,s-mode-line-bg :style unspecified) :overline ,s-mode-line-bg :underline ,s-mode-line-bg :foreground ,s-mode-line-fg :background ,s-mode-line-bg))))
     `(mode-line-buffer-id ((,class (:foreground ,s-mode-line-buffer-id-fg :weight bold))))
     `(mode-line-inactive ((,class (:inverse-video unspecified :box (:line-width 1 :color ,s-mode-line-inactive-bg :style unspecified) :overline ,s-mode-line-inactive-bg :underline ,s-mode-line-inactive-bg :foreground ,s-mode-line-inactive-fg :background ,s-mode-line-inactive-bg))))
     `(header-line ((,class (:inverse-video unspecified :underline unspecified :foreground ,prolusion-emph :background ,prolusion-hl :box (:line-width 1 :color ,prolusion-hl :style unspecified)))))
     `(region ((,class (:foreground ,prolusion-bg :background ,prolusion-emph))))
     `(secondary-selection ((,class (:background ,prolusion-hl))))
     `(trailing-whitespace ((,class (:background ,red))))
     `(vertical-border ((,class (:foreground ,prolusion-hl))))

     ;; font lock
     `(font-lock-builtin-face ((,class (:foreground ,prolusion-fg :weight bold))))
     `(font-lock-comment-delimiter-face ((,class (:foreground ,prolusion-comments))))
     `(font-lock-comment-face ((,class (:foreground ,prolusion-comments))))
     `(font-lock-constant-face ((,class (:foreground ,blue :weight bold))))
     `(font-lock-doc-face ((,class (:foreground ,cyan))))
     `(font-lock-function-name-face ((,class (:foreground ,blue))))
     `(font-lock-keyword-face ((,class (:foreground ,green :weight bold))))
     `(font-lock-negation-char-face ((,class (:foreground ,yellow :weight bold))))
     `(font-lock-preprocessor-face ((,class (:foreground ,blue))))
     `(font-lock-regexp-grouping-construct ((,class (:foreground ,yellow :weight bold))))
     `(font-lock-regexp-grouping-backslash ((,class (:foreground ,green :weight bold))))
     `(font-lock-string-face ((,class (:foreground ,cyan))))
     `(font-lock-type-face ((,class (:foreground ,yellow))))
     `(font-lock-variable-name-face ((,class (:foreground ,blue))))
     `(font-lock-warning-face ((,class (:foreground ,orange :weight bold :underline t))))
     `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

     ;; company
     (custom-set-faces
      '(company-preview ((t (:foreground "darkgray" :underline t))))
      '(company-preview-common ((t (:inherit company-preview))))
      '(company-tooltip ((t (:background "black" :foreground "white"))))
      '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
      '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
      '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
      `(company-scrollbar-bg ((t (:background "#000000"))))
      `(company-scrollbar-fg ((t (:background "#202020")))))

     ;; git-gutter
     (custom-set-faces
      '(git-gutter:added    ((t (:foreground "green"  :weight bold))))
      '(git-gutter:deleted  ((t (:foreground "red"    :weight bold))))
      '(git-gutter:modified ((t (:foreground "orange" :weight bold)))))

     ;; auto highlight symbol
     `(ahs-definition-face ((,class (:foreground ,magenta :background unspecified :slant normal))))
     `(ahs-edit-mode-face ((,class (:foreground ,prolusion-bg :background ,magenta))))
     `(ahs-face ((,class (:foreground ,magenta :background unspecified))))
     `(ahs-plugin-bod-face ((,class (:foreground ,magenta :background unspecified ))))
     `(ahs-plugin-defalt-face ((,class (:foreground ,magenta :background unspecified))))
     `(ahs-plugin-whole-buffer-face ((,class (:foreground ,magenta  :background unspecified))))
     `(ahs-warning-face ((,class (:foreground ,red :weight bold))))

     ;; cscope
     `(cscope-file-face ((,class (:foreground ,green :weight bold))))
     `(cscope-function-face ((,class (:foreground ,blue))))
     `(cscope-line-number-face ((,class (:foreground ,yellow))))
     `(cscope-line-face ((,class (:foreground ,prolusion-fg))))
     `(cscope-mouse-face ((,class (:background ,blue :foreground ,prolusion-fg))))

     ;; ctable
     `(ctbl:face-cell-select ((,class (:background ,prolusion-hl :foreground ,prolusion-emph :underline ,prolusion-emph :weight bold))))
     `(ctbl:face-continue-bar ((,class (:background ,prolusion-hl :foreground ,yellow))))
     `(ctbl:face-row-select ((,class (:background ,prolusion-hl :foreground ,prolusion-fg :underline t))))

     ;; coffee
     `(coffee-mode-class-name ((,class (:foreground ,yellow :weight bold))))
     `(coffee-mode-function-param ((,class (:foreground ,violet :slant italic))))

     ;; custom
     `(custom-face-tag ((,class (:inherit ,s-variable-pitch :height ,prolusion-height-plus-3 :foreground ,violet :weight bold))))
     `(custom-variable-tag ((,class (:inherit ,s-variable-pitch :foreground ,cyan :height ,prolusion-height-plus-3))))
     `(custom-comment-tag ((,class (:foreground ,prolusion-comments))))
     `(custom-group-tag ((,class (:inherit ,s-variable-pitch :foreground ,blue :height ,prolusion-height-plus-3))))
     `(custom-group-tag-1 ((,class (:inherit ,s-variable-pitch :foreground ,red :height ,prolusion-height-plus-3))))
     `(custom-state ((,class (:foreground ,green))))

     ;; diff
     `(diff-added ((,class (:foreground ,green :background ,prolusion-bg))))
     `(diff-changed ((,class (:foreground ,blue :background ,prolusion-bg))))
     `(diff-removed ((,class (:foreground ,red :background ,prolusion-bg))))
     `(diff-header ((,class (:background ,prolusion-bg))))
     `(diff-file-header ((,class (:background ,prolusion-bg :foreground ,prolusion-fg :weight bold))))
     `(diff-refine-added ((,class :foreground ,prolusion-bg :background ,green)))
     `(diff-refine-change ((,class :foreground ,prolusion-bg :background ,blue)))
     `(diff-refine-removed ((,class (:foreground ,prolusion-bg :background ,red))))

     ;; ediff
     `(ediff-fine-diff-A ((,class (:background ,orange-lc))))
     `(ediff-fine-diff-B ((,class (:background ,green-lc))))
     `(ediff-fine-diff-C ((,class (:background ,yellow-lc))))
     `(ediff-current-diff-C ((,class (:background ,blue-lc))))
     `(ediff-even-diff-A ((,class (:background ,prolusion-comments :foreground ,prolusion-fg-lc ))))
     `(ediff-odd-diff-A ((,class (:background ,prolusion-comments :foreground ,prolusion-fg-hc ))))
     `(ediff-even-diff-B ((,class (:background ,prolusion-comments :foreground ,prolusion-fg-hc ))))
     `(ediff-odd-diff-B ((,class (:background ,prolusion-comments :foreground ,prolusion-fg-lc ))))
     `(ediff-even-diff-C ((,class (:background ,prolusion-comments :foreground ,prolusion-fg ))))
     `(ediff-odd-diff-C ((,class (:background ,prolusion-comments :foreground ,prolusion-bg ))))

     ;; diff-hl
     `(diff-hl-change ((,class (:background ,blue-lc  :foreground ,blue-hc))))
     `(diff-hl-delete ((,class (:background ,red-lc  :foreground ,red-hc))))
     `(diff-hl-insert ((,class (:background ,green-lc  :foreground ,green-hc))))
     `(diff-hl-unknown ((,class (:background ,cyan-lc   :foreground ,cyan-hc))))

     ;; eshell
     `(eshell-prompt ((,class (:foreground ,yellow :weight bold))))
     `(eshell-ls-archive ((,class (:foreground ,red :weight bold))))
     `(eshell-ls-backup ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-clutter ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-directory ((,class (:foreground ,blue :weight bold))))
     `(eshell-ls-executable ((,class (:foreground ,red :weight bold))))
     `(eshell-ls-unreadable ((,class (:foreground ,prolusion-fg))))
     `(eshell-ls-missing ((,class (:inherit font-lock-warning-face))))
     `(eshell-ls-product ((,class (:inherit font-lock-doc-face))))
     `(eshell-ls-special ((,class (:foreground ,yellow :weight bold))))
     `(eshell-ls-symlink ((,class (:foreground ,cyan :weight bold))))

     ;; flycheck
     `(flycheck-error
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,red) :inherit unspecified))
        (,class (:foreground ,red-hc :background ,red-lc :weight bold :underline t))))
     `(flycheck-warning
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,yellow) :inherit unspecified))
        (,class (:foreground ,yellow-hc :background ,yellow-lc :weight bold :underline t))))
     `(flycheck-info
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,orange) :inherit unspecified))
        (,class (:foreground ,cyan-hc :background ,cyan-lc :weight bold :underline t))))
     `(flycheck-fringe-error
       ((,class (:foreground ,red :background ,s-fringe-bg :weight bold))))
     `(flycheck-fringe-warning
       ((,class (:foreground ,yellow :background ,s-fringe-bg :weight bold))))
     `(flycheck-fringe-info
       ((,class (:foreground ,cyan :background ,s-fringe-bg :weight bold))))

     ;; helm
     `(helm-apt-deinstalled ((,class (:foreground ,prolusion-comments))))
     `(helm-apt-installed ((,class (:foreground ,green))))
     `(helm-bookmark-directory ((,class (:inherit helm-ff-directory))))
     `(helm-bookmark-file ((,class (:foreground ,prolusion-fg))))
     `(helm-bookmark-gnus ((,class (:foreground ,cyan))))
     `(helm-bookmark-info ((,class (:foreground ,green))))
     `(helm-bookmark-man ((,class (:foreground ,violet))))
     `(helm-bookmark-w3m ((,class (:foreground ,yellow))))
     `(helm-bookmarks-su ((,class (:foreground ,orange))))
     `(helm-buffer-not-saved ((,class (:foreground ,orange))))
     `(helm-buffer-saved-out ((,class (:foreground ,red :background ,prolusion-bg :inverse-video t))))
     `(helm-buffer-size ((,class (:foreground ,prolusion-comments))))
     `(helm-candidate-number ((,class (:background ,prolusion-hl :foreground ,prolusion-emph :bold t))))
     `(helm-ff-directory ((,class (:background ,prolusion-bg  :foreground ,blue))))
     `(helm-ff-executable ((,class (:foreground ,green))))
     `(helm-ff-file ((,class (:background ,prolusion-bg :foreground ,prolusion-fg))))
     `(helm-ff-invalid-symlink ((,class (:background ,prolusion-bg :foreground ,orange :slant italic))))
     `(helm-ff-prefix ((,class (:background ,yellow :foreground ,prolusion-bg))))
     `(helm-ff-symlink ((,class (:foreground ,cyan))))
     `(helm-grep-file ((,class (:foreground ,cyan :underline t))))
     `(helm-grep-finish ((,class (:foreground ,green))))
     `(helm-grep-lineno ((,class (:foreground ,orange))))
     `(helm-grep-match ((,class (:inherit match))))
     `(helm-grep-running ((,class (:foreground ,red))))
     `(helm-header ((,class (:background "DodgerBlue4"))))
     `(helm-lisp-completion-info ((,class (:foreground ,prolusion-fg))))
     `(helm-lisp-show-completion ((,class (:foreground ,yellow  :background ,prolusion-hl :bold t))))
     `(helm-M-x-key ((,class (:foreground ,orange :underline t))))
     `(helm-moccur-buffer ((,class (:foreground ,cyan :underline t))))
     `(helm-match ((,class (:inherit match))))
     `(helm-selection ((,class (:background ,prolusion-hl :underline t))))
     `(helm-selection-line ((,class (:background ,prolusion-hl :foreground ,prolusion-emph :underline nil))))
     `(helm-separator ((,class (:foreground ,red))))
     `(helm-source-header ((,class (:background ,prolusion-bg :foreground ,yellow :underline nil :weight normal :height 1.0))))
     `(helm-time-zone-current ((,class (:foreground ,green))))
     `(helm-time-zone-home ((,class (:foreground ,red))))
     `(helm-visible-mark ((,class (:background ,prolusion-bg :foreground ,magenta :bold t))))

     ;; hi-lock-mode
     `(hi-yellow ((,class (:foreground ,yellow-lc :background ,yellow-hc))))
     `(hi-pink ((,class (:foreground ,magenta-lc :background ,magenta-hc))))
     `(hi-green ((,class (:foreground ,green-lc :background ,green-hc))))
     `(hi-blue ((,class (:foreground ,blue-lc :background ,blue-hc))))
     `(hi-black-b ((,class (:foreground ,prolusion-emph :background ,prolusion-bg
                                        :weight bold))))
     `(hi-blue-b ((,class (:foreground ,blue-lc :weight bold))))
     `(hi-green-b ((,class (:foreground ,green-lc :weight bold))))
     `(hi-red-b ((,class (:foreground ,red :weight bold))))
     `(hi-black-hb ((,class (:foreground ,prolusion-emph :background ,prolusion-bg :weight bold))))

     ;; highlight-changes
     `(highlight-changes ((,class (:foreground ,orange))))
     `(highlight-changes-delete ((,class (:foreground ,red :underline t))))

     ;; highlight-indentation
     `(highlight-indentation-face ((,class (:background ,prolusion-hl))))
     `(highlight-indentation-current-column-face((,class (:background ,prolusion-hl))))

     ;; hl-line-mode
     `(hl-line ((,class (:background ,prolusion-hl))))
     `(hl-line-face ((,class (:background ,prolusion-hl))))

     ;; js2-mode colors
     `(js2-error ((,class (:foreground ,red))))
     `(js2-external-variable ((,class (:foreground ,orange))))
     `(js2-function-param ((,class (:foreground ,green))))
     `(js2-instance-member ((,class (:foreground ,magenta))))
     `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,cyan))))
     `(js2-jsdoc-html-tag-name ((,class (:foreground ,orange))))
     `(js2-jsdoc-tag ((,class (:foreground ,cyan))))
     `(js2-jsdoc-type ((,class (:foreground ,blue))))
     `(js2-jsdoc-value ((,class (:foreground ,violet))))
     `(js2-magic-paren ((,class (:underline t))))
     `(js2-private-function-call ((,class (:foreground ,yellow))))
     `(js2-private-member ((,class (:foreground ,blue))))
     `(js2-warning ((,class (:underline ,orange))))

     ;; magit
     `(magit-section-title ((,class (:foreground ,yellow :weight bold))))
     `(magit-branch ((,class (:foreground ,orange :weight bold))))
     `(magit-item-highlight ((,class (:background ,prolusion-hl :weight unspecified))))
     `(magit-log-author ((,class (:foreground ,cyan))))
     `(magit-log-graph ((,class (:foreground ,prolusion-comments))))
     `(magit-log-head-label-bisect-bad ((,class (:background ,red-hc :foreground ,red-lc :box 1))))
     `(magit-log-head-label-bisect-good ((,class (:background ,green-hc :foreground ,green-lc :box 1))))
     `(magit-log-head-label-default ((,class (:background ,prolusion-hl :box 1))))
     `(magit-log-head-label-local ((,class (:background ,blue-lc :foreground ,blue-hc :box 1))))
     `(magit-log-head-label-patches ((,class (:background ,red-lc :foreground ,red-hc :box 1))))
     `(magit-log-head-label-remote ((,class (:background ,green-lc :foreground ,green-hc :box 1))))
     `(magit-log-head-label-tags ((,class (:background ,yellow-lc :foreground ,yellow-hc :box 1))))
     `(magit-log-sha1 ((,class (:foreground ,yellow))))

     ;; markdown-mode
     `(markdown-header-face ((,class (:foreground ,green))))
     `(markdown-header-face-1 ((,class (:inherit markdown-header-face :height ,prolusion-height-plus-4))))
     `(markdown-header-face-2 ((,class (:inherit markdown-header-face :height ,prolusion-height-plus-3))))
     `(markdown-header-face-3 ((,class (:inherit markdown-header-face :height ,prolusion-height-plus-2))))
     `(markdown-header-face-4 ((,class (:inherit markdown-header-face :height ,prolusion-height-plus-1))))
     `(markdown-header-face-5 ((,class (:inherit markdown-header-face))))
     `(markdown-header-face-6 ((,class (:inherit markdown-header-face))))

     ;; rainbow-delimiters
     `(rainbow-delimiters-depth-1-face ((,class (:foreground ,cyan))))
     `(rainbow-delimiters-depth-2-face ((,class (:foreground ,yellow))))
     `(rainbow-delimiters-depth-3-face ((,class (:foreground ,blue))))
     `(rainbow-delimiters-depth-4-face ((,class (:foreground ,orange))))
     `(rainbow-delimiters-depth-5-face ((,class (:foreground ,green))))
     `(rainbow-delimiters-depth-6-face ((,class (:foreground ,yellow))))
     `(rainbow-delimiters-depth-7-face ((,class (:foreground ,blue))))
     `(rainbow-delimiters-depth-8-face ((,class (:foreground ,orange))))
     `(rainbow-delimiters-depth-9-face ((,class (:foreground ,green))))
     `(rainbow-delimiters-depth-10-face ((,class (:foreground ,yellow))))
     `(rainbow-delimiters-depth-11-face ((,class (:foreground ,blue))))
     `(rainbow-delimiters-depth-12-face ((,class (:foreground ,orange))))
     `(rainbow-delimiters-unmatched-face
       ((,class (:foreground ,prolusion-fg :background ,prolusion-bg :inverse-video t))))

     ;; sh-mode
     `(sh-quoted-exec ((,class (:foreground ,violet :weight bold))))
     `(sh-escaped-newline ((,class (:foreground ,yellow :weight bold))))
     `(sh-heredoc ((,class (:foreground ,yellow :weight bold))))

     ;; smartparens
     `(sp-pair-overlay-face ((,class (:foreground ,prolusion-fg :background ,violet-d))))
     `(sp-wrap-overlay-face ((,class (:foreground ,prolusion-fg :background ,violet-d))))
     `(sp-wrap-tag-overlay-face ((,class (:foreground ,prolusion-fg :background ,violet-d))))
     `(sp-show-pair-enclosing ((,class (:foreground ,prolusion-fg :background ,prolusion-bg :weight bold t))))
     `(sp-show-pair-match-face ((,class (:foreground ,prolusion-fg :background ,prolusion-bg :weight bold t))))
     `(sp-show-pair-mismatch-face ((,class (:foreground ,prolusion-fg :background ,prolusion-bg :weight bold t))))

     ;; table
     `(table-cell ((,class (:foreground ,prolusion-fg :background ,prolusion-hl))))

     ;; term
     `(term-color-black ((t (:foreground ,base03 :background ,base02))))
     `(term-color-red ((t (:foreground ,red :background ,red-d))))
     `(term-color-green ((t (:foreground ,green :background ,green-d))))
     `(term-color-yellow ((t (:foreground ,yellow :background ,yellow-d))))
     `(term-color-blue ((t (:foreground ,blue :background ,blue-d))))
     `(term-color-magenta ((t (:foreground ,magenta :background ,magenta-d))))
     `(term-color-cyan ((t (:foreground ,cyan :background ,cyan-d))))
     `(term-color-white ((t (:foreground ,base00 :background ,base0))))
     '(term-default-fg-color ((t (:inherit term-color-white))))
     '(term-default-bg-color ((t (:inherit term-color-black))))

     ;; undo-tree
     `(undo-tree-visualizer-default-face ((,class (:foreground ,prolusion-comments :background ,prolusion-bg))))
     `(undo-tree-visualizer-unmodified-face ((,class (:foreground ,green))))
     `(undo-tree-visualizer-current-face ((,class (:foreground ,blue :inverse-video t))))
     `(undo-tree-visualizer-active-branch-face ((,class (:foreground ,prolusion-emph :background ,prolusion-bg :weight bold))))
     `(undo-tree-visualizer-register-face ((,class (:foreground ,yellow))))

     ;; volatile highlights
     `(vhl/default-face ((,class (:background ,green-lc :foreground ,green-hc))))

     ;; web-mode
     `(web-mode-builtin-face ((,class (:foreground ,red))))
     `(web-mode-comment-face ((,class (:foreground ,prolusion-comments))))
     `(web-mode-constant-face ((,class (:foreground ,blue :weight bold))))
     `(web-mode-current-element-highlight-face ((,class (:underline nil :weight normal :background ,prolusion-hl))))
     `(web-mode-css-at-rule-face ((,class (:foreground ,violet :slant italic))))
     `(web-mode-css-prop-face ((,class (:foreground ,violet))))
     `(web-mode-css-pseudo-class-face ((,class (:foreground ,green :slant italic))))
     `(web-mode-css-rule-face ((,class (:foreground ,blue))))
     `(web-mode-doctype-face ((,class (:foreground ,prolusion-comments :slant italic :weight bold))))
     `(web-mode-folded-face ((,class (:underline t))))
     `(web-mode-function-name-face ((,class (:foreground ,blue))))
     `(web-mode-html-attr-name-face ((,class (:foreground ,blue :slant normal))))
     `(web-mode-html-attr-value-face ((,class (:foreground ,cyan :slant italic))))
     `(web-mode-html-tag-face ((,class (:foreground ,green))))
     `(web-mode-keyword-face ((,class (:foreground ,yellow :weight bold))))
     `(web-mode-preprocessor-face ((,class (:foreground ,yellow  :slant italic :weight bold))))
     `(web-mode-string-face ((,class (:foreground ,cyan))))
     `(web-mode-type-face ((,class (:foreground ,yellow))))
     `(web-mode-variable-name-face ((,class (:foreground ,blue))))
     `(web-mode-server-background-face ((,class (:background ,prolusion-bg))))
     `(web-mode-server-comment-face ((,class (:inherit web-mode-comment-face))))
     `(web-mode-server-string-face ((,class (:inherit web-mode-string-face))))
     `(web-mode-warning-face ((,class (:inherit font-lock-warning-face))))
     `(web-mode-whitespaces-face ((,class (:background ,red))))

     ;; whitespace-mode
     `(whitespace-space ((,class (:background unspecified :foreground ,prolusion-comments :inverse-video unspecified :slant italic))))
     `(whitespace-hspace ((,class (:background unspecified :foreground ,prolusion-emph :inverse-video unspecified))))
     `(whitespace-tab ((,class (:background unspecified :foreground ,red :inverse-video unspecified :weight bold))))
     `(whitespace-newline ((,class(:background unspecified :foreground ,prolusion-comments :inverse-video unspecified))))
     `(whitespace-trailing ((,class (:background unspecified :foreground ,orange-lc :inverse-video t))))
     `(whitespace-line ((,class (:background unspecified :foreground ,magenta :inverse-video unspecified))))
     `(whitespace-space-before-tab ((,class (:background ,red-lc :foreground unspecified :inverse-video unspecified))))
     `(whitespace-indentation ((,class (:background unspecified :foreground ,yellow :inverse-video unspecified :weight bold))))
     `(whitespace-empty ((,class (:background unspecified :foreground ,red-lc :inverse-video t))))
     `(whitespace-space-after-tab ((,class (:background unspecified :foreground ,orange :inverse-video t :weight bold))))

     ;;;;; auctex
     `(font-latex-bold-face ((,class (:inherit bold :foreground ,base1))))
     `(font-latex-doctex-documentation-face ((,class (:background unspecified))))
     `(font-latex-doctex-preprocessor-face ((,class (:inherit (font-latex-doctex-documentation-face font-lock-builtin-face font-lock-preprocessor-face)))))
     `(font-latex-italic-face ((,class (:inherit italic :foreground ,base1))))
     `(font-latex-math-face ((,class (:foreground ,violet))))
     `(font-latex-sectioning-0-face ((,class (:inherit font-latex-sectioning-1-face :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-1-face ((,class (:inherit font-latex-sectioning-2-face :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-2-face ((,class (:inherit font-latex-sectioning-3-face :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-3-face ((,class (:inherit font-latex-sectioning-4-face :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-4-face ((,class (:inherit font-latex-sectioning-5-face :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-5-face ((,class (:inherit ,s-variable-pitch :foreground ,yellow :weight bold))))
     `(font-latex-sedate-face ((,class (:foreground ,base1))))
     `(font-latex-slide-title-face ((,class (:inherit (,s-variable-pitch font-lock-type-face) :weight bold :height ,prolusion-height-plus-3))))
     `(font-latex-string-face ((,class (:foreground ,cyan))))
     `(font-latex-subscript-face ((,class (:height ,prolusion-height-minus-1))))
     `(font-latex-superscript-face ((,class (:height ,prolusion-height-minus-1))))
     `(font-latex-verbatim-face ((,class (:inherit fixed-pitch :foreground ,base0 :slant italic))))
     `(font-latex-warning-face ((,class (:inherit bold :foreground ,orange))))

     ;; which-func-mode
     `(which-func ((,class (:foreground ,green))))

     ;; window-number-mode
     `(window-number-face ((,class (:foreground ,green))))

     ;; yascroll
     `(yascroll:thumb-text-area ((,class (:foreground ,prolusion-comments :background ,prolusion-comments))))
     `(yascroll:thumb-fringe ((,class (:foreground ,prolusion-comments :background ,prolusion-comments))))

     ;; compilation
     `(compilation-message-face 'default)

     ;; fill-column-indicator
     `(fci-rule-color ,prolusion-hl)

     ;; xcscope
     `(cscope-separator-face ((t (:foreground "VioletRed4" :weight bold :underline nil :overline nil))))

     ;; magit
     `(magit-diff-use-overlays nil)

     ;; highlight-changes
     `(highlight-changes-colors '(,magenta ,violet))

     ;; highlight-tail
     `(highlight-tail-colors '((,prolusion-hl . 0)(,green-lc . 20)(,cyan-lc . 30)(,blue-lc . 50) (,yellow-lc . 60)(,orange-lc . 70)(,magenta-lc . 85)(,prolusion-hl . 100))))

     (when childtheme (funcall childtheme))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion.el ends here
