;;; init-swift.el --- Apple languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'swift-mode)

(use-package cc-mode
    :ensure nil
    :config
  (setq c-basic-offset 4))
(add-to-list 'auto-mode-alist '("\\.m\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . objc-mode))

;; (use-package swift-mode)
(use-package objc-font-lock
  :ensure t
  :hook (objc-mode . objc-font-lock-mode))

;; (defvar swift--treesit-settings
;;   (treesit-font-lock-rules
;;    :feature 'comment
;;    :language 'swift
;;    :override t
;;    '((prefix_expression
;;       target: (simple_identifier) @font-lock-variable-name-face
;;       operation: "." @font-lock-operator-face))

;;    ;; :feature 'string
;;    ;; :language 'swift
;;    ;; '((string) @font-lock-string-face)

;;    ;; :feature 'function-name
;;    ;; :language 'swift
;;    ;; '((function_declaration
;;    ;;    name: (identifier) @font-lock-function-name-face))

;;    ;; :feature 'class-name
;;    ;; :language 'swift
;;    ;; '((class_declaration
;;    ;;    name: (identifier) @font-lock-type-face))

;;    ;; 添加更多特性...
;;    ))

;; (define-derived-mode swift-ts-mode swift-mode "Swift"
;;   ;; 其他 Swift 模式设置...
;;   (when (treesit-ready-p 'swift) ; 确保 tree-sitter 支持 Swift
;;     (treesit-parser-create 'swift) ; 创建 Swift 的 tree-sitter 解析器
;;     (setq-local treesit-font-lock-settings swift--treesit-settings) ; 应用字体锁定设置
;;     (setq-local treesit-font-lock-feature-list
;;                 '(( comment ) ; 启用的特性
;;                   ;; 可以在这里添加更多特性
;;                   ))
;;     (treesit-major-mode-setup))) ; 设置 tree-sitter 主模式


(provide 'init-swift)
;;; init-swift.el ends here

