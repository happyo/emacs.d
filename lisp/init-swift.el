;;; init-swift.el --- Apple languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

;; (use-package lsp-sourcekit
;;   :after lsp-mode
;;   :config
;;   (setq lsp-sourcekit-executable "/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

(use-package swift-mode)

(provide 'init-swift)
;;; init-swift.el ends here

