;;; init-copilot.el --- Integrate copilot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-func)

(defun my/copilot-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (indent-for-tab-command)))

(use-package copilot
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/copilot"
  :hook (prog-mode . copilot-mode)
  :config
  (define-key copilot-mode-map (kbd "<tab>") #'my/copilot-tab)
  (define-key copilot-mode-map (kbd "s-<tab>") #'copilot-accept-completion-by-word)
  (define-key copilot-mode-map (kbd "M-e") #'copilot-accept-completion-by-word)
)

(defadvice! +copilot--get-source-a (fn &rest args)
    :around #'copilot--get-source
    (cl-letf (((symbol-function #'warn) #'message))
      (apply fn args)))

(provide 'init-copilot)
;;; init-copilot.el ends here
