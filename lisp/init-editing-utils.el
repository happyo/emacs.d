;;; init-editing-utils.el --- Day-to-day editing helpers -*- lexical-binding: t -*-
;;; Commentary: Some helpful default setting
;;; Code:
(require 'init-elpa)

(use-package format-all)

(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))
(add-hook 'after-init-hook 'electric-indent-mode)

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
 ;; mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 ;; scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 tab-width 4)

(delete-selection-mode 1)
(transient-mark-mode 1)

(setq scroll-preserve-screen-position t)


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

(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 3)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  )

(use-package fill-column-indicator)

;; rainbow-delimiters is a "rainbow parentheses"-like mode which highlights delimiters such as parentheses
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; Show matching parens
(add-hook 'after-init-hook 'show-paren-mode)

(use-package move-dup)
(global-set-key [M-up] 'move-dup-move-lines-up)
(global-set-key [M-down] 'move-dup-move-lines-down)
(global-set-key [M-S-up] 'move-dup-move-lines-up)
(global-set-key [M-S-down] 'move-dup-move-lines-down)

(global-set-key (kbd "C-c d") 'move-dup-duplicate-down)
(global-set-key (kbd "C-c u") 'move-dup-duplicate-up)

(use-package which-key
  :init
  (setq-default which-key-idle-delay 1.5)
  :config
  (add-hook 'after-init-hook 'which-key-mode))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (add-hook 'prog-mode-hook 'smartparens-mode))

;; (use-package smex
;;   :config
;;   (smex-initialize))

;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; undo
(use-package vundo)

(use-package vimish-fold
  :bind (("C-c f" . vimish-fold)
         ("C-c d" . vimish-fold-delete)
         ("C-c t" . vimish-fold-toggle)))

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
