;;; init-magit.el --- Magit package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package magit
  :diminish
  :bind ("M-m" . magit)
  :config
  (setq magit-status-buffer-switch-function 'switch-to-buffer)

  ;; (setq magit-display-buffer-function
  ;;     (lambda (buffer)
  ;;       (display-buffer buffer '(display-buffer-same-window))))
  )

(provide 'init-magit)
;;; init-magit.el ends here
