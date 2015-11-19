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
         ;; prolusion palette
         (base03    "#101010") ;;"#002b36")
         (base02    "#202020") ;;"#073642")
         ;; emphasized content
         (base01    "#303030") ;;"#586e75")
         ;; primary content
         (base00    "#505050") ;; #657b83")
         (base0     "#b0b0b0") ;;"#839496")
         ;; comments
         (base1     "#d0d0d0") ;;"#93a1a1")
         ;; background highlight light
         (base2     "#e0e0e0") ;;"#eee8d5")
         ;; background light
         (base3     "#f5f5f5") ;;"#fdf6e3")

         ;; prolusion accented colors
         (yellow    "#b58900")
         (orange    "#cb4b16")
         (red       "#dc322f")
         (magenta   "#d33682")
         (violet    "#6c71c4")
         (blue      "#268bd2")
         (cyan      "#2aa198")
         (green     "#859900")

         ;; Darker and lighter accented colors
         ;; Only use these in exceptional circumstances!
         (yellow-d  "#7B6000")
         (yellow-l  "#DEB542")
         (orange-d  "#8B2C02")
         (orange-l  "#F2804F")
         (red-d     "#990A1B")
         (red-l     "#FF6E64")
         (magenta-d "#93115C")
         (magenta-l "#F771AC")
         (violet-d  "#3F4D91")
         (violet-l  "#9EA0E5")
         (blue-d    "#00629D")
         (blue-l    "#69B7F0")
         (cyan-d    "#00736F")
         (cyan-l    "#69CABF")
         (green-d   "#546E00")
         (green-l   "#B4C342")

         ;; Extreme values
         (ml-light "#e8e8e8")
         (ml-dark "#151515")

         ;; Light/Dark adaptive prolusion colors
         (prolusion-ml (if (eq variant 'light) ml-light ml-dark))
         (prolusion-fg (if (eq variant 'light) base00 base0))
         (prolusion-bg (if (eq variant 'light) base3 base03))
         (prolusion-hl (if (eq variant 'light) base2 base02))
         (prolusion-emph (if (eq variant 'light) base01 base1))
         (prolusion-comments (if (eq variant 'light) base0 base00))

         ;; Light/Dark adaptive higher/lower contrast accented colors
         ;; Only use these in exceptional cirmumstances!
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
         (s-variable-pitch (if prolusion-use-variable-pitch
                               'variable-pitch 'default))
         (s-fringe-bg (if prolusion-distinct-fringe-background
                          prolusion-hl prolusion-bg))

         (s-mode-line-fg (if prolusion-high-contrast-mode-line
                             prolusion-bg prolusion-fg))
         (s-mode-line-bg (if prolusion-high-contrast-mode-line
                             prolusion-fg prolusion-hl))

         (s-mode-line-buffer-id-fg (if prolusion-high-contrast-mode-line
                                       'unspecified prolusion-emph))
         (s-mode-line-inactive-fg (if prolusion-high-contrast-mode-line
                                      prolusion-fg prolusion-comments))
         (s-mode-line-inactive-bg (if prolusion-high-contrast-mode-line
                                      prolusion-hl prolusion-ml))
         (s-mode-line-inactive-bc (if prolusion-high-contrast-mode-line
                                      prolusion-fg prolusion-hl)))
    (custom-theme-set-faces
     theme-name
     '(button ((t (:underline t))))

     ;; basic coloring
     `(default ((,class (:foreground ,prolusion-fg :background ,prolusion-bg))))
     `(shadow ((,class (:foreground ,prolusion-comments))))
     `(match ((,class (:background ,prolusion-hl :foreground ,prolusion-emph :weight bold))))
     `(cursor ((,class (:foreground ,prolusion-bg :background ,prolusion-fg
                                    :inverse-video t))))
     `(mouse ((,class (:foreground ,prolusion-bg :background ,prolusion-fg
				   :inverse-video t))))
     `(escape-glyph-face ((,class (:foreground ,red))))
     `(fringe ((,class (:foreground ,prolusion-fg :background ,s-fringe-bg))))
     `(highlight ((,class (:background ,prolusion-hl))))
     `(link ((,class (:foreground ,yellow :underline t :weight bold))))
     `(link-visited ((,class (:foreground ,yellow :underline t :weight normal))))
     `(success ((,class (:foreground ,green ))))
     `(warning ((,class (:foreground ,yellow ))))
     `(error ((,class (:foreground ,orange))))
     `(lazy-highlight ((,class (:foreground ,prolusion-bg :background ,yellow
                                            :weight normal))))
     `(escape-glyph ((,class (:foreground ,violet))))

     ;; compilation
     `(compilation-column-face ((,class (:foreground ,cyan :underline nil))))
     `(compilation-column-number ((,class (:inherit font-lock-doc-face :foreground ,cyan
                                                    :underline nil))))
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

     `(compilation-mode-line-exit
       ((,class (:inherit compilation-info :foreground ,green :weight bold))))
     `(compilation-mode-line-fail
       ((,class (:inherit compilation-error :foreground ,red :weight bold))))
     `(compilation-mode-line-run ((,class (:foreground ,orange :weight bold))))

     ;; cua
     `(cua-global-mark ((,class (:background ,yellow :foreground ,prolusion-bg))))
     `(cua-rectangle ((,class (:inherit region
                                        :background ,magenta :foreground ,prolusion-bg))))
     `(cua-rectangle-noselect ((,class (:inherit region :background ,prolusion-hl
                                                 :foreground ,prolusion-comments))))

     ;; diary
     `(diary ((,class (:foreground ,yellow))))

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

     ;; ecb
     `(ecb-default-highlight-face ((,class (:background ,blue :foreground ,prolusion-bg))))
     `(ecb-history-bucket-node-dir-soure-path-face
       ((,class (:inherit ecb-history-bucket-node-face :foreground ,yellow))))
     `(ecb-source-in-directories-buffer-face ((,class (:inherit ecb-directories-general-face
                                                                :foreground ,prolusion-fg))))
     `(ecb-history-dead-buffer-face ((,class (:inherit ecb-history-general-face
                                                       :foreground ,prolusion-comments))))
     `(ecb-directory-not-accessible-face ((,class (:inherit ecb-directories-general-face
                                                            :foreground ,prolusion-comments))))
     `(ecb-bucket-node-face ((,class (:inherit ecb-default-general-face :weight normal
                                               :foreground ,blue))))
     `(ecb-tag-header-face ((,class (:background ,prolusion-hl))))
     `(ecb-analyse-bucket-element-face ((,class (:inherit ecb-analyse-general-face
                                                          :foreground ,green))))
     `(ecb-directories-general-face ((,class (:inherit ecb-default-general-face :height 1.0))))
     `(ecb-method-non-semantic-face ((,class (:inherit ecb-methods-general-face
                                                       :foreground ,cyan))))
     `(ecb-mode-line-prefix-face ((,class (:foreground ,green))))
     `(ecb-tree-guide-line-face ((,class (:inherit ecb-default-general-face
                                                   :foreground ,prolusion-hl :height 1.0))))

     ;; ee
     `(ee-bookmarked ((,class (:foreground ,prolusion-emph))))
     `(ee-category ((,class (:foreground ,blue))))
     `(ee-link ((,class (:inherit link))))
     `(ee-link-visited ((,class (:inherit link-visited))))
     `(ee-marked ((,class (:foreground ,magenta :weight bold))))
     `(ee-omitted ((,class (:foreground ,prolusion-comments))))
     `(ee-shadow ((,class (:inherit shadow))))

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
     `(mode-line
       ((,class (:inverse-video unspecified
                                ;; :underline unspecified
                                :box (:line-width 1 :color ,s-mode-line-bg :style unspecified)
                                :overline ,s-mode-line-bg
                                :underline ,s-mode-line-bg
                                :foreground ,s-mode-line-fg
                                :background ,s-mode-line-bg))))
     `(mode-line-buffer-id ((,class (:foreground ,s-mode-line-buffer-id-fg :weight bold))))
     `(mode-line-inactive
       ((,class (:inverse-video unspecified
                                ;; :underline unspecified
                                :box (:line-width 1 :color ,s-mode-line-inactive-bg :style unspecified)
                                :overline ,s-mode-line-inactive-bg
                                :underline ,s-mode-line-inactive-bg
                                :foreground ,s-mode-line-inactive-fg
                                :background ,s-mode-line-inactive-bg))))
     `(header-line
       ((,class (:inverse-video unspecified
                                :underline unspecified
                                :foreground ,prolusion-emph
                                :background ,prolusion-hl
                                :box (:line-width 1 :color ,prolusion-hl
                                                  :style unspecified)))))

     `(region ((,class (:foreground ,prolusion-bg :background ,prolusion-emph))))
     `(secondary-selection ((,class (:background ,prolusion-hl))))

     `(trailing-whitespace ((,class (:background ,red))))
     `(vertical-border ((,class (:foreground ,prolusion-ml))))

     ;; font lock
     `(font-lock-builtin-face ((,class (:foreground ,prolusion-fg :weight bold))))
     `(font-lock-comment-delimiter-face
       ((,class (:foreground ,prolusion-comments))))
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

     ;;; external

     ;; ace-jump-mode
     `(ace-jump-face-background
       ((,class (:foreground ,prolusion-comments :background ,prolusion-bg
                             :inverse-video nil))))
     `(ace-jump-face-foreground
       ((,class (:foreground ,red :background ,prolusion-bg :inverse-video nil :weight bold))))

     ;; auctex
     `(font-latex-bold-face ((,class (:inherit bold :foreground ,prolusion-emph))))
     `(font-latex-doctex-documentation-face ((,class (:background unspecified))))
     `(font-latex-doctex-preprocessor-face ((,class
                                             (:inherit (font-latex-doctex-documentation-face
                                                        font-lock-builtin-face
                                                        font-lock-preprocessor-face)))))
     `(font-latex-italic-face ((,class (:inherit italic :foreground ,prolusion-emph))))
     `(font-latex-math-face ((,class (:foreground ,violet))))
     `(font-latex-sectioning-0-face ((,class (:inherit font-latex-sectioning-1-face
                                                       :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-1-face ((,class (:inherit font-latex-sectioning-2-face
                                                       :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-2-face ((,class (:inherit font-latex-sectioning-3-face
                                                       :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-3-face ((,class (:inherit font-latex-sectioning-4-face
                                                       :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-4-face ((,class (:inherit font-latex-sectioning-5-face
                                                       :height ,prolusion-height-plus-1))))
     `(font-latex-sectioning-5-face ((,class (:inherit ,s-variable-pitch :foreground ,yellow
                                                       :weight bold))))
     `(font-latex-sedate-face ((,class (:foreground ,prolusion-emph))))
     `(font-latex-slide-title-face ((,class (:inherit (,s-variable-pitch font-lock-type-face)
                                                      :weight bold :height ,prolusion-height-plus-3))))
     `(font-latex-string-face ((,class (:foreground ,cyan))))
     `(font-latex-subscript-face ((,class (:height ,prolusion-height-minus-1))))
     `(font-latex-superscript-face ((,class (:height ,prolusion-height-minus-1))))
     `(font-latex-verbatim-face ((,class (:inherit fixed-pitch :foreground ,prolusion-fg
                                                   :slant italic))))
     `(font-latex-warning-face ((,class (:inherit bold :foreground ,orange))))

     ;; auto-complete
     `(ac-candidate-face ((,class (:background ,prolusion-hl :foreground ,cyan))))
     `(ac-selection-face ((,class (:background ,cyan-lc :foreground ,cyan-hc))))
     `(ac-candidate-mouse-face ((,class (:background ,cyan-hc :foreground ,cyan-lc))))
     `(ac-completion-face ((,class (:foreground ,prolusion-emph :underline t))))
     `(ac-gtags-candidate-face ((,class (:background ,prolusion-hl :foreground ,blue))))
     `(ac-gtags-selection-face ((,class (:background ,blue-lc :foreground ,blue-hc))))
     `(ac-yasnippet-candidate-face ((,class (:background ,prolusion-hl :foreground ,yellow))))
     `(ac-yasnippet-selection-face ((,class (:background ,yellow-lc :foreground ,yellow-hc))))

     ;; auto highlight symbol
     `(ahs-definition-face ((,class (:foreground ,magenta :background unspecified
                                                 :slant normal))))
     `(ahs-edit-mode-face ((,class (:foreground ,prolusion-bg :background ,magenta))))
     `(ahs-face ((,class (:foreground ,magenta :background unspecified))))
     `(ahs-plugin-bod-face ((,class (:foreground ,magenta :background unspecified ))))
     `(ahs-plugin-defalt-face ((,class (:foreground ,magenta :background unspecified))))
     `(ahs-plugin-whole-buffer-face ((,class (:foreground ,magenta  :background unspecified))))
     `(ahs-warning-face ((,class (:foreground ,red :weight bold))))

     ;; android mode
     `(android-mode-debug-face ((,class (:foreground ,green))))
     `(android-mode-error-face ((,class (:foreground ,orange :weight bold))))
     `(android-mode-info-face ((,class (:foreground ,prolusion-fg))))
     `(android-mode-verbose-face ((,class (:foreground ,prolusion-comments))))
     `(android-mode-warning-face ((,class (:foreground ,yellow))))

     ;; anzu-mode
     `(anzu-mode-line ((,class (:foreground ,magenta :weight bold))))

     ;; bm
     `(bm-face ((,class (:background ,yellow-lc :foreground ,prolusion-bg))))
     `(bm-fringe-face ((,class (:background ,yellow-lc :foreground ,prolusion-bg))))
     `(bm-fringe-persistent-face ((,class (:background ,green-lc :foreground ,prolusion-bg))))
     `(bm-persistent-face ((,class (:background ,green-lc :foreground ,prolusion-bg))))

     ;; calfw
     `(cfw:face-day-title ((,class (:background ,prolusion-hl))))
     `(cfw:face-annotation ((,class (:inherit cfw:face-day-title :foreground ,yellow))))
     `(cfw:face-default-content ((,class (:foreground ,green))))
     `(cfw:face-default-day ((,class (:inherit cfw:face-day-title :weight bold))))
     `(cfw:face-disable ((,class (:inherit cfw:face-day-title
                                           :foreground ,prolusion-comments))))
     `(cfw:face-grid ((,class (:foreground ,prolusion-comments))))
     `(cfw:face-header ((,class (:foreground ,blue-hc :background ,blue-lc :weight bold))))
     `(cfw:face-holiday ((,class (:background nil :foreground ,red :weight bold))))
     `(cfw:face-periods ((,class (:foreground ,magenta))))
     `(cfw:face-select ((,class (:background ,magenta-lc :foreground ,magenta-hc))))
     `(cfw:face-saturday ((,class (:foreground ,cyan-hc :background ,cyan-lc))))
     `(cfw:face-sunday ((,class (:foreground ,red-hc :background ,red-lc :weight bold))))
     `(cfw:face-title ((,class (:inherit ,s-variable-pitch :foreground ,yellow
                                         :weight bold :height ,prolusion-height-plus-4))))
     `(cfw:face-today ((,class (:weight bold :background ,prolusion-hl :foreground nil))))
     `(cfw:face-today-title ((,class (:background ,yellow-lc
                                                  :foreground ,yellow-hc :weight bold))))
     `(cfw:face-toolbar ((,class (:background ,prolusion-hl :foreground ,prolusion-fg))))
     `(cfw:face-toolbar-button-off ((,class (:background ,yellow-lc :foreground ,yellow-hc
                                                         :weight bold))))
     `(cfw:face-toolbar-button-on ((,class (:background ,yellow-hc :foreground ,yellow-lc
                                                        :weight bold))))

     ;; clojure-test-mode
     `(clojure-test-failure-face ((t (:foreground ,orange :weight bold :underline t))))
     `(clojure-test-error-face ((t (:foreground ,red :weight bold :underline t))))
     `(clojure-test-success-face ((t (:foreground ,green :weight bold :underline t))))

     ;; cscope
     `(cscope-file-face ((,class (:foreground ,green :weight bold))))
     `(cscope-function-face ((,class (:foreground ,blue))))
     `(cscope-line-number-face ((,class (:foreground ,yellow))))
     `(cscope-line-face ((,class (:foreground ,prolusion-fg))))
     `(cscope-mouse-face ((,class (:background ,blue :foreground ,prolusion-fg))))

     ;; ctable
     `(ctbl:face-cell-select ((,class (:background ,prolusion-hl :foreground ,prolusion-emph
                                                   :underline ,prolusion-emph :weight bold))))
     `(ctbl:face-continue-bar ((,class (:background ,prolusion-hl :foreground ,yellow))))
     `(ctbl:face-row-select ((,class (:background ,prolusion-hl :foreground ,prolusion-fg
                                                  :underline t))))

     ;; coffee
     `(coffee-mode-class-name ((,class (:foreground ,yellow :weight bold))))
     `(coffee-mode-function-param ((,class (:foreground ,violet :slant italic))))

     ;; custom
     `(custom-face-tag ((,class (:inherit ,s-variable-pitch :height ,prolusion-height-plus-3
                                          :foreground ,violet :weight bold))))
     `(custom-variable-tag ((,class (:inherit ,s-variable-pitch
                                              :foreground ,cyan :height ,prolusion-height-plus-3))))
     `(custom-comment-tag ((,class (:foreground ,prolusion-comments))))
     `(custom-group-tag ((,class (:inherit ,s-variable-pitch :foreground ,blue :height ,prolusion-height-plus-3))))
     `(custom-group-tag-1 ((,class (:inherit ,s-variable-pitch :foreground ,red :height ,prolusion-height-plus-3))))
     `(custom-state ((,class (:foreground ,green))))

     ;; diff
     `(diff-added ((,class (:foreground ,green :background ,prolusion-bg))))
     `(diff-changed ((,class (:foreground ,blue :background ,prolusion-bg))))
     `(diff-removed ((,class (:foreground ,red :background ,prolusion-bg))))
     `(diff-header ((,class (:background ,prolusion-bg))))
     `(diff-file-header
       ((,class (:background ,prolusion-bg :foreground ,prolusion-fg :weight bold))))
     `(diff-refine-added ((,class :foreground ,prolusion-bg :background ,green)))
     `(diff-refine-change ((,class :foreground ,prolusion-bg :background ,blue)))
     `(diff-refine-removed ((,class (:foreground ,prolusion-bg :background ,red))))

     ;; ediff
     `(ediff-fine-diff-A ((,class (:background ,orange-lc))))
     `(ediff-fine-diff-B ((,class (:background ,green-lc))))
     `(ediff-fine-diff-C ((,class (:background ,yellow-lc))))

     `(ediff-current-diff-C ((,class (:background ,blue-lc))))

     `(ediff-even-diff-A ((,class (:background ,prolusion-comments
                                               :foreground ,prolusion-fg-lc ))))
     `(ediff-odd-diff-A ((,class (:background ,prolusion-comments
                                              :foreground ,prolusion-fg-hc ))))
     `(ediff-even-diff-B ((,class (:background ,prolusion-comments
                                               :foreground ,prolusion-fg-hc ))))
     `(ediff-odd-diff-B ((,class (:background ,prolusion-comments
                                              :foreground ,prolusion-fg-lc ))))
     `(ediff-even-diff-C ((,class (:background ,prolusion-comments
                                               :foreground ,prolusion-fg ))))
     `(ediff-odd-diff-C ((,class (:background ,prolusion-comments
                                              :foreground ,prolusion-bg ))))

     ;; diff-hl
     `(diff-hl-change ((,class (:background ,blue-lc  :foreground ,blue-hc))))
     `(diff-hl-delete ((,class (:background ,red-lc  :foreground ,red-hc))))
     `(diff-hl-insert ((,class (:background ,green-lc  :foreground ,green-hc))))
     `(diff-hl-unknown ((,class (:background ,cyan-lc   :foreground ,cyan-hc))))

     ;; elfeed
     `(elfeed-search-date-face ((,class (:foreground ,prolusion-comments))))
     `(elfeed-search-feed-face ((,class (:foreground ,prolusion-comments))))
     `(elfeed-search-tag-face ((,class (:foreground ,prolusion-fg))))
     `(elfeed-search-title-face ((,class (:foreground ,cyan))))

     ;; epc
     `(epc:face-title ((,class (:foreground ,blue :background ,prolusion-bg
                                            :weight normal :underline nil))))

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

     ;; fic
     `(fic-author-face ((,class (:background ,prolusion-bg :foreground ,orange
                                             :underline t :slant italic))))
     `(fic-face ((,class (:background ,prolusion-bg :foreground ,orange
                                      :weight normal :slant italic))))

     ;; flx
     `(flx-highlight-face ((,class (:foreground ,blue
                                                :weight normal :underline nil))))

     ;; flymake
     `(flymake-errline
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,red) :inherit unspecified
                     :foreground unspecified :background unspecified))
        (,class (:foreground ,red-hc :background ,red-lc :weight bold :underline t))))
     `(flymake-infoline
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,green) :inherit unspecified
                     :foreground unspecified :background unspecified))
        (,class (:foreground ,green-hc :background ,green-lc))))
     `(flymake-warnline
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,yellow) :inherit unspecified
                     :foreground unspecified :background unspecified))
        (,class (:foreground ,yellow-hc :background ,yellow-lc :weight bold :underline t))))

     ;; flycheck
     `(flycheck-error
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,red) :inherit unspecified))
        (,class (:foreground ,red-hc :background ,red-lc :weight bold :underline t))))
     `(flycheck-warning
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,yellow) :inherit unspecified))
        (,class (:foreground ,yellow-hc :background ,yellow-lc :weight bold :underline t))))
     `(flycheck-fringe-error
       ((,class (:foreground ,red-hc :background ,red-lc :weight bold))))
     `(flycheck-fringe-warning
       ((,class (:foreground ,yellow-hc :background ,yellow-lc :weight bold))))

     ;; flyspell
     `(flyspell-duplicate
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,yellow) :inherit unspecified))
        (,class (:foreground ,yellow :weight bold :underline t))))
     `(flyspell-incorrect
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,red) :inherit unspecified))
        (,class (:foreground ,red :weight bold :underline t))))

     ;; erc
     `(erc-action-face ((,class (:inherit erc-default-face))))
     `(erc-bold-face ((,class (:weight bold))))
     `(erc-current-nick-face ((,class (:foreground ,blue :weight bold))))
     `(erc-dangerous-host-face ((,class (:inherit font-lock-warning-face))))
     `(erc-default-face ((,class (:foreground ,prolusion-fg))))
     `(erc-highlight-face ((,class (:inherit erc-default-face
                                             :background ,prolusion-hl))))
     `(erc-direct-msg-face ((,class (:inherit erc-default-face))))
     `(erc-error-face ((,class (:inherit font-lock-warning-face))))
     `(erc-fool-face ((,class (:inherit erc-default-face))))
     `(erc-input-face ((,class (:foreground ,yellow))))
     `(erc-keyword-face ((,class (:foreground ,blue :weight bold))))
     `(erc-nick-default-face ((,class (:foreground ,yellow :weight bold))))
     `(erc-my-nick-face ((,class (:foreground ,red :weight bold))))
     `(erc-nick-msg-face ((,class (:inherit erc-default-face))))
     `(erc-notice-face ((,class (:foreground ,green))))
     `(erc-pal-face ((,class (:foreground ,orange :weight bold))))
     `(erc-prompt-face ((,class (:foreground ,orange :background ,prolusion-bg :weight bold))))
     `(erc-timestamp-face ((,class (:foreground ,green))))
     `(erc-underline-face ((t (:underline t))))

     ;; git-gutter
     `(git-gutter:added ((,class (:background ,green :foreground ,prolusion-bg
                                              :weight bold))))
     `(git-gutter:deleted ((,class (:background ,red :foreground ,prolusion-bg
                                                :weight bold))))
     `(git-gutter:modified ((,class (:background ,blue :foreground ,prolusion-bg
                                                 :weight bold))))
     `(git-gutter:unchanged ((,class (:background ,prolusion-hl
                                                  :foreground ,prolusion-bg
                                                  :weight bold))))

     ;; git-gutter-fr
     `(git-gutter-fr:added ((,class (:foreground ,green  :weight bold))))
     `(git-gutter-fr:deleted ((,class (:foreground ,red :weight bold))))
     `(git-gutter-fr:modified ((,class (:foreground ,blue :weight bold))))

     ;; git-gutter+ and git-gutter+-fr
     `(git-gutter+-added ((,class (:background ,green :foreground ,prolusion-bg
                                               :weight bold))))
     `(git-gutter+-deleted ((,class (:background ,red :foreground ,prolusion-bg
                                                 :weight bold))))
     `(git-gutter+-modified ((,class (:background ,blue :foreground ,prolusion-bg
                                                  :weight bold))))
     `(git-gutter+-unchanged ((,class (:background ,prolusion-hl
                                                   :foreground ,prolusion-bg
                                                   :weight bold))))
     `(git-gutter-fr+-added ((,class (:foreground ,green  :weight bold))))
     `(git-gutter-fr+-deleted ((,class (:foreground ,red :weight bold))))
     `(git-gutter-fr+-modified ((,class (:foreground ,blue :weight bold))))

     ;; guide-key
     `(guide-key/highlight-command-face ((,class (:foreground ,blue))))
     `(guide-key/key-face ((,class (:foreground ,prolusion-comments))))
     `(guide-key/prefix-command-face ((,class (:foreground ,green))))

     ;; gnus
     `(gnus-group-mail-1 ((,class (:weight bold :inherit gnus-group-mail-1-empty))))
     `(gnus-group-mail-1-empty ((,class (:inherit gnus-group-news-1-empty))))
     `(gnus-group-mail-2 ((,class (:weight bold :inherit gnus-group-mail-2-empty))))
     `(gnus-group-mail-2-empty ((,class (:inherit gnus-group-news-2-empty))))
     `(gnus-group-mail-3 ((,class (:weight bold :inherit gnus-group-mail-3-empty))))
     `(gnus-group-mail-3-empty ((,class (:inherit gnus-group-news-3-empty))))
     `(gnus-group-mail-low ((,class (:weight bold :inherit gnus-group-mail-low-empty))))
     `(gnus-group-mail-low-empty ((,class (:inherit gnus-group-news-low-empty))))
     `(gnus-group-news-1 ((,class (:weight bold :inherit gnus-group-news-1-empty))))
     `(gnus-group-news-2 ((,class (:weight bold :inherit gnus-group-news-2-empty))))
     `(gnus-group-news-3 ((,class (:weight bold :inherit gnus-group-news-3-empty))))
     `(gnus-group-news-4 ((,class (:weight bold :inherit gnus-group-news-4-empty))))
     `(gnus-group-news-5 ((,class (:weight bold :inherit gnus-group-news-5-empty))))
     `(gnus-group-news-6 ((,class (:weight bold :inherit gnus-group-news-6-empty))))
     `(gnus-group-news-low ((,class (:weight bold :inherit gnus-group-news-low-empty))))
     `(gnus-header-content ((,class (:inherit message-header-other))))
     `(gnus-header-from ((,class (:inherit message-header-other))))
     `(gnus-header-name ((,class (:inherit message-header-name))))
     `(gnus-header-newsgroups ((,class (:inherit message-header-other))))
     `(gnus-header-subject ((,class (:inherit message-header-subject))))
     `(gnus-summary-cancelled ((,class (:foreground ,orange))))
     `(gnus-summary-high-ancient ((,class (:foreground ,blue :weight bold))))
     `(gnus-summary-high-read ((,class (:foreground ,green :weight bold))))
     `(gnus-summary-high-ticked ((,class (:foreground ,orange :weight bold))))
     `(gnus-summary-high-unread ((,class (:foreground ,prolusion-fg :weight bold))))
     `(gnus-summary-low-ancient ((,class (:foreground ,blue))))
     `(gnus-summary-low-read ((t (:foreground ,green))))
     `(gnus-summary-low-ticked ((,class (:foreground ,orange))))
     `(gnus-summary-low-unread ((,class (:foreground ,prolusion-fg))))
     `(gnus-summary-normal-ancient ((,class (:foreground ,blue))))
     `(gnus-summary-normal-read ((,class (:foreground ,green))))
     `(gnus-summary-normal-ticked ((,class (:foreground ,orange))))
     `(gnus-summary-normal-unread ((,class (:foreground ,prolusion-fg))))
     `(gnus-summary-selected ((,class (:foreground ,yellow :weight bold))))
     `(gnus-cite-1 ((,class (:foreground ,blue))))
     `(gnus-cite-2 ((,class (:foreground ,blue))))
     `(gnus-cite-3 ((,class (:foreground ,blue))))
     `(gnus-cite-4 ((,class (:foreground ,green))))
     `(gnus-cite-5 ((,class (:foreground ,green))))
     `(gnus-cite-6 ((,class (:foreground ,green))))
     `(gnus-cite-7 ((,class (:foreground ,red))))
     `(gnus-cite-8 ((,class (:foreground ,red))))
     `(gnus-cite-9 ((,class (:foreground ,red))))
     `(gnus-cite-10 ((,class (:foreground ,yellow))))
     `(gnus-cite-11 ((,class (:foreground ,yellow))))
     `(gnus-group-news-1-empty ((,class (:foreground ,yellow))))
     `(gnus-group-news-2-empty ((,class (:foreground ,green))))
     `(gnus-group-news-3-empty ((,class (:foreground ,green))))
     `(gnus-group-news-4-empty ((,class (:foreground ,blue))))
     `(gnus-group-news-5-empty ((,class (:foreground ,blue))))
     `(gnus-group-news-6-empty ((,class (:foreground ,blue-lc))))
     `(gnus-group-news-low-empty ((,class (:foreground ,prolusion-comments))))
     `(gnus-signature ((,class (:foreground ,yellow))))
     `(gnus-x-face ((,class (:background ,prolusion-fg :foreground ,prolusion-bg))))

     ;; helm (these probably needs tweaking)
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
     `(helm-buffer-saved-out ((,class (:foreground ,red :background ,prolusion-bg
                                                   :inverse-video t))))
     `(helm-buffer-size ((,class (:foreground ,prolusion-comments))))
     `(helm-candidate-number ((,class (:background ,prolusion-hl :foreground ,prolusion-emph
                                                   :bold t))))
     `(helm-ff-directory ((,class (:background ,prolusion-bg  :foreground ,blue))))
     `(helm-ff-executable ((,class (:foreground ,green))))
     `(helm-ff-file ((,class (:background ,prolusion-bg :foreground ,prolusion-fg))))
     `(helm-ff-invalid-symlink ((,class (:background ,prolusion-bg :foreground ,orange
                                                     :slant italic))))
     `(helm-ff-prefix ((,class (:background ,yellow :foreground ,prolusion-bg))))
     `(helm-ff-symlink ((,class (:foreground ,cyan))))
     `(helm-grep-file ((,class (:foreground ,cyan :underline t))))
     `(helm-grep-finish ((,class (:foreground ,green))))
     `(helm-grep-lineno ((,class (:foreground ,orange))))
     `(helm-grep-match ((,class (:inherit match))))
     `(helm-grep-running ((,class (:foreground ,red))))
     `(helm-header ((,class (:inherit header-line))))
     `(helm-lisp-completion-info ((,class (:foreground ,prolusion-fg))))
     `(helm-lisp-show-completion ((,class (:foreground ,yellow  :background ,prolusion-hl
                                                       :bold t))))
     `(helm-M-x-key ((,class (:foreground ,orange :underline t))))
     `(helm-moccur-buffer ((,class (:foreground ,cyan :underline t))))
     `(helm-match ((,class (:inherit match))))
     `(helm-selection ((,class (:background ,prolusion-hl :underline t))))
     `(helm-selection-line ((,class (:background ,prolusion-hl :foreground ,prolusion-emph
                                                 :underline nil))))
     `(helm-separator ((,class (:foreground ,red))))
     `(helm-source-header ((,class (:background ,blue-lc :foreground ,prolusion-bg
                                                :underline nil))))
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
     `(hi-black-hb ((,class (:foreground ,prolusion-emph :background ,prolusion-bg
                                         :weight bold))))

     ;; highlight-changes
     `(highlight-changes ((,class (:foreground ,orange))))
     `(highlight-changes-delete ((,class (:foreground ,red :underline t))))

     ;; highlight-indentation
     `(highlight-indentation-face ((,class (:background ,prolusion-hl))))
     `(highlight-indentation-current-column-face((,class (:background ,prolusion-hl))))

     ;; hl-line-mode
     `(hl-line ((,class (:background ,prolusion-hl))))
     `(hl-line-face ((,class (:background ,prolusion-hl))))

     ;; ido-mode
     `(ido-first-match ((,class (:foreground ,yellow :weight normal))))
     `(ido-only-match ((,class (:foreground ,prolusion-bg :background ,yellow :weight normal))))
     `(ido-subdir ((,class (:foreground ,blue))))
     `(ido-incomplete-regexp ((,class (:foreground ,red :weight bold ))))
     `(ido-indicator ((,class (:background ,red :foreground ,prolusion-bg :width condensed))))
     `(ido-virtual ((,class (:foreground ,cyan))))

     `(jabber-activity-face ((,class (:weight bold :foreground ,red))))
     `(jabber-activity-personal-face ((,class (:weight bold :foreground ,blue))))
     `(jabber-chat-error ((,class (:weight bold :foreground ,red))))
     `(jabber-chat-prompt-foreign ((,class (:weight bold :foreground ,red))))
     `(jabber-chat-prompt-local ((,class (:weight bold :foreground ,blue))))
     `(jabber-chat-prompt-system ((,class (:weight bold :foreground ,green))))
     `(jabber-chat-text-foreign ((,class (:foreground ,base1))))
     `(jabber-chat-text-local ((,class (:foreground ,base0))))
     `(jabber-chat-rare-time-face ((,class (:underline t :foreground ,green))))
     `(jabber-roster-user-away ((,class (:slant italic :foreground ,green))))
     `(jabber-roster-user-chatty ((,class (:weight bold :foreground ,orange))))
     `(jabber-roster-user-dnd ((,class (:slant italic :foreground ,red))))
     `(jabber-roster-user-error ((,class (:weight light :slant italic :foreground ,red))))
     `(jabber-roster-user-offline ((,class (:foreground ,base01))))
     `(jabber-roster-user-online ((,class (:weight bold :foreground ,blue))))
     `(jabber-roster-user-xa ((,class (:slant italic :foreground ,magenta))))

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

     ;; jedi
     `(jedi:highlight-function-argument ((,class (:inherit bold))))

     ;; linum-mode
     `(linum ((,class (:foreground ,prolusion-comments :background ,s-fringe-bg))))

     ;; lusty-explorer
     `(lusty-directory-face ((,class (:inherit dired-directory))))
     `(lusty-file-face ((,class nil)))
     `(lusty-match-face ((,class (:inherit ido-first-match))))
     `(lusty-slash-face ((,class (:foreground ,cyan :weight bold))))

     ;; magit
     `(magit-section-title ((,class (:foreground ,yellow :weight bold))))
     `(magit-branch ((,class (:foreground ,orange :weight bold))))
     `(magit-item-highlight ((,class (:background ,prolusion-hl :weight unspecified))))
     `(magit-log-author ((,class (:foreground ,cyan))))
     `(magit-log-graph ((,class (:foreground ,prolusion-comments))))
     `(magit-log-head-label-bisect-bad ((,class (:background ,red-hc :foreground ,red-lc
                                                             :box 1))))
     `(magit-log-head-label-bisect-good ((,class (:background ,green-hc :foreground ,green-lc
                                                              :box 1))))
     `(magit-log-head-label-default ((,class (:background ,prolusion-hl :box 1))))
     `(magit-log-head-label-local ((,class (:background ,blue-lc :foreground ,blue-hc
                                                        :box 1))))
     `(magit-log-head-label-patches ((,class (:background ,red-lc :foreground ,red-hc
                                                          :box 1))))
     `(magit-log-head-label-remote ((,class (:background ,green-lc :foreground ,green-hc
                                                         :box 1))))
     `(magit-log-head-label-tags ((,class (:background ,yellow-lc :foreground ,yellow-hc
                                                       :box 1))))
     `(magit-log-sha1 ((,class (:foreground ,yellow))))

     ;; markdown-mode
     `(markdown-header-face ((,class (:foreground ,green))))
     `(markdown-header-face-1 ((,class (:inherit markdown-header-face :height ,prolusion-height-plus-4))))
     `(markdown-header-face-2 ((,class (:inherit markdown-header-face :height ,prolusion-height-plus-3))))
     `(markdown-header-face-3 ((,class (:inherit markdown-header-face :height ,prolusion-height-plus-2))))
     `(markdown-header-face-4 ((,class (:inherit markdown-header-face :height ,prolusion-height-plus-1))))
     `(markdown-header-face-5 ((,class (:inherit markdown-header-face))))
     `(markdown-header-face-6 ((,class (:inherit markdown-header-face))))

     ;; message-mode
     `(message-cited-text ((,class (:foreground ,prolusion-comments))))
     `(message-header-name ((,class (:foreground ,prolusion-comments))))
     `(message-header-other ((,class (:foreground ,prolusion-fg :weight normal))))
     `(message-header-to ((,class (:foreground ,prolusion-fg :weight normal))))
     `(message-header-cc ((,class (:foreground ,prolusion-fg :weight normal))))
     `(message-header-newsgroups ((,class (:foreground ,yellow :weight bold))))
     `(message-header-subject ((,class (:foreground ,cyan :weight normal))))
     `(message-header-xheader ((,class (:foreground ,cyan))))
     `(message-mml ((,class (:foreground ,yellow :weight bold))))
     `(message-separator ((,class (:foreground ,prolusion-comments :slant italic))))

     ;; mew
     `(mew-face-header-subject ((,class (:foreground ,orange))))
     `(mew-face-header-from ((,class (:foreground ,yellow))))
     `(mew-face-header-date ((,class (:foreground ,green))))
     `(mew-face-header-to ((,class (:foreground ,red))))
     `(mew-face-header-key ((,class (:foreground ,green))))
     `(mew-face-header-private ((,class (:foreground ,green))))
     `(mew-face-header-important ((,class (:foreground ,blue))))
     `(mew-face-header-marginal ((,class (:foreground ,prolusion-fg :weight bold))))
     `(mew-face-header-warning ((,class (:foreground ,red))))
     `(mew-face-header-xmew ((,class (:foreground ,green))))
     `(mew-face-header-xmew-bad ((,class (:foreground ,red))))
     `(mew-face-body-url ((,class (:foreground ,orange))))
     `(mew-face-body-comment ((,class (:foreground ,prolusion-fg :slant italic))))
     `(mew-face-body-cite1 ((,class (:foreground ,green))))
     `(mew-face-body-cite2 ((,class (:foreground ,blue))))
     `(mew-face-body-cite3 ((,class (:foreground ,orange))))
     `(mew-face-body-cite4 ((,class (:foreground ,yellow))))
     `(mew-face-body-cite5 ((,class (:foreground ,red))))
     `(mew-face-mark-review ((,class (:foreground ,blue))))
     `(mew-face-mark-escape ((,class (:foreground ,green))))
     `(mew-face-mark-delete ((,class (:foreground ,red))))
     `(mew-face-mark-unlink ((,class (:foreground ,yellow))))
     `(mew-face-mark-refile ((,class (:foreground ,green))))
     `(mew-face-mark-unread ((,class (:foreground ,red))))
     `(mew-face-eof-message ((,class (:foreground ,green))))
     `(mew-face-eof-part ((,class (:foreground ,yellow))))

     ;; mingus
     `(mingus-directory-face ((,class (:foreground ,blue))))
     `(mingus-pausing-face ((,class (:foreground ,magenta))))
     `(mingus-playing-face ((,class (:foreground ,cyan))))
     `(mingus-playlist-face ((,class (:foreground ,cyan ))))
     `(mingus-song-file-face ((,class (:foreground ,yellow))))
     `(mingus-stopped-face ((,class (:foreground ,red))))

     ;; moccur
     `(moccur-current-line-face ((,class (:underline t))))
     `(moccur-edit-done-face ((,class
                               (:foreground ,prolusion-comments
                                            :background ,prolusion-bg
                                            :slant italic))))
     `(moccur-edit-face
       ((,class (:background ,yellow :foreground ,prolusion-bg))))
     `(moccur-edit-file-face ((,class (:background ,prolusion-hl))))
     `(moccur-edit-reject-face ((,class (:foreground ,red))))
     `(moccur-face ((,class (:background ,prolusion-hl :foreground ,prolusion-emph
                                         :weight bold))))
     `(search-buffers-face ((,class (:background ,prolusion-hl :foreground ,prolusion-emph
                                                 :weight bold))))
     `(search-buffers-header-face ((,class (:background ,prolusion-hl :foreground ,yellow
                                                        :weight bold))))

     ;; mu4e
     `(mu4e-cited-1-face ((,class (:foreground ,green :slant italic :weight normal))))
     `(mu4e-cited-2-face ((,class (:foreground ,blue :slant italic :weight normal))))
     `(mu4e-cited-3-face ((,class (:foreground ,orange :slant italic :weight normal))))
     `(mu4e-cited-4-face ((,class (:foreground ,yellow :slant italic :weight normal))))
     `(mu4e-cited-5-face ((,class (:foreground ,cyan :slant italic :weight normal))))
     `(mu4e-cited-6-face ((,class (:foreground ,green :slant italic :weight normal))))
     `(mu4e-cited-7-face ((,class (:foreground ,blue :slant italic :weight normal))))
     `(mu4e-flagged-face ((,class (:foreground ,magenta :weight bold))))
     `(mu4e-view-url-number-face ((,class (:foreground ,yellow :weight normal))))
     `(mu4e-warning-face ((,class (:foreground ,red :slant normal :weight bold))))
     `(mu4e-header-highlight-face
       ((,class (:inherit unspecified :foreground unspecified :background ,prolusion-hl
                          :underline ,prolusion-emph  :weight normal))))

     `(mu4e-draft-face ((,class (:inherit font-lock-string-face))))
     `(mu4e-footer-face ((,class (:inherit font-lock-comment-face))))
     `(mu4e-forwarded-face ((,class (:inherit font-lock-builtin-face :weight normal))))
     `(mu4e-header-face ((,class (:inherit default))))
     `(mu4e-header-marks-face ((,class (:inherit font-lock-preprocessor-face))))
     `(mu4e-header-title-face ((,class (:inherit font-lock-type-face))))
     `(mu4e-highlight-face ((,class (:inherit font-lock-pseudo-keyword-face :weight bold))))
     `(mu4e-moved-face ((,class (:inherit font-lock-comment-face :slant italic))))
     `(mu4e-ok-face ((,class (:inherit font-lock-comment-face :slant normal :weight bold))))
     `(mu4e-replied-face ((,class (:inherit font-lock-builtin-face :weight normal))))
     `(mu4e-system-face ((,class (:inherit font-lock-comment-face :slant italic))))
     `(mu4e-title-face ((,class (:inherit font-lock-type-face :weight bold))))
     `(mu4e-trashed-face ((,class (:inherit font-lock-comment-face :strike-through t))))
     `(mu4e-unread-face ((,class (:inherit font-lock-keyword-face :weight bold))))
     `(mu4e-view-attach-number-face ((,class (:inherit font-lock-variable-name-face :weight bold))))
     `(mu4e-view-contact-face ((,class (:foreground ,prolusion-fg  :weight normal))))
     `(mu4e-view-header-key-face ((,class (:inherit message-header-name :weight normal))))
     `(mu4e-view-header-value-face ((,class (:foreground ,cyan :weight normal :slant normal))))
     `(mu4e-view-link-face ((,class (:inherit link))))
     `(mu4e-view-special-header-value-face ((,class (:foreground ,blue :weight normal :underline nil
                                                                 ))))
     ;; mumamo
     `(mumamo-background-chunk-submode1 ((,class (:background ,prolusion-hl))))

     ;; nav
     `(nav-face-heading ((,class (:foreground ,yellow))))
     `(nav-face-button-num ((,class (:foreground ,cyan))))
     `(nav-face-dir ((,class (:foreground ,green))))
     `(nav-face-hdir ((,class (:foreground ,red))))
     `(nav-face-file ((,class (:foreground ,prolusion-fg))))
     `(nav-face-hfile ((,class (:foreground ,red))))

     ;; nav-flash
     `(nav-flash-face ((,class (:background ,prolusion-hl))))

     ;; org-mode
     `(org-agenda-structure
       ((,class (:foreground ,prolusion-emph :background ,prolusion-hl
                             :weight bold :slant normal :inverse-video nil :height ,prolusion-height-plus-1
                             :underline nil
                             :box (:line-width 2 :color ,prolusion-bg)))))
     `(org-agenda-calendar-event ((,class (:foreground ,prolusion-emph))))
     `(org-agenda-calendar-sexp ((,class (:foreground ,prolusion-fg :slant italic))))
     `(org-agenda-date
       ((,class (:foreground ,prolusion-comments :background ,prolusion-bg :weight normal
                             :inverse-video nil :overline nil :slant normal :height 1.0
                             :box (:line-width 2 :color ,prolusion-bg)))) t)
     `(org-agenda-date-weekend
       ((,class (:inherit org-agenda-date :inverse-video nil :background unspecified
                          :foreground ,prolusion-comments :weight unspecified
                          :underline t :overline nil :box unspecified))) t)
     `(org-agenda-date-today
       ((,class (:inherit org-agenda-date :inverse-video t :weight bold
                          :underline unspecified :overline nil :box unspecified
                          :foreground ,blue :background ,prolusion-bg))) t)
     `(org-agenda-done ((,class (:foreground ,prolusion-comments :slant italic))) t)
     `(org-archived ((,class (:foreground ,prolusion-comments :weight normal))))
     `(org-block ((,class (:foreground ,prolusion-comments))))
     `(org-block-begin-line ((,class (:foreground ,prolusion-comments :slant italic))))
     `(org-checkbox ((,class (:background ,prolusion-bg :foreground ,prolusion-fg
                                          :box (:line-width 1 :style released-button)))))
     `(org-code ((,class (:foreground ,prolusion-comments))))
     `(org-date ((,class (:foreground ,blue :underline t))))
     `(org-done ((,class (:weight bold :foreground ,green))))
     `(org-ellipsis ((,class (:foreground ,prolusion-comments))))
     `(org-formula ((,class (:foreground ,yellow))))
     `(org-headline-done ((,class (:foreground ,green))))
     `(org-hide ((,class (:foreground ,prolusion-bg))))
     `(org-level-1 ((,class (:inherit ,s-variable-pitch :height ,prolusion-height-plus-4
                                      :foreground ,orange))))
     `(org-level-2 ((,class (:inherit ,s-variable-pitch :height ,prolusion-height-plus-3
                                      :foreground ,green))))
     `(org-level-3 ((,class (:inherit ,s-variable-pitch :height ,prolusion-height-plus-2
                                      :foreground ,blue))))
     `(org-level-4 ((,class (:inherit ,s-variable-pitch :height ,prolusion-height-plus-1
                                      :foreground ,yellow))))
     `(org-level-5 ((,class (:inherit ,s-variable-pitch
                                      :foreground ,cyan))))
     `(org-level-6 ((,class (:inherit ,s-variable-pitch
                                      :foreground ,green))))
     `(org-level-7 ((,class (:inherit ,s-variable-pitch
                                      :foreground ,red))))
     `(org-level-8 ((,class (:inherit ,s-variable-pitch
                                      :foreground ,blue))))
     `(org-link ((,class (:foreground ,yellow :underline t))))
     `(org-sexp-date ((,class (:foreground ,violet))))
     `(org-scheduled ((,class (:foreground ,green))))
     `(org-scheduled-previously ((,class (:foreground ,cyan))))
     `(org-scheduled-today ((,class (:foreground ,blue :weight normal))))
     `(org-special-keyword ((,class (:foreground ,prolusion-comments :weight bold))))
     `(org-table ((,class (:foreground ,green))))
     `(org-tag ((,class (:weight bold))))
     `(org-time-grid ((,class (:foreground ,prolusion-comments))))
     `(org-todo ((,class (:foreground ,red :weight bold))))
     `(org-upcoming-deadline ((,class (:foreground ,yellow  :weight normal :underline nil))))
     `(org-warning ((,class (:foreground ,orange :weight normal :underline nil))))
     ;; org-habit (clear=blue, ready=green, alert=yellow, overdue=red. future=lower contrast)
     `(org-habit-clear-face ((,class (:background ,blue-lc :foreground ,blue-hc))))
     `(org-habit-clear-future-face ((,class (:background ,blue-lc))))
     `(org-habit-ready-face ((,class (:background ,green-lc :foreground ,green))))
     `(org-habit-ready-future-face ((,class (:background ,green-lc))))
     `(org-habit-alert-face ((,class (:background ,yellow :foreground ,yellow-lc))))
     `(org-habit-alert-future-face ((,class (:background ,yellow-lc))))
     `(org-habit-overdue-face ((,class (:background ,red :foreground ,red-lc))))
     `(org-habit-overdue-future-face ((,class (:background ,red-lc))))
     ;; latest additions
     `(org-agenda-dimmed-todo-face ((,class (:foreground ,prolusion-comments))))
     `(org-agenda-restriction-lock ((,class (:background ,yellow))))
     `(org-clock-overlay ((,class (:background ,yellow))))
     `(org-column ((,class (:background ,prolusion-hl :strike-through nil
                                        :underline nil :slant normal :weight normal :inherit default))))
     `(org-column-title ((,class (:background ,prolusion-hl :underline t :weight bold))))
     `(org-date-selected ((,class (:foreground ,red :inverse-video t))))
     `(org-document-info ((,class (:foreground ,prolusion-fg))))
     `(org-document-title ((,class (:foreground ,prolusion-emph  :weight bold :height ,prolusion-height-plus-4))))
     `(org-drawer ((,class (:foreground ,cyan))))
     `(org-footnote ((,class (:foreground ,magenta :underline t))))
     `(org-latex-and-export-specials ((,class (:foreground ,orange))))
     `(org-mode-line-clock-overrun ((,class (:inherit mode-line :background ,red))))

     ;; outline
     `(outline-1 ((,class (:inherit org-level-1))))
     `(outline-2 ((,class (:inherit org-level-2))))
     `(outline-3 ((,class (:inherit org-level-3))))
     `(outline-4 ((,class (:inherit org-level-4))))
     `(outline-5 ((,class (:inherit org-level-5))))
     `(outline-6 ((,class (:inherit org-level-6))))
     `(outline-7 ((,class (:inherit org-level-7))))
     `(outline-8 ((,class (:inherit org-level-8))))

     ;; parenfaceu
     `(paren-face  ((,class (:foreground ,prolusion-comments))))

     ;; pretty-mode
     `(pretty-mode-symbol-face  ((,class (:foreground ,yellow :weight normal))))

     ;; popup
     `(popup-face ((,class (:background ,prolusion-hl :foreground ,prolusion-fg))))
     `(popup-isearch-match ((,class (:background ,yellow :foreground ,prolusion-bg))))
     `(popup-menu-face ((,class (:background ,prolusion-hl :foreground ,prolusion-fg))))
     `(popup-menu-mouse-face ((,class (:background ,blue :foreground ,prolusion-fg))))
     `(popup-menu-selection-face ((,class (:background ,magenta :foreground ,prolusion-bg))))
     `(popup-scroll-bar-background-face ((,class (:background ,prolusion-comments))))
     `(popup-scroll-bar-foreground-face ((,class (:background ,prolusion-emph))))
     `(popup-tip-face ((,class (:background ,prolusion-hl :foreground ,prolusion-fg))))

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

     ;; rst-mode
     `(rst-level-1-face ((,class (:background ,yellow   :foreground ,prolusion-bg))))
     `(rst-level-2-face ((,class (:background ,cyan    :foreground ,prolusion-bg))))
     `(rst-level-3-face ((,class (:background ,blue    :foreground ,prolusion-bg))))
     `(rst-level-4-face ((,class (:background ,violet  :foreground ,prolusion-bg))))
     `(rst-level-5-face ((,class (:background ,magenta :foreground ,prolusion-bg))))
     `(rst-level-6-face ((,class (:background ,red     :foreground ,prolusion-bg))))

     ;; rpm-mode
     `(rpm-spec-dir-face ((,class (:foreground ,green))))
     `(rpm-spec-doc-face ((,class (:foreground ,green))))
     `(rpm-spec-ghost-face ((,class (:foreground ,red))))
     `(rpm-spec-macro-face ((,class (:foreground ,yellow))))
     `(rpm-spec-obsolete-tag-face ((,class (:foreground ,red))))
     `(rpm-spec-package-face ((,class (:foreground ,red))))
     `(rpm-spec-section-face ((,class (:foreground ,yellow))))
     `(rpm-spec-tag-face ((,class (:foreground ,blue))))
     `(rpm-spec-var-face ((,class (:foreground ,red))))

     ;; sh-mode
     `(sh-quoted-exec ((,class (:foreground ,violet :weight bold))))
     `(sh-escaped-newline ((,class (:foreground ,yellow :weight bold))))
     `(sh-heredoc ((,class (:foreground ,yellow :weight bold))))

     ;; smartparens
     `(sp-pair-overlay-face ((,class (:background ,prolusion-hl))))
     `(sp-wrap-overlay-face ((,class (:background ,prolusion-hl))))
     `(sp-wrap-tag-overlay-face ((,class (:background ,prolusion-hl))))
     `(sp-show-pair-enclosing ((,class (:foreground ,yellow :background ,prolusion-bg
                             :weight bold t))))
     `(sp-show-pair-match-face
       ((,class (:foreground ,yellow :background ,prolusion-bg
                             :weight bold t))))
     `(sp-show-pair-mismatch-face
       ((,class (:foreground ,red :background ,prolusion-bg
                             :weight bold t))))

     ;; show-paren
     `(show-paren-match
       ((,class (:foreground ,yellow :background ,prolusion-bg
                             :weight bold t))))
     `(show-paren-mismatch
       ((,class (:foreground ,red :background ,prolusion-bg
                             :weight bold t))))

     ;; mic-paren
     `(paren-face-match
       ((,class (:foreground ,yellow :background ,prolusion-bg
                             :weight normal :inverse-video t))))
     `(paren-face-mismatch
       ((,class (:foreground ,red :background ,prolusion-bg
                             :weight normal :inverse-video t))))
     `(paren-face-no-match
       ((,class (:foreground ,red :background ,prolusion-bg
                             :weight normal :inverse-video t))))

     ;; SLIME
     `(slime-repl-inputed-output-face ((,class (:foreground ,red))))

     ;; speedbar
     `(speedbar-button-face ((,class (:inherit ,s-variable-pitch
                                               :foreground ,prolusion-comments))))
     `(speedbar-directory-face ((,class (:inherit ,s-variable-pitch :foreground ,blue))))
     `(speedbar-file-face ((,class (:inherit ,s-variable-pitch :foreground ,prolusion-fg))))
     `(speedbar-highlight-face ((,class (:inherit ,s-variable-pitch :background ,prolusion-hl))))
     `(speedbar-selected-face ((,class (:inherit ,s-variable-pitch
                                                 :foreground ,yellow :underline t))))
     `(speedbar-separator-face ((,class (:inherit ,s-variable-pitch
                                                  :background ,blue :foreground ,prolusion-bg
                                                  :overline ,cyan-lc))))
     `(speedbar-tag-face ((,class (:inherit ,s-variable-pitch :foreground ,green))))

     ;; sunrise commander headings
     `(sr-active-path-face ((,class (:background ,blue :foreground ,prolusion-bg
                                                 :height ,prolusion-height-plus-1  :weight bold))))
     `(sr-editing-path-face ((,class (:background ,yellow :foreground ,prolusion-bg
                                                  :weight bold :height ,prolusion-height-plus-1))))
     `(sr-highlight-path-face ((,class (:background ,green :foreground ,prolusion-bg
                                                    :weight bold :height ,prolusion-height-plus-1))))
     `(sr-passive-path-face ((,class (:background ,prolusion-comments :foreground ,prolusion-bg
                                                  :weight bold :height ,prolusion-height-plus-1))))

     ;; sunrise commander marked
     `(sr-marked-dir-face ((,class (:inherit dired-marked))))
     `(sr-marked-file-face ((,class (:inherit dired-marked))))
     `(sr-alt-marked-dir-face ((,class (:background ,magenta :foreground ,prolusion-bg
                                                    :weight bold))))
     `(sr-alt-marked-file-face ((,class (:background ,magenta :foreground ,prolusion-bg
                                                     :weight bold))))

     ;; sunrise commander fstat
     `(sr-directory-face ((,class (:inherit dired-directory :weight normal))))
     `(sr-symlink-directory-face ((,class (:inherit dired-directory
                                                    :slant italic :weight normal))))
     `(sr-symlink-face ((,class (:inherit dired-symlink :slant italic :weight normal))))
     `(sr-broken-link-face ((,class (:inherit dired-warning :slant italic :weight normal))))

     ;; sunrise commander file types
     `(sr-compressed-face ((,class (:foreground ,prolusion-fg))))
     `(sr-encrypted-face ((,class (:foreground ,prolusion-fg))))
     `(sr-log-face ((,class (:foreground ,prolusion-fg))))
     `(sr-packaged-face ((,class (:foreground ,prolusion-fg))))
     `(sr-html-face ((,class (:foreground ,prolusion-fg))))
     `(sr-xml-face ((,class (:foreground ,prolusion-fg))))

     ;; sunrise commander misc
     `(sr-clex-hotchar-face ((,class (:background ,red  :foreground ,prolusion-bg
                                                  :weight bold))))

     ;; table
     `(table-cell ((,class (:foreground ,prolusion-fg :background ,prolusion-hl))))

     ;; term
     `(term-color-black ((t (:foreground ,base03
                                         :background ,base02))))
     `(term-color-red ((t (:foreground ,red
                                       :background ,red-d))))
     `(term-color-green ((t (:foreground ,green
                                         :background ,green-d))))
     `(term-color-yellow ((t (:foreground ,yellow
                                          :background ,yellow-d))))
     `(term-color-blue ((t (:foreground ,blue
                                        :background ,blue-d))))
     `(term-color-magenta ((t (:foreground ,magenta
                                           :background ,magenta-d))))
     `(term-color-cyan ((t (:foreground ,cyan
                                        :background ,cyan-d))))
     `(term-color-white ((t (:foreground ,base00
                                         :background ,base0))))
     '(term-default-fg-color ((t (:inherit term-color-white))))
     '(term-default-bg-color ((t (:inherit term-color-black))))

     ;; tooltip. (NOTE: This setting has no effect on the os widgets for me
     ;; zencoding uses this)
     `(tooltip ((,class (:background ,yellow-lc :foreground ,yellow-hc
                                     :inherit ,s-variable-pitch))))

     ;; tuareg
     `(tuareg-font-lock-governing-face ((,class (:foreground ,magenta :weight bold))))
     `(tuareg-font-lock-multistage-face ((,class (:foreground ,blue :background ,prolusion-hl
                                                              :weight bold))))
     `(tuareg-font-lock-operator-face ((,class (:foreground ,prolusion-emph))))
     `(tuareg-font-lock-error-face ((,class (:foreground ,yellow :background ,red
                                                         :weight bold))))
     `(tuareg-font-lock-interactive-output-face ((,class (:foreground ,cyan))))
     `(tuareg-font-lock-interactive-error-face ((,class (:foreground ,red))))

     ;; undo-tree
     `(undo-tree-visualizer-default-face
       ((,class (:foreground ,prolusion-comments :background ,prolusion-bg))))
     `(undo-tree-visualizer-unmodified-face ((,class (:foreground ,green))))
     `(undo-tree-visualizer-current-face ((,class (:foreground ,blue :inverse-video t))))
     `(undo-tree-visualizer-active-branch-face
       ((,class (:foreground ,prolusion-emph :background ,prolusion-bg :weight bold))))
     `(undo-tree-visualizer-register-face ((,class (:foreground ,yellow))))

     ;; volatile highlights
     `(vhl/default-face ((,class (:background ,green-lc :foreground ,green-hc))))

     ;; w3m
     `(w3m-anchor ((,class (:inherit link))))
     `(w3m-arrived-anchor ((,class (:inherit link-visited))))
     `(w3m-form ((,class (:background ,prolusion-bg :foreground ,prolusion-fg))))
     `(w3m-header-line-location-title ((,class (:background ,prolusion-hl :foreground ,yellow))))
     `(w3m-header-line-location-content ((,class (:background ,prolusion-hl :foreground ,prolusion-fg))))
     `(w3m-bold ((,class (:foreground ,prolusion-emph :weight bold))))
     `(w3m-image-anchor ((,class (:background ,prolusion-bg :foreground ,cyan :inherit link))))
     `(w3m-image ((,class (:background ,prolusion-bg :foreground ,cyan))))
     `(w3m-lnum-minibuffer-prompt ((,class (:foreground ,prolusion-emph))))
     `(w3m-lnum-match ((,class (:background ,prolusion-hl))))
     `(w3m-lnum ((,class (:underline nil :bold nil :foreground ,red))))
     `(w3m-session-select ((,class (:foreground ,prolusion-fg))))
     `(w3m-session-selected ((,class (:foreground ,prolusion-emph :bold t :underline t))))
     `(w3m-tab-background ((,class (:background ,prolusion-bg :foreground ,prolusion-fg))))
     `(w3m-tab-selected-background ((,class (:background ,prolusion-bg :foreground ,prolusion-fg))))
     `(w3m-tab-mouse ((,class (:background ,prolusion-hl :foreground ,yellow))))
     `(w3m-tab-selected ((,class (:background ,prolusion-hl :foreground ,prolusion-emph :bold t))))
     `(w3m-tab-unselected ((,class (:background ,prolusion-hl :foreground ,prolusion-fg))))
     `(w3m-tab-selected-retrieving ((,class (:background ,prolusion-hl :foreground ,red))))
     `(w3m-tab-unselected-retrieving ((,class (:background ,prolusion-hl :foreground ,orange))))
     `(w3m-tab-unselected-unseen ((,class (:background ,prolusion-hl :foreground ,violet))))

     ;; web-mode
     `(web-mode-builtin-face ((,class (:foreground ,red))))
     `(web-mode-comment-face ((,class (:foreground ,prolusion-comments))))
     `(web-mode-constant-face ((,class (:foreground ,blue :weight bold))))
     `(web-mode-current-element-highlight-face ((,class
                                                 (:underline nil :weight normal
                                                             :background ,prolusion-hl))))
     `(web-mode-css-at-rule-face ((,class (:foreground ,violet :slant italic))))
     `(web-mode-css-prop-face ((,class (:foreground ,violet))))
     `(web-mode-css-pseudo-class-face ((,class (:foreground ,green :slant italic))))
     `(web-mode-css-rule-face ((,class (:foreground ,blue))))
     `(web-mode-doctype-face ((,class (:foreground ,prolusion-comments
                                                   :slant italic :weight bold))))
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
     `(whitespace-space ((,class (:background unspecified :foreground ,prolusion-comments
                                              :inverse-video unspecified :slant italic))))
     `(whitespace-hspace ((,class (:background unspecified :foreground ,prolusion-emph
                                               :inverse-video unspecified))))
     `(whitespace-tab ((,class (:background unspecified :foreground ,red
                                            :inverse-video unspecified :weight bold))))
     `(whitespace-newline ((,class(:background unspecified :foreground ,prolusion-comments
                                               :inverse-video unspecified))))
     `(whitespace-trailing ((,class (:background unspecified :foreground ,orange-lc
                                                 :inverse-video t))))
     `(whitespace-line ((,class (:background unspecified :foreground ,magenta
                                             :inverse-video unspecified))))
     `(whitespace-space-before-tab ((,class (:background ,red-lc :foreground unspecified
                                                         :inverse-video unspecified))))
     `(whitespace-indentation ((,class (:background unspecified :foreground ,yellow
                                                    :inverse-video unspecified :weight bold))))
     `(whitespace-empty ((,class (:background unspecified :foreground ,red-lc
                                              :inverse-video t))))
     `(whitespace-space-after-tab ((,class (:background unspecified :foreground ,orange
                                                        :inverse-video t :weight bold))))

     ;; wanderlust
     `(wl-highlight-folder-few-face ((,class (:foreground ,red))))
     `(wl-highlight-folder-many-face ((,class (:foreground ,red))))
     `(wl-highlight-folder-path-face ((,class (:foreground ,orange))))
     `(wl-highlight-folder-unread-face ((,class (:foreground ,blue))))
     `(wl-highlight-folder-zero-face ((,class (:foreground ,prolusion-fg))))
     `(wl-highlight-folder-unknown-face ((,class (:foreground ,blue))))
     `(wl-highlight-message-citation-header ((,class (:foreground ,red))))
     `(wl-highlight-message-cited-text-1 ((,class (:foreground ,red))))
     `(wl-highlight-message-cited-text-2 ((,class (:foreground ,green))))
     `(wl-highlight-message-cited-text-3 ((,class (:foreground ,blue))))
     `(wl-highlight-message-cited-text-4 ((,class (:foreground ,blue))))
     `(wl-highlight-message-header-contents-face ((,class (:foreground ,green))))
     `(wl-highlight-message-headers-face ((,class (:foreground ,red))))
     `(wl-highlight-message-important-header-contents ((,class (:foreground ,green))))
     `(wl-highlight-message-header-contents ((,class (:foreground ,green))))
     `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,green))))
     `(wl-highlight-message-signature ((,class (:foreground ,green))))
     `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,prolusion-fg))))
     `(wl-highlight-summary-answered-face ((,class (:foreground ,blue))))
     `(wl-highlight-summary-disposed-face ((,class (:foreground ,prolusion-fg
                                                                :slant italic))))
     `(wl-highlight-summary-new-face ((,class (:foreground ,blue))))
     `(wl-highlight-summary-normal-face ((,class (:foreground ,prolusion-fg))))
     `(wl-highlight-summary-thread-top-face ((,class (:foreground ,yellow))))
     `(wl-highlight-thread-indent-face ((,class (:foreground ,magenta))))
     `(wl-highlight-summary-refiled-face ((,class (:foreground ,prolusion-fg))))
     `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

     ;; weechat
     `(weechat-error-face ((,class (:inherit error))))
     `(weechat-highlight-face ((,class (:foreground ,prolusion-emph :weight bold))))
     `(weechat-nick-self-face ((,class (:foreground ,green :weight unspecified
                                                    :inverse-video t))))
     `(weechat-prompt-face ((,class (:inherit minibuffer-prompt))))
     `(weechat-time-face ((,class (:foreground ,prolusion-comments))))

     ;; which-func-mode
     `(which-func ((,class (:foreground ,green))))

     ;; window-number-mode
     `(window-number-face ((,class (:foreground ,green))))

     ;; yascroll
     `(yascroll:thumb-text-area
       ((,class (:foreground ,prolusion-comments :background ,prolusion-comments))))
     `(yascroll:thumb-fringe
       ((,class (:foreground ,prolusion-comments :background ,prolusion-comments))))

     ;; zencoding
     `(zencoding-preview-input ((,class (:background ,prolusion-hl :box ,prolusion-emph)))))

    (custom-theme-set-variables
     theme-name
     `(ansi-color-names-vector [,prolusion-bg ,red ,green ,yellow
                                              ,blue ,magenta ,cyan ,prolusion-fg])

     ;; compilation
     `(compilation-message-face 'default)

     ;; fill-column-indicator
     `(fci-rule-color ,prolusion-hl)

     ;; magit
     `(magit-diff-use-overlays nil)

     ;; highlight-changes
     `(highlight-changes-colors '(,magenta ,violet))

     ;; highlight-tail
     `(highlight-tail-colors
       '((,prolusion-hl . 0)(,green-lc . 20)(,cyan-lc . 30)(,blue-lc . 50)
         (,yellow-lc . 60)(,orange-lc . 70)(,magenta-lc . 85)(,prolusion-hl . 100)))

     ;; syslog-mode
     `(syslog-ip-face '((t :background unspecified :foreground ,yellow)))
     `(syslog-hour-face '((t :background unspecified :foreground ,green)))
     `(syslog-error-face '((t :background unspecified :foreground ,red :weight bold)))
     `(syslog-warn-face '((t :background unspecified :foreground ,orange :weight bold)))
     `(syslog-info-face '((t :background unspecified :foreground ,blue :weight bold)))
     `(syslog-debug-face '((t :background unspecified :foreground ,cyan :weight bold)))
     `(syslog-su-face '((t :background unspecified :foreground ,magenta)))

     ;; vc
     `(vc-annotate-color-map
       '((20 . ,red)
         (40 . "#CF4F1F")
         (60 . "#C26C0F")
         (80 . ,yellow)
         (100 . "#AB8C00")
         (120 . "#A18F00")
         (140 . "#989200")
         (160 . "#8E9500")
         (180 . ,green)
         (200 . "#729A1E")
         (220 . "#609C3C")
         (240 . "#4E9D5B")
         (260 . "#3C9F79")
         (280 . ,cyan)
         (300 . "#299BA6")
         (320 . "#2896B5")
         (340 . "#2790C3")
         (360 . ,blue)))
     `(vc-annotate-very-old-color nil)
     `(vc-annotate-background nil)

     ;; weechat
     `(weechat-color-list
       '(unspecified ,base03 ,base02
                     ,red-d ,red
                     ,green-d ,green
                     ,yellow-d ,yellow
                     ,blue-d ,blue
                     ,magenta-d ,magenta
                     ,cyan-d ,cyan
                     ,base0 ,base00)))

    ;; call chained theme function
    (when childtheme (funcall childtheme))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode 1))
;; fill-column: 95
;; End:

(provide 'prolusion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion.el ends here
