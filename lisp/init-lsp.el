;;; init-lsp.el --- lsp support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'init-func)

(use-package unicode-escape)

(use-package yasnippet)
(use-package yasnippet-snippets)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package posframe)

(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge")

(require 'yasnippet)
(yas-global-mode 1)


(require 'lsp-bridge)
(setq lsp-bridge-python-command (pythonPath))
;; (defun my-lsp-bridge-workspace (proj)
;;   (let* ((proj-2-workspace
;;           '(("/Users/belyenochi/work/tempWork/example-package-dealer" .
;;              "file:///Users/belyenochi/work/tempWork/example-package-dealer")
;;             ("/home/user/projects/workspace2/proj2" .
;;              "file:///home/user/projects/workspace2/")))
;;          (kv (assoc proj proj-2-workspace)))
;;     (when kv
;;         (cdr kv))))

;; (custom-set-variables '(lsp-bridge-get-workspace-folder 'my-lsp-bridge-workspace))


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

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/treesit-auto")
(require 'treesit)
;; (require 'treesit-auto)
(add-to-list 'auto-mode-alist '("\\.swift\\'" . swift-ts-mode))

;; ;; Debug
;; (use-package dap-mode)

(use-package prettier-js)

(provide 'init-lsp)
;;; init-lsp.el ends here
