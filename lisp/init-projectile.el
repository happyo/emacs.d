;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package projectile
  :bind
  ("C-c p" . 'projectile-command-map)
  ("M-p" . 'projectile-switch-project)
  :config
  (add-hook 'after-init-hook 'projectile-mode)
  (setq-default projectile-mode-line-prefix " Proj")
  (setq projectile-require-project-root nil)
  (setq projectile-enable-caching t)

  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden"))
  (projectile-global-mode)

  (use-package ibuffer-projectile)
  )

(provide 'init-projectile)
;;; init-projectile.el ends here
