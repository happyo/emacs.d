;;; init-swift.el --- Apple languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

;; (use-package lsp-sourcekit
;;   :after lsp-mode
;;   :config
;;   (setq lsp-sourcekit-executable "/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

(use-package swift-mode)
;; (use-package objc-mode)
(use-package objc-font-lock
  :ensure t
  :hook (objc-mode . objc-font-lock-mode))

(provide 'init-swift)
;;; init-swift.el ends here

