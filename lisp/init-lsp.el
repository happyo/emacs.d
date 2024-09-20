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
  :bind (
         ("M-." . lsp-bridge-find-def)
         ("M-," . lsp-bridge-find-def-return)
         ("M-[" . lsp-bridge-code-format)
         )
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
  (setq lsp-bridge-diagnostic-fetch-idle 0.2)
  (setq lsp-bridge-enable-completion-in-minibuffer t)
  (setq lsp-bridge-find-def-fallback-function 'xref-find-definitions)
  (setq lsp-bridge-find-def-return-fallback-function 'xref-pop-marker-stack)
  (setq acm-backend-lsp-match-mode "prefix")
  (setq acm-enable-capf t)
  ;; (define-key my-custom-minor-mode-map (kbd "M-.") 'my-custom-m-dot-function)
  ;; (define-key my-custom-minor-mode-map (kbd "M-,") 'lsp-bridge-find-def-return)
  ;; (define-key my-custom-minor-mode-map (kbd "M-]") 'lsp-bridge-code-format)
  (global-lsp-bridge-mode)
  )

;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;     '(swift-ts-mode . ("xcrun" "sourcekit-lsp"))))

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/treesit-auto")

(use-package apheleia
  :demand t
  :ensure t
  :after lsp-bridge
  :bind (("M-]" . apheleia-format-buffer))
  :config
  (setq +format-with-lsp nil)
  ;; which formatter to use
  (setf (alist-get 'python-mode apheleia-mode-alist) 'ruff)
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) 'ruff)

  (setq apheleia-remote-algorithm 'local)
  (add-hook 'apheleia-post-format-hook #'lsp-bridge-update-tramp-docker-file-mod-time))

;; (use-package prettier-js)

(provide 'init-lsp)
;;; init-lsp.el ends here
