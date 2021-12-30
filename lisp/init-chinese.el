;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require-package 'cnfonts)

(require 'init-elpa)

(use-package cnfonts
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
  ;; :config
  ;; (select-program)
  )
  (cnfonts-mode 1)

  ;; (defun select-program () 
  ;;   (cnfonts--select-profile "program"))


(provide 'init-chinese)
;;; init-chinese.el ends here
