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

(global-lsp-bridge-mode)

;; (use-package dumb-jump)
;; (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
;; (setq xref-show-definitions-function #'xref-show-definitions-completing-read)


(use-package treesit-auto
  :demand t
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   ;; (setq lsp-completion-enable nil)
;;   (setq lsp-headerline-breadcrumb-enable nil)
;;   (setq lsp-completion-provider :none)
;;   (setq lsp-modeline-diagnostics-enable nil)
;;   (setq lsp-modeline-code-actions-enable nil)
;;   (setq lsp-lens-enable nil)

;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (dart-mode . lsp)
;;          (haskell-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands (lsp lsp-deferred))

;; ;; Debug
;; (use-package dap-mode)
;; ;; UI
;; (use-package lsp-ui :commands lsp-ui-mode)


(use-package prettier-js)

(provide 'init-lsp)
;;; init-lsp.el ends here
