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

;; (when (fboundp 'tool-bar-mode)
;;   (tool-bar-mode -1))

;; after-init-hook
(add-hook 'after-init-hook (lambda () (tool-bar-mode -1)))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(menu-bar-mode -1)

(let ((no-border '(internal-border-width . 10)))
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
  :config
  (when *is-a-mac* (ns-auto-titlebar-mode))
  )

(setq ns-use-proxy-icon nil)
;; (setq frame-title-format "   ")
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(setq-default line-spacing 0.2)

;; (setq header-line-format "")
;; (set-face-attribute 'header-line nil :height 1.9)
;; (set-face-attribute 'header-line nil :background "#FFFFFF")

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
  (setq olivetti-body-width 0.9)
    ;; (setq olivetti-body-width 0.618)
  :hook
  (prog-mode . olivetti-mode)
  (org-mode . olivetti-mode)
  (markdown-mode . olivetti-mode)
  )


(use-package symbol-overlay
  :demand t
  :ensure t
  :hook
  (prog-mode . symbol-overlay-mode)
  )

;; (use-package solaire-mode
;;   :demand t
;;   :ensure t
;;   :config
;;   (solaire-global-mode +1))
;;   )

;; (use-package auto-dim-other-buffers
;;   :demand t
;;   :ensure t
;;   :config
;;   (auto-dim-other-buffers-mode t)
;;   (setq auto-dim-other-buffers-dim-on-switch-to-minibuffer nil)
;;   ;; 自定义灰显颜色
;;   (custom-set-faces
;;    '(auto-dim-other-buffers-face
;;      ((((background light)) (:background "#FFF5D3"))
;;       (t (:background "#FFF5D3"))))))

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
