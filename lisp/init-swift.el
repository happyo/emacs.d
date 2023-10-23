;;; init-swift.el --- Apple languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package cc-mode
    :ensure nil
    :config
    (setq c-basic-offset 4))

(use-package swift-mode)
(use-package objc-font-lock
  :ensure t
  :hook (objc-mode . objc-font-lock-mode))

(provide 'init-swift)
;;; init-swift.el ends here

