
;;; init-sessions.el --- Save and restore editor sessions between restarts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(desktop-save-mode 1)

;; Restore histories and registers after saving

(setq-default history-length 1000)
;; (add-hook 'after-init-hook 'savehist-mode)
(savehist-mode 1)

(use-package session)

(setq session-save-file (locate-user-emacs-file ".session"))
(setq session-name-disable-regexp "\\(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)")
(setq session-save-file-coding-system 'utf-8)

(add-hook 'after-init-hook 'session-initialize)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
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


(provide 'init-sessions)
;;; init-sessions.el ends here
