;;; init-lsp.el --- lsp support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package yasnippet)
(use-package yasnippet-snippets)


(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (lisp-mode . lsp-deffered)
         (dart-mode . lsp-deffered)
         (haskell-mode . lsp-deffered)
         ;;  ;; if you want which-key integration
         ;;  (lsp-mode . lsp-enable-which-key-integration)
         )
  :commands (lsp lsp-deffered))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
;; (use-package which-key
;;     :config
;;     (which-key-mode))
(provide 'init-lsp)
;;; init-lsp.el ends here
