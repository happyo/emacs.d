;;; init-elpa.el --- Setting fonts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require-package 'cnfonts)

(require 'init-elpa)
(require 'init-func)

;; Font
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))


;; (use-package cnfonts
;;   :ensure t
;;   :init
;;   (setq cnfonts-personal-fontnames
;;         '(
;;           ("Hack" "SF Mono" "Victor Mono" "JetBrains Mono" "Monego")
;;           ("Xingkai SC" "Zhi Mang Xing" "Monego")
;;           ("3270 Nerd Font Mono" "SF Mono" "Zhi Mang Xing" "Monego")
;;           ("3270 Nerd Font Mono" "SF Mono" "Zhi Mang Xing" "Monego")
;;           ("3270 Nerd Font Mono" "SF Mono" "Zhi Mang Xing" "Monego")
;;           ))
;;   (setq cnfonts-profiles
;;         '("program" "org-profile" "read-book"))
;;   :hook (cnfonts-set-font-finish
;;          . (lambda (fontsizes-list)
;;              (set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)
;;              (set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'append)
;;              (set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'append)
;;              (set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'append)
;;              (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append)
;;              (set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'append)))
;;   :config
;;   (cnfonts--select-profile "program")
;;   (cnfonts-enable)
;; )
;; (cl-prettyprint (font-family-list))
;; (cnfonts-mode 1)

(defun centaur-setup-fonts ()
  "Setup fonts."
  (when (display-graphic-p)
    ;; Set default font
    (cl-loop for font in '("Hack" "Monego" "TerminessTTF Nerd Font Mono" "Jetbrains Mono"
                           "SF Mono" "Iosevka Comfy Wide Motion" "Source Code Pro" "Menlo"
                           "Monaco" "DejaVu Sans Mono" "Consolas")
             when (font-installed-p font)
             return (set-face-attribute 'default nil
                                        :family font
                                        :height 170)
                                                      )

    ;; Set mode-line font
    ;; (cl-loop for font in '("Hack" "Menlo" "SF Pro Display" "Helvetica")
    ;;          when (font-installed-p font)
    ;;          return (progn
    ;;                   (set-face-attribute 'mode-line nil :family font :height 155)
    ;;                   (when (facep 'mode-line-active)
    ;;                     (set-face-attribute 'mode-line-active nil :family font :height 155))
    ;;                   (set-face-attribute 'mode-line-inactive nil :family font :height 155)))

    ;; Specify font for all unicode characters
    (cl-loop for font in '("3270 Nerd Font Mono" "Segoe UI Symbol" "Symbola" "Symbol")
             when (font-installed-p font)
             return (if (< emacs-major-version 27)
                        (set-fontset-font "fontset-default" 'unicode font nil 'prepend)
                      (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend)))

    ;; Emoji
    (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji" "Segoe UI Emoji")
             when (font-installed-p font)
             return (cond
                     ((< emacs-major-version 27)
                      (set-fontset-font "fontset-default" 'unicode font nil 'prepend))
                     ((< emacs-major-version 28)
                      (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend))
                     (t
                      (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))))

    ;; Specify font for Chinese characters
    (cl-loop for font in '("Xingkai SC" "Zhi Mang Xing" "PingFang SC" "LXGW WenKai" "STFangsong")
             when (font-installed-p font)
             return (progn
                      (setq face-font-rescale-alist `((,font . 1.1)))
                      (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family font))))))

(centaur-setup-fonts)
(add-hook 'window-setup-hook #'centaur-setup-fonts)
(add-hook 'server-after-make-frame-hook #'centaur-setup-fonts)

(provide 'init-chinese)
;;; init-chinese.el ends here
