;;; init-sessions.el --- Save and restore editor sessions between restarts -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

(require 'init-elpa)

(desktop-save-mode 1)

;; Restore histories and registers after saving

(setq-default history-length 1000)
(savehist-mode 1)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

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

;; (add-hook 'after-init-hook 
;;           (lambda ()
;;             (modify-all-frames-parameters
;;              '((right-divider-width . 40)
;;                (internal-border-width . 40)))
;;             ;; other functions...
;;             ))

(add-hook 'desktop-after-read-hook
          (lambda ()
            (modify-all-frames-parameters
             '((right-divider-width . 30)
               (internal-border-width . 30)))
          ))
(provide 'init-sessions)
;;; init-sessions.el ends here
