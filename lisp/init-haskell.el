;;; init-dash.el --- Integrate with the Mac app "Dash" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'lsp-haskell)
(require-package 'haskell-mode)
(require-package 'use-package)

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

(use-package lsp-haskell
 :config
 (setq lsp-haskell-server-path "haskell-language-server-wrapper")
 ;; Comment/uncomment this line to see interactions between lsp client/server.
 ;;(setq lsp-log-io t)
)

(provide 'init-haskell)
;;; init-haskell.el ends here
