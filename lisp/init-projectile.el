;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(defun my-projectile-switch-project-advice (orig-fun &rest args)
  "Advice function for `projectile-switch-project'.
ORIG-FUN is the original `projectile-switch-project' function.
ARGS are the arguments passed to the original function."
  (let ((project-path (car args)))
    (tab-new)
    ;; (tab-rename (file-name-nondirectory (directory-file-name project-path)))
    (apply orig-fun args)))


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
  (advice-add 'projectile-switch-project :around #'my-projectile-switch-project-advice)

  (use-package ibuffer-projectile)
  )


(provide 'init-projectile)
;;; init-projectile.el ends here
