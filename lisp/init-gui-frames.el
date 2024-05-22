;;; init-gui-frames.el --- Behaviour specific to non-TTY frames -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'init-func)

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
  (add-to-list 'initial-frame-alist no-border))

(use-package transwin)
(global-set-key (kbd "M-C-e") (lambda () (interactive) (transwin-dec)))
(global-set-key (kbd "M-C-r") (lambda () (interactive) (transwin-inc)))

(use-package ns-auto-titlebar)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Non-zero values for `line-spacing' can mess up ansi-term and co,
;; so we zero it explicitly in those cases.
(add-hook 'term-mode-hook
          (lambda ()
            (setq line-spacing 0)))

;;(set-default line-spacing 02)

;; Change global font size easily

(use-package default-text-scale)
(when *is-a-mac* (ns-auto-titlebar-mode))

(use-package disable-mouse)

(defun my-set-window-margins ()
  (set-window-margins nil 1 1))

(add-hook 'window-configuration-change-hook 'my-set-window-margins)
;; (setq-default header-line-format " ")
;; (set-face-attribute 'header-line nil :height 100)

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
