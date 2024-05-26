;;; init-treesit.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'swift-ts-mode)

(require 'treesit)


(setq treesit-language-source-alist
      '((swift . ("https://github.com/tree-sitter/tree-sitter-swift"))))

(treesit-language-available-p 'swift)


(defun setup-swift-treesit ()
  "Set up tree-sitter for Swift."
  (treesit-parser-create 'swift)
  (tree-sitter-hl-mode))

(add-hook 'swift-mode-hook #'setup-swift-treesit)
;; (require 'treesit-auto)
;; (add-to-list 'auto-mode-alist '("\\.swift\\'" . swift-ts-mode))

(provide 'init-treesit)
;;; init-treesit.el ends here
