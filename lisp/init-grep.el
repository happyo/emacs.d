;;; init-grep.el --- Settings for grep and grep-like tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'init-func)

(use-package counsel
  :diminish ivy-mode counsel-mode
  :hook ((after-init . ivy-mode)
         (ivy-mode . counsel-mode))
  :bind
  ("M-f" . counsel-git-grep)
  :config
  (setq enable-recursive-minibuffers t) ; Allow commands in minibuffers
  (setq swiper-action-recenter t)

  ;; Use the faster search tools
  (when (executable-find "rg")
    (setq counsel-grep-base-command "rg -S --no-heading --line-number --color never '%s' '%s'"))
  (when (executable-find "fd")
    (setq counsel-fzf-cmd
          "fd --type f --hidden --follow --exclude .git --color never '%s'"))
  ;; Enhance M-x
  (use-package amx
    :init (setq amx-history-length 20))

  ;; Ivy integration for Projectile
  (use-package counsel-projectile
    :hook (counsel-mode . counsel-projectile-mode)
    :init (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point)))

  ;; Integrate yasnippet
  (use-package ivy-yasnippet
    :bind ("C-c C-y" . ivy-yasnippet))

  ;; Avy integration
  (use-package ivy-avy
    :bind (:map ivy-minibuffer-map
           ("C-'" . ivy-avy)))
  ;; More friendly display transformer for Ivy
  (use-package ivy-rich
    :hook ((counsel-projectile-mode . ivy-rich-mode) ; MUST after `counsel-projectile'
           (ivy-rich-mode . ivy-rich-project-root-cache-mode)
           (ivy-rich-mode . (lambda ()
                              "Use abbreviate in `ivy-rich-mode'."
                              (setq ivy-virtual-abbreviate
                                    (or (and ivy-rich-mode 'abbreviate) 'name)))))
    :init
    ;; For better performance
    (setq ivy-rich-parse-remote-buffer nil))
  )

(provide 'init-grep)
;;; init-grep.el ends here
