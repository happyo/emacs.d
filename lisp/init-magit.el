;;; init-magit.el --- Magit package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package transient
  :demand t)

(use-package with-editor
  :demand t)

(use-package magit
  :ensure t
  :demand t
  :after (transient with-editor)
  :bind ("M-m" . magit)
  :config
  (setq magit-status-buffer-switch-function 'switch-to-buffer)

  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  ;; (setq magit-display-buffer-function
  ;;     (lambda (buffer)
  ;;       (display-buffer buffer '(display-buffer-same-window))))
  )

(provide 'init-magit)
;;; init-magit.el ends here


