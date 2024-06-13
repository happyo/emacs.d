;;; init-gui-frames.el --- Behaviour specific to non-TTY frames -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'init-func)

(use-package imenu-list
  :ensure t
  )
;; Suppress GUI features

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)

;; Window size and features

(setq-default
 window-resize-pixelwise t
 frame-resize-pixelwise t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(menu-bar-mode -1)

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
)
;; (setq default-frame-alist '((undecorated . t)))


(use-package transwin)
(global-set-key (kbd "M-C-e") (lambda () (interactive) (transwin-dec)))
(global-set-key (kbd "M-C-r") (lambda () (interactive) (transwin-inc)))

(use-package ns-auto-titlebar
  :demand t
  :config
  (when *is-a-mac* (ns-auto-titlebar-mode))
  )

(setq frame-title-format "")

;; so we zero it explicitly in those cases.
(setq line-spacing 0.3)

;; (defun set-my-prog-mode-line-spacing ()
;;   "Set line spacing in programming modes."
;;   (setq line-spacing 0.3))  ; 可以调整这个值来适应你的喜好

;; (add-hook 'prog-mode-hook 'set-my-prog-mode-line-spacing)

;; Change global font size easily

(use-package default-text-scale)

(use-package disable-mouse)

;; (defun my-set-window-margins ()
;;   (set-window-margins nil 1 1))

;; (add-hook 'window-configuration-change-hook 'my-set-window-margins)
;; (setq-default header-line-format " ")
;; (set-face-attribute 'header-line nil :height 100)
(use-package olivetti
  :ensure t
  :init
  (setq olivetti-body-width 0.5)
  :hook
  (prog-mode . olivetti-mode))

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
