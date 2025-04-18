;;; init-sessions.el --- Save and restore editor sessions between restarts -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package savehist
  :init
  (savehist-mode))

;; (desktop-save-mode 1)

;; ;; Restore histories and registers after saving

;; (setq-default history-length 1000)
;; (savehist-mode 1)

;; (recentf-mode 1)
;; (setq recentf-max-menu-items 25)
;; (setq recentf-max-saved-items 25)

;; Save a bunch of variables to the desktop file
;; For lists, specify the length of the maximal saved data also
(setq desktop-globals-to-save
      '((comint-input-ring        . 50)
        (compile-history          . 30)
        desktop-missing-file-warning
        (dired-regexp-history     . 20)
        (extended-command-history . 30)
        (grep-find-history        . 30)
        (grep-history             . 30)
        (ivy-history              . 100)
        (magit-revision-history   . 50)
        (minibuffer-history       . 50)
        (query-replace-history    . 60)
        (read-expression-history  . 60)
        (regexp-history           . 60)
        (regexp-search-ring       . 20)
        register-alist
        (search-ring              . 20)
        (shell-command-history    . 50)
        ))

;; use-package with package.el:
(use-package dashboard
  :demand t
  :ensure t
  :hook (dashboard-mode . my-dashboard-setup)
  :config
  (setq dashboard-banner-logo-title "Happy hacking, belyenochi - Emacs ♥ you!")
  (setq dashboard-center-content t)
  (setq dashboard-projects-backend 'project-el)
  (setq dashboard-vertically-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-items '((recents   . 5)
                          (projects  . 5)
                          ))
  (setq dashboard-startup-banner "~/.emacs.d/icon/ascii-art.txt")
  (setq dashboard-item-shortcuts '((recents   . "r")
                                   (bookmarks . "m")
                                   (projects  . "p")
                                   (agenda    . "a")
                                   (registers . "e")))
  
  (dashboard-setup-startup-hook))

(defun my-dashboard-setup ()
  ;; Line spacing
  (setq-local line-spacing nil)
  )

(use-package easysession
  :ensure t
  :commands (easysession-switch-to
             easysession-save-as
             easysession-save-mode
             easysession-load-including-geometry)

  :custom
  (easysession-mode-line-misc-info t)  ; Display the session in the modeline
  (easysession-save-interval (* 10 60))  ; Save every 10 minutes

  :init
  (add-hook 'emacs-startup-hook #'easysession-load-including-geometry 102)
  (add-hook 'emacs-startup-hook #'easysession-save-mode 103))

(provide 'init-sessions)
;;; init-sessions.el ends here
