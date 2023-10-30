;;; init-mode-line.el --- Intergration doom model line -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-themes)

(use-package diminish
  :ensure t)

(setq-default mode-line-format
                  (list
                   "-------- "
                   "%b--"
                   " "
                   ":"
                   '(line-number-mode "%l 行--")
                   '(:eval (format "%d 字" (count-words (point-min) (point-max))))
                   '(-6 "-- %p")
                   "%-"
                   ))

(provide 'init-mode-line)
;;; init-mode-line.el ends here
