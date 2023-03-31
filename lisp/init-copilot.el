;;; init-copilot.el --- Integrate copilot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my/copilot-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (indent-for-tab-command)))

(use-package copilot
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/copilot"
  :config
  (define-key copilot-mode-map (kbd "<tab>") #'my/copilot-tab)
  (define-key copilot-mode-map (kbd "s-<tab>") #'copilot-accept-completion-by-word)
)

(provide 'init-copilot)
;;; init-copilot.el ends here
