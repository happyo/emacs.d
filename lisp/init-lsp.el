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

;; (defun lsp-bridge--find-swift-package (dir)
;;   "Recursively search for a Package.swift file in DIR and its parent directories."
;;   (when dir
;;     (let ((package-file (expand-file-name "Package.swift" dir)))
;;       (if (file-exists-p package-file)
;;           dir
;;         (unless (string= dir "/")
;;           (lsp-bridge--find-swift-package (file-name-directory (directory-file-name dir))))))))


;; (defun lsp-bridge-get-workspace-folder (project-path language-id)
;;   "Return the workspace folder for the given PROJECT-PATH and LANGUAGE-ID."
;;   (if (not (equal language-id "swift"))
;;       ;; 如果 language-id 不是 Swift，返回空
;;       nil
;;     ;; 否则，寻找包含 Package.swift 的目录
;;     (let ((swift-package-dir (lsp-bridge--find-swift-package project-path)))
;;       (when swift-package-dir
;;         (let ((uri (concat "file://" (expand-file-name swift-package-dir))))
;;           ;; LSP格式的工作空间文件夹应该是一个列表，每个元素都是一个包含'uri'的字典
;;           (list (list :uri uri)))))))

;; ;; 更新 defcustom 的默认值以反映新的函数签名
;; (setq lsp-bridge-get-workspace-folder 'lsp-bridge-get-workspace-folder)

(global-lsp-bridge-mode)

;; (use-package dumb-jump)
;; (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
;; (setq xref-show-definitions-function #'xref-show-definitions-completing-read)

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/treesit-auto")
(require 'treesit)
;; (require 'treesit-auto)
(add-to-list 'auto-mode-alist '("\\.swift\\'" . swift-ts-mode))

;; (setq treesit-auto-install 'prompt)
;; ;; (treesit-auto-add-to-auto-mode-alist '(dart swift html json javascript typescript css markdown tsx))
;; ;; (setq treesit-auto-langs '(dart swift html json javascript typescript css markdown tsx))
;; ;;(add-to-list 'major-model-remap-alist '(dart-mode . dart-ts-mode))
;; (add-to-list 'major-model-remap-alist '(swift-mode . swift-ts-mode))
;; (global-treesit-auto-mode)
;; (use-package treesit-auto
;;   :demand t
;;   :config
;;   (setq treesit-auto-install 'prompt)
;;   (global-treesit-auto-mode))

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
