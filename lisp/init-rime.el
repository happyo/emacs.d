;;; init-rime.el --- Chinese input -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package rime
  :bind
  (:map rime-mode-map
        ("C-`" . 'rime-send-keybinding))
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'posframe))

(provide 'init-rime)
;;; init-rime.el ends here
