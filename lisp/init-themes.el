;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (use-package flucui-themes)

;; (use-package moe-theme)

;; (load-theme 'moe-dark t)

(use-package ample-theme
  :init (progn (load-theme 'ample t t)
               (load-theme 'ample-flat t t)
               (load-theme 'ample-light t t)
               (enable-theme 'ample-light))
  :defer t
  :ensure t)

(use-package dimmer
  :config
  (dimmer-configure-which-key)
  (dimmer-mode t)
  )

(use-package all-the-icons
  :if (display-graphic-p))

(provide 'init-themes)
;;; init-themes.el end
