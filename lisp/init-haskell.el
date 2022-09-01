;;; init-haskell.el --- haskell programming -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package haskell-mode
  :config
  (add-hook 'haskell-mode-hook (lambda () (haskell-indentation-mode -1))))

(provide 'init-haskell)
;;; init-haskell.el ends here
