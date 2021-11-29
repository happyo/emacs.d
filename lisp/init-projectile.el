;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package projectile
  :bind
  ("C-c p" . 'projectile-command-map)
  :config
  (add-hook 'after-init-hook 'projectile-mode)
  (setq-default projectile-mode-line-prefix " Proj")

  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden"))

  (use-package ibuffer-projectile)
  )

(provide 'init-projectile)
;;; init-projectile.el ends here
