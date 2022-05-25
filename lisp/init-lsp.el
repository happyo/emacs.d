;;; init-lsp.el --- lsp support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package yasnippet)
(use-package yasnippet-snippets)


;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   (setq lsp-headerline-breadcrumb-enable nil)
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (lisp-mode . lsp-deferred)
;;          (dart-mode . lsp-deferred)
;;          (haskell-mode . lsp-deferred)
;;          (python-mode . lsp-deferred)
;;          ;;  ;; if you want which-key integration
;;          ;;  (lsp-mode . lsp-enable-which-key-integration)
;;          )
;;   :commands (lsp lsp-deferred)
;;   )

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
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

(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge")

(require 'lsp-bridge)             ;; load lsp-bridge
(require 'lsp-bridge-jdtls)       ;; provide Java third-party library jump and -data directory support, optional
(yas-global-mode 1)

;; For corfu users:
(setq lsp-bridge-completion-provider 'corfu)
;; (require 'corfu)
(require 'corfu-info)
(require 'corfu-history)
(require 'lsp-bridge-icon)        ;; show icons for completion items, optional
(require 'lsp-bridge-orderless)   ;; make lsp-bridge support fuzzy match, optional
;; (global-corfu-mode)               ;; use corfu as completion ui
;; (corfu-history-mode t)
(global-lsp-bridge-mode)

(provide 'init-lsp)
;;; init-lsp.el ends here
