;;; init-copilot.el --- Integrate copilot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require 'init-func)

(use-package f
  :ensure t)

(use-package editorconfig)

(defun my/copilot-tab ()
  (interactive)
  (cond
   ((and (bound-and-true-p yas-minor-mode)
         (yas-active-snippets))
    (yas-next-field))
   ((copilot-accept-completion))
   (t
    (indent-for-tab-command))))

(use-package copilot
  :demand t
  :vc (:url "https://github.com/copilot-emacs/copilot.el.git" :branch "main")
  :hook (prog-mode . copilot-mode)
  :config
  (setq copilot-version "1.290.0")
  (define-key copilot-mode-map (kbd "<tab>") #'my/copilot-tab)
  ;; (define-key copilot-mode-map (kbd "s-<tab>") #'copilot-accept-completion-by-word)
  (define-key copilot-mode-map (kbd "M-e") #'copilot-accept-completion-by-word)
  )

;; (defadvice! +copilot--get-source-a (fn &rest args)
;;     :around #'copilot--get-source
;;     (cl-letf (((symbol-function #'warn) #'message))
;;       (apply fn args)))

(provide 'init-copilot)
;;; init-copilot.el ends here
