;;; init-editing-utils.el --- Day-to-day editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package format-all)

;; (use-package unfill)

(global-set-key (kbd "M-/") 'comment-line)
(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-s") 'save-buffer)
;; (global-set-key (kbd "M-w") 'kill-current-buffer)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-K") 'delete-window)
(global-set-key (kbd "M-d") 'delete-char)

(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))
(add-hook 'after-init-hook 'electric-indent-mode)

;; (maybe-require-package 'list-unicode-display)

;;; Some basic preferences

(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (locate-user-emacs-file ".bookmarks.el")
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 create-lockfiles nil
 auto-save-default nil
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(add-hook 'after-init-hook 'delete-selection-mode)

;; (add-hook 'after-init-hook 'global-auto-revert-mode)
;; (setq global-auto-revert-non-file-buffers t
;;       auto-revert-verbose nil)
;; (with-eval-after-load 'autorevert
;;   (diminish 'auto-revert-mode))

(add-hook 'after-init-hook 'transient-mark-mode)


;; Huge files

;; (when (fboundp 'so-long-enable)
;;   (add-hook 'after-init-hook 'so-long-enable))

;; (use-package 'vlf)

;; (defun ffap-vlf ()
;;   "Find file at point with VLF."
;;   (interactive)
;;   (let ((file (ffap-file-at-point)))
;;     (unless (file-exists-p file)
;;       (error "File does not exist: %s" file))
;;     (vlf file)))

;;; A simple visible bell which works in all terminal types
;; (require-package 'mode-line-bell)
;; (add-hook 'after-init-hook 'mode-line-bell-mode)


(use-package beacon
  :init
  (setq-default beacon-lighter "")
  (setq-default beacon-size 20)
  (setq-default beacon-color "#E45C5C")
  :config
  (beacon-mode 1))


(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 3)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  )

(use-package fill-column-indicator)

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Show matching parens
(add-hook 'after-init-hook 'show-paren-mode)

(use-package avy
  :bind
  ("C-;" . 'avy-goto-char-timer))

(use-package move-dup)
(global-set-key [M-up] 'move-dup-move-lines-up)
(global-set-key [M-down] 'move-dup-move-lines-down)
(global-set-key [M-S-up] 'move-dup-move-lines-up)
(global-set-key [M-S-down] 'move-dup-move-lines-down)

(global-set-key (kbd "C-c d") 'move-dup-duplicate-down)
(global-set-key (kbd "C-c u") 'move-dup-duplicate-up)

;; (use-package highlight-escape-sequences)
;; (add-hook 'after-init-hook 'hes-mode)

(use-package which-key)
(add-hook 'after-init-hook 'which-key-mode)
(setq-default which-key-idle-delay 1.5)

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
