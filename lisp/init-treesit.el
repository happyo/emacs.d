;;; init-treesit.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'swift-ts-mode)

(require 'treesit)
(use-package treesit-fold
  :hook (json-ts-mode . treesit-fold-mode))

;; (setq treesit-language-source-alist
;;       '((swift . ("https://github.com/alex-pinkus/tree-sitter-swift"  "main" "src"))))

;; (treesit-language-available-p 'swift)

(setq treesit-language-source-alist
      '((swift . ("~/develop/openSourceProject/swif-ts" nil "src"))
        ;; (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
        (python . ("https://github.com/tree-sitter/tree-sitter-python"))
        ))

(dolist (source treesit-language-source-alist)
  (unless (treesit-ready-p (car source))
    (treesit-install-language-grammar (car source))))

(add-to-list 'auto-mode-alist '("\\.swift\\'" . swift-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'major-mode-remap-alist '(swift-mode . swift-ts-mode))
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

;; (use-package treesit-auto
;;   :config
;;   (global-treesit-auto-mode))

(provide 'init-treesit)
;;; init-treesit.el ends here
