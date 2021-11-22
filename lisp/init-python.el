;; (require-package 'anaconda-mode)
(require-package 'lsp-pyright)
(require-package 'conda)
(require-package 'pyimport)
(require-package 'pip-requirements)
(require-package 'use-package)

(setq python-shell-interpreter "python3")

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred


(provide 'init-python)
;;; init-python.el ends here
