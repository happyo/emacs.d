;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require-package 'cnfonts)

(require 'init-elpa)

(use-package cnfonts
  :ensure t
  :init
  (setq cnfonts-personal-fontnames
        '(
          ("Operator Mono" "Victor Mono" "JetBrains Mono")
          ("等距更纱黑体 SC")
          ("Operator Mono" "等距更纱黑体 SC")
          ("Operator Mono" "等距更纱黑体 SC")
          ("Operator Mono" "等距更纱黑体 SC")
          ))
  (setq cnfonts-profiles
        '("program" "org-profile" "read-book"))
  :hook (cnfonts-set-font-finish
         . (lambda (fontsizes-list)
             (set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)
             (set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'append)
             (set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'append)
             (set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'append)
             (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append)
             (set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'append)))
  :config
  (cnfonts--select-profile "program")
  (cnfonts-enable)
  ;; (select-program)
  )

(cnfonts-mode 1)
  ;; (defun select-program () 
  ;;   (cnfonts--select-profile "program"))


(provide 'init-chinese)
;;; init-chinese.el ends here
