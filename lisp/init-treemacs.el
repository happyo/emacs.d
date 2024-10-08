;;; init-treemacs.el --- Integrate with the "Treemacs" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("M-T"   . treemacs-add-and-display-current-project-exclusively)
        ("M-t"   . treemacs)
        ("M-J"   . treemacs-find-file)
        ("M-1"   . treemacs-delete-other-windows)
        ("M-d"   . treemacs-select-directory)
        ("M-B"   . treemacs-bookmark)
        ("M-C-t" . treemacs-find-file)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file))
  :config
  (setq treemacs-indentation 1)
  (define-key treemacs-mode-map (kbd "M-m") 'magit-status)
  (setq treemacs-user-mode-line-format 'none)
  (setq treemacs-show-cursor nil)
  (setq treemacs-tag-follow-delay 0.3)
  )

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t
  )

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(provide 'init-treemacs)
;;; init-treemacs.el ends here
