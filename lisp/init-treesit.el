;;; init-treesit.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'swift-ts-mode)

(require 'treesit)

(setq treesit-language-source-alist
      '((swift . ("https://github.com/alex-pinkus/tree-sitter-swift"))))

(treesit-language-available-p 'swift)

(provide 'init-treesit)
;;; init-treesit.el ends here
