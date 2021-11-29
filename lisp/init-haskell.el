;;; init-haskell.el --- haskell programming -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package lsp-haskell
 :config
 (setq lsp-haskell-server-path "haskell-language-server-wrapper")
 ;; Comment/uncomment this line to see interactions between lsp client/server.
 ;;(setq lsp-log-io t)
)

(provide 'init-haskell)
;;; init-haskell.el ends here
