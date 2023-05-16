;;; init-swift.el --- Apple languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package lsp-sourcekit
  :after lsp-mode
  :load-path "~/.emacs.d/site-lisp/lsp-sourcekit"
  :config
  (setq lsp-sourcekit-executable "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))


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

