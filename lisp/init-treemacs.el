;;; init-treemacs.el --- Integrate with the "Treemacs" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (require 'treemacs-all-the-icons)

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
  ;; (treemacs-load-all-the-icons-with-workaround-font "monego")
  )

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)


(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

;; (use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
;;   :after (treemacs persp-mode) ;;or perspective vs. persp-mode
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Perspectives))

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/treemacs-nerd-icons")
;; (require 'treemacs-nerd-icons)
;; (treemacs-load-theme "nerd-icons")

(provide 'init-treemacs)
;;; init-treemacs.el ends here
