;;; init-elpa.el --- Setting fonts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require-package 'cnfonts)

(require 'init-elpa)

;; (use-package cnfonts
;;   :ensure t
;;   :init
;;   (setq cnfonts-personal-fontnames
;;         '(
;;           ("SF Mono" "Victor Mono" "JetBrains Mono")
;;           ("等距更纱黑体 SC")
;;           ("SF Mono" "等距更纱黑体 SC")
;;           ("SF Mono" "等距更纱黑体 SC")
;;           ("SF Mono" "等距更纱黑体 SC")
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
;; (cnfonts-mode 1)

(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      ;; (format   "%s:pixelsize=%d"  english english-size) :weight 'semi-bold)
                      (format   "%s:pixelsize=%d"  english english-size))

  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size :weight 'medium))))

;; (set-font "monego" "LXGW WenKai" 32 32)
(set-font "monego" "LXGW WenKai" 17 20)

(provide 'init-chinese)
;;; init-chinese.el ends here
