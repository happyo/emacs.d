;;; init-editing-utils.el --- Day-to-day editing helpers -*- lexical-binding: t -*-
;;; Commentary: Some helpful default setting
;;; Code:
(require 'init-elpa)

(global-auto-revert-mode 1)

(use-package hl-line
  :hook (after-init . global-hl-line-mode)
  :config
  (setq hl-line-sticky-flag nil)
  ;; Highlight starts from EOL, to avoid conflicts with other overlays
  (setq hl-line-range-function (lambda () (cons (line-end-position)
                                           (line-beginning-position 2)))))
;; (global-hl-line-mode 1)
;; (use-package lin
;;   :ensure t
;;   :demand t
;;   :config
;;   (setq lin-face 'lin-cyan) ; check doc string for alternative styles
;;   (setq lin-mode-hooks
;;         '(bongo-mode-hook
;;           dired-mode-hook
;;           elfeed-search-mode-hook
;;           git-rebase-mode-hook
;;           grep-mode-hook
;;           ibuffer-mode-hook
;;           ilist-mode-hook
;;           ledger-report-mode-hook
;;           log-view-mode-hook
;;           magit-log-mode-hook
;;           mu4e-headers-mode-hook
;;           notmuch-search-mode-hook
;;           notmuch-tree-mode-hook
;;           occur-mode-hook
;;           org-agenda-mode-hook
;;           pdf-outline-buffer-mode-hook
;;           proced-mode-hook
;;           tabulated-list-mode-hook
;;           prog-mode-hook
;;           ))
;;   (lin-global-mode 1)
;;   )

(use-package format-all)

;; Type speed
(use-package speed-type)

;; Indent
(use-package indent-guide
  :config
  (set-face-background 'indent-guide-face "#dcdcdc")
  (setq indent-guide-delay 0.1)
  (indent-guide-global-mode)
)

(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-indent-mode)
  )

(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border (face-background 'default))

;;; Some basic preferences
(blink-cursor-mode 1)
(setq-default
 blink-cursor-interval 0.5
 blink-cursor-blinks 0
 bookmark-default-file (locate-user-emacs-file ".bookmarks.el")
 buffers-menu-max-size 30
 case-fold-search t
 ;; column-number-mode t
 ediff-window-setup-function 'ediff-setup-windows-plain
 ediff-split-window-function 'split-window-horizontally
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

;; (use-package fill-column-indicator)

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

;; (use-package which-key
;;   :init
;;   (setq-default which-key-idle-delay 1.5)
;;   :config
;;   (which-key-mode))

(use-package smartparens-mode
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config))

;; undo
(use-package vundo)

(use-package dogears
  :ensure t
  :demand t
  :hook (after-init . dogears-mode)
  :bind (:map global-map
              ("M-g d" . dogears-go)
              ("M-g b" . dogears-back)
              ("M-g f" . dogears-forward)
              ("M-g l" . dogears-list)
              ("M-g D" . dogears-sidebar))
  :config
  (setq dogears-idle 1
        dogears-limit 200
        dogears-position-delta 20)
  (setq dogears-functions '(find-file recenter-top-bottom
                                      other-window switch-to-buffer
                                      aw-select toggle-window-split
                                      windmove-do-window-select
                                      pager-page-down pager-page-up
                                      tab-bar-select-tab
                                      pop-to-mark-command
                                      pop-global-mark
                                      goto-last-change
                                      xref-go-back
                                      xref-find-definitions
                                      xref-find-references)))

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
