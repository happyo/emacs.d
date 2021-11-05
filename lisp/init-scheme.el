(require-package 'scheme)
(require-package 'geiser-chez)
(require-package 'use-package)
(require-package 'flycheck-guile)

(use-package scheme
  :hook (scheme-mode . rainbow-delimiters-mode)
  :config (advice-add #'scheme-indent-function :override #'+scheme-scheme-indent-function-a))


(use-package flycheck-guile
  :after geiser)

(provide 'init-scheme)
;;; init-scheme.el ends here
