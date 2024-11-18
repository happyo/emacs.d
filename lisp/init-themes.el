;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(add-to-list 'load-path "~/.emacs.d/site-lisp/modus-themes")
(require 'modus-themes)

(add-to-list 'load-path "~/.emacs.d/site-lisp/chinese-color")
(require 'chinese-color)

(fringe-mode 0)

(setq modus-operandi-palette-overrides
      `(
;;; Basic values
        ;; (bg-main     ,tcc-351-ningzhi)
        ;; (bg-main     "#FFFACD")
        ;; (bg-main     "#F8E9FF")
        ;; (bg-main     "#FFFBE9")
        ;; (bg-main     "#eff1f5")
        (bg-main     "#FFFFFF")
        (fg-main     "#445682")
        (bg-dim      ,tcc-118-tianqing)
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
        (yellow          ,tcc-166-huangliliu)
        (yellow-warmer   ,tcc-181-guihuang)
        (yellow-cooler   ,tcc-192-hupo)
        (yellow-faint    ,tcc-216-qiuxiang)
        (blue            ,tcc-131-cangcang)
        (blue-warmer     ,tcc-129-ruolan)
        (blue-cooler     "#1e66f5")
        (blue-faint      "#82D8CF")
        (magenta         ,tcc-100-ziyuan)
        (magenta-warmer  ,tcc-085-hongzhizhu)
        (magenta-cooler  "#8F5ED4")
        (magenta-faint   "#CCA4E3")
        (cyan            "#3AB6DD")
        (cyan-warmer     ,tcc-249-silv)
        ;; (cyan-warmer     "#009D91")
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
        (bg-hl-line         ,tcc-343-qianyun)
        ;; (bg-region          "#eecfff")
        (bg-region          ,tcc-162-huangbaiyou)
        (bg-paren           "#9fc0ef")
        (bg-err             "#ffd0e6") ; check with err
        (bg-warning         "#ffe5ba") ; check with warning
        (bg-info            "#bbefda") ; check with info

        (border        "#b4c4c0")
        (cursor        ,tcc-076-danfeng)
        ;; (cursor        ,tcc-351-ningzhi)
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

        ;; (bg-region-intense "#cfb5f0")
        (bg-region-intense ,tcc-162-huangbaiyou)

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
         (bracket fg-main)
        (builtin magenta)
        (comment ,tcc-317-hehui)
      ;; (constant blue-cooler)
      ;; (delimiter fg-main)
      ;; (docmarkup magenta-faint)
      ;; (docstring cyan-faint)
        (fnname ,tcc-158-baiqing)
        (keyword magenta-cooler)
        (number blue-cooler)
        (operator blue-cooler)
        (preprocessor red-cooler)
        (punctuation fg-main)
        (rx-backslash magenta)
        (rx-construct green-cooler)
        (string red-warmer)
        (type cyan-warmer)
        (variable red-warmer)


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

        (prose-code yellow-cooler)
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
        (bg-tab-other    ,tcc-124-yuebai)
        
;;;; Rainbow mappings

        (rainbow-0 ,tcc-091-putaoqing)
        (rainbow-1 ,tcc-102-ziluolan)
        (rainbow-2 ,tcc-131-cangcang)
        (rainbow-3 ,tcc-156-tianshuibi)
        (rainbow-4 ,tcc-157-facui)
        (rainbow-5 ,tcc-013-meihong)
        (rainbow-6 ,tcc-013-meihong)
        ))

(load-theme 'modus-operandi :no-confirm)


(custom-set-faces
 '(treemacs-directory-face ((t (:foreground "unspecified-fg" :inherit default))))
 '(treemacs-file-face ((t (:foreground "unspecified-fg" :inherit default))))
 '(treemacs-nerd-icons-root-face ((t (:foreground "#179299"
                                                  :background "unspecified-bg"
                                                  :color "gtk_selection_bg_color"
                                                 
                                     :weight bold
                                     :height 1.4))))
 
'(treemacs-nerd-icons-dir-face ((t (:foreground "#00B4D8"))))
'(treemacs-root-face ((t (:foreground "#ff79c6"
                                      :background "unspecified-bg"
                                      :weight bold :height 1.4 :line-spacing 0.4))))


'(treemacs-nerd-icons-file-face ((t (:foreground "#00B4D8"))))
'(nerd-icons-green
  ((((background dark)) :foreground "#FA7343")  
   (((background light)) :foreground "#FA7343")))
)

(setq window-divider-default-right-width 1)  
(setq window-divider-default-bottom-width 1)
(window-divider-mode 1)

(use-package nerd-icons
  :demand t
  :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "3270 Nerd Font Mono")
  (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

(use-package treemacs-nerd-icons
  :demand t
  :after treemacs
  :config
  (treemacs-modify-theme "nerd-icons"
    :config
    (progn
      (treemacs-create-icon :icon (format "%s%s" (nerd-icons-octicon "nf-oct-home"   :face 'treemacs-nerd-icons-root-face) treemacs-nerd-icons-tab)
                            :extensions (root-closed root-open)
                            :fallback 'same-as-icon)))
  (treemacs-load-theme "nerd-icons"))


(use-package rainbow-mode
  :init
  (defun sanityinc/enable-rainbow-mode-if-theme ()
    (when (and (buffer-file-name) (string-match-p "-theme\\.el" (buffer-file-name)))
      (rainbow-mode)))
  (add-hook 'emacs-lisp-mode-hook 'sanityinc/enable-rainbow-mode-if-theme)
  (add-hook 'help-mode-hook 'rainbow-mode)
  (add-hook 'swift-ts-mode-hook 'rainbow-mode)
  )

(provide 'init-themes)
;;; init-themes.el end

