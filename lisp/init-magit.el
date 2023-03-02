;;; init-magit.el --- Magit package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package magit
  :config
  (setq magit-status-buffer-switch-function 'switch-to-buffer))

(provide 'init-magit)
;;; init-magit.el ends here
