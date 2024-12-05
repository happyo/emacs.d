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
        (bg-main     ,tcc-351-ningzhi)
        ;; (bg-main     "#FFFBE9")
        ;; (bg-main     "#eff1f5")
        ;; (bg-main     "#FFFFFF")
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
        (yellow-warmer   ,tcc-184-xionghuang)
        ;; (yellow-warmer   "#FFA500")
        (yellow-cooler   ,tcc-192-hupo)
        ;; (yellow-faint    ,tcc-216-qiuxiang)
        (yellow-faint    "#FFFFE0")
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

        (bg-hl-line         ,tcc-343-qianyun)
        (bg-region          ,tcc-126-dongfangjibai)
        (fg-region          fg-main)

        (border        "#b4c4c0")
        (cursor        ,tcc-076-danfeng)

        (modeline-err     "#9f0030")
        (modeline-warning "#5f0f9f")
        (modeline-info    "#1240af")

        (underline-err     "#ef0f1f")
        (underline-warning "#bf5f00")
        (underline-info    "#02af52")

;;;; Code mappings
         (bracket red-cooler)
        (builtin magenta)
        (comment ,tcc-317-hehui)
      ;; (constant blue-cooler)
      ;; (delimiter fg-main)
      ;; (docmarkup magenta-faint)
      ;; (docstring cyan-faint)
        (fnname ,tcc-158-baiqing)
        (keyword magenta-cooler)
        (number blue-cooler)
        (operator cyan-cooler)
        (preprocessor red-cooler)
        (punctuation fg-main)
        (rx-backslash magenta)
        (rx-construct green-cooler)
        (string red-warmer)
        (type ,tcc-157-facui)
        ;; (variable red-warmer)

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

      (fg-heading-0 cyan-cooler)
      (fg-heading-1 fg-main)
      (fg-heading-2 blue)
      (fg-heading-3 fg-alt)
      (fg-heading-4 magenta)
      (fg-heading-5 green-faint)
      (fg-heading-6 red-faint)
      (fg-heading-7 cyan-warmer)
      (fg-heading-8 fg-dim)
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

;; This is not complete, because it is difficult for a non-user to
;; make sense of where all the faces are used in.
(defun my-modus-themes-custom-faces (&rest _)
  (modus-themes-with-colors
    (custom-set-faces
     ;; `(font-lock-property-use-face ((,c :inherit (bold modus-themes-reset-soft) :foreground ,tcc-164-huangbo)))
     `(font-lock-property-name-face ((,c :inherit (modus-themes-reset-soft) :foreground ,tcc-249-silv)))
     ;; `(font-lock-function-call-face ((,c :inherit (bold modus-themes-reset-soft) :foreground ,tcc-164-huangbo)))
     `(meow-region-cursor-1 ((,c :inherit (bold modus-themes-reset-soft) :background ,bg-char-0)))
     `(meow-region-cursor-2 ((,c :inherit (bold modus-themes-reset-soft) :background ,bg-char-1)))
     `(meow-region-cursor-3 ((,c :inherit (bold modus-themes-reset-soft) :background ,bg-char-2)))

     `(meow-position-highlight-number-1 ((,c :inherit (bold modus-themes-reset-soft) :background ,bg-char-0)))
     `(meow-position-highlight-number-2 ((,c :inherit (bold modus-themes-reset-soft) :background ,bg-char-1)))
     `(meow-position-highlight-number-3 ((,c :inherit (bold modus-themes-reset-soft) :background ,bg-char-2))))))

(add-hook 'enable-theme-functions #'my-modus-themes-custom-faces)

(load-theme 'modus-operandi :no-confirm)


(custom-set-faces
 '(success ((t (:weight regular))))
 '(warning ((t (:weight regular))))
 '(treemacs-window-background-face ((t (:background "#EEEEEE"))))
 '(treemacs-directory-face ((t (:foreground "unspecified-fg" :inherit default))))
 '(treemacs-file-face ((t (:foreground "unspecified-fg" :inherit default))))
 '(treemacs-nerd-icons-root-face ((t (:foreground "#179299"
                                                  :background "#EEEEEE"
                                                  :color "gtk_selection_bg_color"
                                                 
                                     :weight bold
                                     :height 1.4))))
 
'(treemacs-nerd-icons-dir-face ((t (:foreground "#00B4D8"))))
'(treemacs-root-face ((t (:foreground "#ff79c6"
                                      :background "#EEEEEE"
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

