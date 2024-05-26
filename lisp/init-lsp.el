;;; init-lsp.el --- lsp support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'init-func)
(require 'init-yasnippet)

(use-package unicode-escape)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package posframe)

(use-package lsp-bridge
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/lsp-bridge"
  :config
  (setq lsp-bridge-python-command (pythonPath))
  ;; (setq acm-enable-tempel nil)
  ;; (setq acm-enable-citre t)
  ;; (setq lsp-bridge-enable-log t)
  ;; (setq lsp-bridge-enable-signature-help t)
  (setq acm-enable-tabnine nil)
  (setq acm-enable-codeium nil)
  (setq acm-enable-copilot nil)
  (setq lsp-bridge-enable-org-babel t)
  (setq lsp-bridge-enable-hover-diagnostic t)
  (setq lsp-bridge-diagnostic-fetch-idle 0.5)
  (global-lsp-bridge-mode)
  )

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/treesit-auto")

(use-package prettier-js)

(provide 'init-lsp)
;;; init-lsp.el ends here
