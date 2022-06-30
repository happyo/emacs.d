;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package flucui-themes)

(use-package moe-theme)

(load-theme 'moe-dark t)

(use-package dimmer
  :config
  (dimmer-configure-which-key)
  (dimmer-mode t)
  )

(use-package all-the-icons
  :if (display-graphic-p))

(provide 'init-themes)
;;; init-themes.el end
