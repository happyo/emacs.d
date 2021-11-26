;;; init-dart.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(require-package 'dart-mode)
(require-package 'lsp-dart)
(require-package 'lsp-treemacs)

(add-hook 'dart-mode-hook 'lsp)


(provide 'init-dart)
;;; init-dart.el ends here
