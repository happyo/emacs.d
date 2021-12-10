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
  :config
  (cnfonts--select-profile "program")
  (cnfonts-enable)
)

(provide 'init-chinese)
;;; init-chinese.el ends here
