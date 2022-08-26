;;; init-lsp.el --- lsp support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'init-func)

(use-package yasnippet)
(use-package yasnippet-snippets)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package posframe)

(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge")

(require 'yasnippet)
(yas-global-mode 1)


(require 'lsp-bridge)
(defun pythonPath ()
  "Different computer python path"
  (if *is-a-mac*
      (if (string-match-p user-login-name "happyo")
                                    "/opt/miniconda3/bin/python"
                                  "/Users/belyenochi/opt/anaconda3/bin/python")
  "/home/happyo/miniconda3/bin/python"))
(setq lsp-bridge-python-command (pythonPath))


(setq acm-snippet-insert-index 0)
(setq acm-enable-icon nil)
(setq acm-enable-tabnine-helper t)

(global-lsp-bridge-mode)

(use-package dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)

(global-set-key (kbd "M-.") 'xref-find-definitions)
(global-set-key (kbd "M-,") 'xref-pop-marker-stack)

(use-package unicode-escape)

(provide 'init-lsp)
;;; init-lsp.el ends here
