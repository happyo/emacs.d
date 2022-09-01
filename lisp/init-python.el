;;; init-python.el --- Integrate with the "Python" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; (require-package 'anaconda-mode)

(require 'init-elpa)

(use-package conda
  :init
  (custom-set-variables
   '(conda-anaconda-home "~/opt/anaconda3"))
  (setq conda-env-home-directory (expand-file-name "~/opt/anaconda3"))
  :config
  (conda-env-initialize-interactive-shells)
  ;; (conda-env-autoactivate-mode t)
  )

;; ;; (conda-env-autoactivate-mode t)
;; (add-hook 'find-file-hook (lambda () (when (bound-and-true-p conda-project-env-path)
;;                                           (conda-env-activate-for-buffer))))
;; (use-package pyimport)
;; (use-package pip-requirements)

;; (setq python-shell-interpreter "python3")

;; (use-package lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp-deferred))))  ; or lsp-deferred

;; (when (maybe-require-package 'reformatter)
;;   (reformatter-define black :program "black" :args '("-")))

(provide 'init-python)
;;; init-python.el ends here
