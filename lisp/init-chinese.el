;;; init-elpa.el --- Setting fonts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require-package 'cnfonts)

(require 'init-elpa)
(require 'init-func)

;; 最好使用 cnfonts 来设置中文字体，下面这种方式对于有些字体不起作用
;; ;; Font
;; (defun font-installed-p (font-name)
;;   "Check if font with FONT-NAME is available."
;;   (find-font (font-spec :name font-name)))

;; (defun centaur-setup-fonts ()
;;   "Setup fonts."
;;   (when (display-graphic-p)
;;     ;; Set default font
    ;; (cl-loop for font in '("Rec Mono Happyo" "Roboto Mono" "Comic Mono" "Operator Mono" "Iosevka Comfy" "Kode Mono" "Consolas" "Monego" "TerminessTTF Nerd Font Mono" "Jetbrains Mono"
    ;;                        "SF Mono" "Iosevka Comfy Wide Motion" "Source Code Pro" "Menlo"
    ;;                        "Monaco" "DejaVu Sans Mono" "Consolas")
;;             when (font-installed-p font)
;;              return (set-face-attribute 'default nil
;;                                         :family font
;;                                         :height 160
;;                                         ;; :slant 'italic
;;                                         ;; :weight 'light
;;                                         :weight 'normal

;;                                         )
;;              )

;;     ;; Set mode-line font
;;     ;; (cl-loop for font in '("Hack" "Menlo" "SF Pro Display" "Helvetica")
;;     ;;          when (font-installed-p font)
;;     ;;          return (progn
;;     ;;                   (set-face-attribute 'mode-line nil :family font :height 155)
;;     ;;                   (when (facep 'mode-line-active)
;;     ;;                     (set-face-attribute 'mode-line-active nil :family font :height 155))
;;     ;;                   (set-face-attribute 'mode-line-inactive nil :family font :height 155)))

;;     ;; Specify font for all unicode characters
;;     (cl-loop for font in '("Rec Mono Happyo" "Symbols Nerd Font Mono" "Space Mono" "Azeret Mono" "3270 Nerd Font Mono" "Segoe UI Symbol" "Symbola" "Symbol")
;;              when (font-installed-p font)
;;              return (if (< emacs-major-version 27)
;;                         (set-fontset-font "fontset-default" 'unicode font nil 'prepend)
;;                       (set-fontset-font t '(#x0000 . #x10FFFF) (font-spec :family font) nil 'prepend)))


;;     ;; Emoji
;;     (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji" "Segoe UI Emoji")
;;              when (font-installed-p font)
;;              return (cond
;;                      ((< emacs-major-version 27)
;;                       (set-fontset-font "fontset-default" 'unicode font nil 'prepend))
;;                      ((< emacs-major-version 28)
;;                       (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend))
;;                      (t
;;                       (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))))

;;     ;; Specify font for Chinese characters
;;     (cl-loop for font in '("霞鹜文楷等宽" "Xingkai SC" "Zhi Mang Xing" "PingFang SC" "LXGW WenKai" "STFangsong")
;;              when (font-installed-p font)
;;              return (progn
;;                       (setq face-font-rescale-alist `((,font . 1.0)))
;;                       (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family font))))))

;; (centaur-setup-fonts)

;; (add-hook 'window-setup-hook #'centaur-setup-fonts)
;; (add-hook 'server-after-make-frame-hook #'centaur-setup-fonts)

(use-package cnfonts
  :demand t
  :ensure t
  :config
  (setq cnfonts-profiles
    '("program" "org-mode" "read-book"))
  (cnfonts-mode 1))

(use-package pangu-spacing
  :ensure t
  :config
  (global-pangu-spacing-mode 1)
  (add-hook 'org-mode-hook
            '(lambda ()
               (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))
  )

(provide 'init-chinese)
;;; init-chinese.el ends here
