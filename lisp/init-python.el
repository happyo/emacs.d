;;; init-python.el --- Integrate with the "Python" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; (require-package 'anaconda-mode)

(require 'init-elpa)

(use-package conda)
(use-package pyimport)
(use-package pip-requirements)

(setq python-shell-interpreter "python3")

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred

;; (when (maybe-require-package 'reformatter)
;;   (reformatter-define black :program "black" :args '("-")))

(provide 'init-python)
;;; init-python.el ends here
