;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (use-package all-the-icons
;;   :ensure t)

;; (use-package ample-theme
;;   :init (progn (load-theme 'ample t t)
;;                (load-theme 'ample-flat t t)
;;                (load-theme 'ample-light t t)
;;                (enable-theme 'ample-light))
;;   :defer t
;;   :ensure t)

;; (use-package dimmer
;;   :config
;;   (dimmer-configure-which-key)
;;   (dimmer-mode t)
;;   )

(add-to-list 'load-path "~/.emacs.d/site-lisp/ef-themes")
(add-to-list 'load-path "~/.emacs.d/site-lisp/chinese-color")
(require 'ef-themes)
(require 'chinese-color)

(setq ef-summer-palette-overrides
      `(
;;; Basic values

      (bg-main     ,tcc-108-ziyun)
      (fg-main     ,tcc-331-zhumo)
      (bg-dim      ,tcc-116-fenqing)
      (fg-dim      "#777294")
      
      (bg-alt      ,tcc-242-fenlv)
      (fg-alt      "#F07C82")

      (bg-active   ,tcc-155-songshi)
      (bg-inactive ,tcc-124-yuebai)

;;; Basic hues for foreground values

      (red             ,tcc-021-yanzhi)
      (red-warmer      ,tcc-010-handan)
      (red-cooler      ,tcc-024-meiguizi)
      (red-faint       ,tcc-080-yinghua)
      (green           ,tcc-231-zumulv)
      (green-warmer    ,tcc-226-sunlv)
      (green-cooler    ,tcc-232-yangse)
      (green-faint     ,tcc-224-lvcha)
      (yellow          "#F2C830")
      (yellow-warmer   "#D78812")
      (yellow-cooler   "#B2A421")
      (yellow-faint    "#927B2B")
      (blue            "#2296D7")
      (blue-warmer     "#8D68F3")
      (blue-cooler     "#002FA7")
      (blue-faint      "#82D8CF")
      (magenta         ,tcc-100-ziyuan)
      (magenta-warmer  ,tcc-085-hongzhizhu)
      (magenta-cooler  "#810DAE")
      (magenta-faint   "#CCA4E3")
      (cyan            "#3AB6DD")
      (cyan-warmer     "#53976F")
      (cyan-cooler     "#289BA3")
      (cyan-faint      "#AED0EE")

;;; Basic hues for background values

      ;; (bg-red      "#F6BEC8")
      ;; (bg-green    "#C3D94E")
      ;; (bg-yellow   "#FFFBC7")
      ;; (bg-blue     "#afdfff")
      ;; (bg-magenta  "#CCA4E3")
      ;; (bg-cyan     "#7397AB")

      ;; (bg-red-subtle      "#ffcfbf")
      ;; (bg-green-subtle    "#b9f2c6")
      ;; (bg-yellow-subtle   "#fff576")
      ;; (bg-blue-subtle     "#ccdfff")
      ;; (bg-magenta-subtle  "#ffcdff")
      ;; (bg-cyan-subtle     "#bfeaff")

;;; Diffs

      ;; (bg-added          "#caf4da")
      ;; (bg-added-faint    "#dff6ea")
      ;; (bg-added-refine   "#bae9cf")
      ;; (fg-added          "#005000")

      ;; (bg-changed        "#ffdfb9")
      ;; (bg-changed-faint  "#ffefcb")
      ;; (bg-changed-refine "#ffcfa0")
      ;; (fg-changed        "#553d00")

      ;; (bg-removed        "#ffcee0")
      ;; (bg-removed-faint  "#ffdfe6")
      ;; (bg-removed-refine "#f5b6c8")
      ;; (fg-removed        "#8f1313")

;;; Graphs

      ;; (bg-graph-red-0     "#ef7969")
      ;; (bg-graph-red-1     "#ffaab4")
      ;; (bg-graph-green-0   "#2fe029")
      ;; (bg-graph-green-1   "#75ef30")
      ;; (bg-graph-yellow-0  "#ffcf00")
      ;; (bg-graph-yellow-1  "#f9ff00")
      ;; (bg-graph-blue-0    "#7f90ff")
      ;; (bg-graph-blue-1    "#9fc6ff")
      ;; (bg-graph-magenta-0 "#e07fff")
      ;; (bg-graph-magenta-1 "#fad0ff")
      ;; (bg-graph-cyan-0    "#70d3f0")
      ;; (bg-graph-cyan-1    "#afefff")

;;; Special hues

      (bg-mode-line       ,tcc-173-chaomi)
      (fg-mode-line       ,tcc-351-ningzhi)
      (bg-completion      "#f4cfff")
      (bg-hover           "#b4cfff")
      (bg-hover-secondary "#aaeccf")
      (bg-hl-line         "#ffd6e5")
      (bg-region          "#eecfff")
      (bg-paren           "#9fc0ef")
      (bg-err             "#ffd0e6") ; check with err
      (bg-warning         "#ffe5ba") ; check with warning
      (bg-info            "#bbefda") ; check with info

      (border        "#b4c4c0")
      (cursor        ,tcc-171-minghuang)
      ;; (fg-intense    "#282828")

      (modeline-err     "#9f0030")
      (modeline-warning "#5f0f9f")
      (modeline-info    "#1240af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      ;; (bg-char-0 "#7feaff")
      ;; (bg-char-1 "#ffaaff")
      ;; (bg-char-2 "#dff000")
;;; Conditional hues

      (bg-region-intense "#cfb5f0")

;;; Mappings

;;;; General mappings

      ;; (err red-warmer)
      ;; (warning yellow)
      ;; (info green-cooler)

      ;; (link blue)
      ;; (link-alt green-cooler)
      ;; (name magenta-warmer)
      ;; (keybind red-cooler)
      ;; (identifier magenta-faint)
      ;; (prompt magenta-warmer)

;;;; Code mappings

      (builtin magenta)
      ;; (comment yellow-faint)
      ;; (constant red-cooler)
      ;; (fnname magenta-warmer)
      ;; (keyword magenta-cooler)
      ;; (preprocessor green-warmer)
      ;; (docstring cyan-faint)
      ;; (string yellow-warmer)
      ;; (type cyan-warmer)
      ;; (variable blue-warmer)
      ;; (rx-escape cyan-cooler) ; compare with `string'
      ;; (rx-construct red-cooler)

;;;; Accent mappings

      ;; (accent-0 magenta-cooler)
      ;; (accent-1 yellow)
      ;; (accent-2 cyan-cooler)
      ;; (accent-3 red)

;;;; Date mappings

      ;; (date-common cyan-cooler)
      ;; (date-deadline red-warmer)
      ;; (date-event fg-alt)
      ;; (date-holiday cyan-cooler)
      ;; (date-now fg-main)
      ;; (date-range fg-alt)
      ;; (date-scheduled yellow)
      ;; (date-weekday cyan)
      ;; (date-weekend red-faint)

;;;; Prose mappings

      ;; (prose-code yellow)
      (prose-done ,tcc-319-buzao)
      ;; (prose-macro cyan-cooler)
      ;; (prose-metadata fg-dim)
      ;; (prose-metadata-value fg-alt)
      ;; (prose-table fg-alt)
      ;; (prose-tag yellow-faint)
      (prose-todo ,tcc-076-danfeng)
      ;; (prose-verbatim magenta-cooler)

;;;; Mail mappings

      ;; (mail-cite-0 yellow-cooler)
      ;; (mail-cite-1 magenta)
      ;; (mail-cite-2 blue-warmer)
      ;; 
      ;; (mail-cite-3 cyan-warmer)
      ;; (mail-part magenta-faint)
      ;; (mail-recipient magenta-warmer)
      ;; (mail-subject magenta-cooler)
      ;; (mail-other magenta)
;;;; Tab mappings

      (bg-tab-bar      bg-main)
      (bg-tab-current  ,tcc-026-haitianxia)
      (bg-tab-other    ,tcc-081-dingxiang)
      
;;;; Rainbow mappings

  (rainbow-0 ,tcc-091-putaoqing)
  (rainbow-1 ,tcc-102-ziluolan)
  (rainbow-2 ,tcc-131-cangcang)
  (rainbow-3 ,tcc-156-tianshuibi)
  (rainbow-4 ,tcc-165-zhizi)
  (rainbow-5 ,tcc-013-meihong)
  (rainbow-6 ,tcc-013-meihong)
      ))

(setq ef-themes-to-toggle '(ef-spring ef-autumn))

(setq ef-themes-headings ; read the manual's entry or the doc string
      '((0 . (variable-pitch light 1.9))
        (1 . (variable-pitch light 1.6))
        (2 . (variable-pitch regular 1.6))
        (3 . (variable-pitch regular 1.4))
        (4 . (variable-pitch regular 1.3))
        (5 . (variable-pitch 1.0)) ; absence of weight means `bold'
        (6 . (variable-pitch 1.0))
        (7 . (variable-pitch 1.0))
        (t . (variable-pitch 1.0))))

(setq ef-themes-mixed-fonts t
      ef-themes-variable-pitch-ui t)

;; Read the doc string or manual for this one.  The symbols can be
;; combined in any order.
(setq ef-themes-region '(intense no-extend neutral))

;; Disable all other themes to avoid awkward blending:
(mapc #'disable-theme custom-enabled-themes)

;; Load the theme of choice:
;; (ef-themes-select 'ef-spring)
(load-theme 'ef-summer :no-confirm)

 ; original value is blue-warmer

;; The themes we provide:
;;      ;; (bg-main     ,tcc-351-ningzhi)
;; Light: `ef-day', `ef-light', `ef-spring', `ef-summer'.
;; Dark:  `ef-autumn', `ef-dark', `ef-night', `ef-winter'.
;;
;; Also those which are optimized for deuteranopia (red-green color
;; deficiency): `ef-deuteranopia-dark', `ef-deuteranopia-light'.

;; We also provide these commands, but do not assign them to any key:
;;
;; - `ef-themes-toggle'
;; - `ef-themes-select'
;; - `ef-themes-load-random'
;; - `ef-themes-preview-colors'
;; - `ef-themes-preview-colors-current'

(use-package all-the-icons
  :if (display-graphic-p))

(add-to-list 'load-path "~/.emacs.d/site-lisp/treemacs-nerd-icons")
(use-package nerd-icons
  :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "3270 Nerd Font Mono")
  (nerd-icons-font-family "Symbols Nerd Font Mono")
  )


(use-package rainbow-mode
  :init
  (defun sanityinc/enable-rainbow-mode-if-theme ()
    (when (and (buffer-file-name) (string-match-p "-theme\\.el" (buffer-file-name)))
      (rainbow-mode)))
  (add-hook 'emacs-lisp-mode-hook 'sanityinc/enable-rainbow-mode-if-theme)
  (add-hook 'help-mode-hook 'rainbow-mode)
  )

;; (use-package beacon)
;; (setq-default beacon-lighter "")
;; (setq-default beacon-size 20)
;; (setq-default beacon-color tcc-076-danfeng)
;; (beacon-mode 1)

;; (diminish 'rainbow-mode)))

;; (setq tab-bar-show 1)
;; (use-package centaur-tabs
;;   :demand
;;   :config
;;   (centaur-tabs-mode t)
;;   (setq centaur-tabs-style "rounded")
;;   :bind
;;   ("C-<prior>" . centaur-tabs-backward)
;;   ("C-<next>" . centaur-tabs-forward))
(set-face-attribute 'tab-bar-tab nil
                   :box `(:line-width 6 :color ,tcc-026-haitianxia))
(set-face-attribute 'tab-bar-tab-inactive nil
                    :box `(:line-width 6 :color ,tcc-081-dingxiang))
(setq tab-bar-new-button-show nil)
(setq tab-bar-close-button-show t)
;; (setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator))
(setq tab-bar-tab-hints t) 
(tab-bar-mode 1)                           ;; enable tab bar
(set-face-attribute 'mode-line nil
                   :box `(:line-width 5 :color ,tcc-173-chaomi :style nil))
(set-face-attribute 'mode-line-inactive nil
                   :box `(:line-width 5 :color ,tcc-242-fenlv :style nil))

;; (use-package tabspaces
;;   :hook (after-init . tabspaces-mode) ;; use this only if you want the minor-mode loaded at startup. 
;;   :commands (tabspaces-switch-or-create-workspace
;;              tabspaces-open-or-create-project-and-workspace)
;;   :custom
;;   (tabspaces-use-filtered-buffers-as-default t)
;;   (tabspaces-default-tab "Default")
;;   (tabspaces-remove-to-default t)
;;   (tabspaces-include-buffers '("*scratch*"))
;;   (tabspaces-initialize-project-with-todo t)
;;   (tabspaces-todo-file-name "project-todo.org")
;;   ;; sessions
;;   (tabspaces-session t)
;;   (tabspaces-session-auto-restore t))


(provide 'init-themes)
;;; init-themes.el end

