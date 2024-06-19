;;; init-lisp.el --- Emacs lisp settings, and common config for other lisps -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))


(defun sanityinc/headerise-elisp ()
  "Add minimal header and footer to an elisp buffer in order to placate flycheck."
  (interactive)
  (let ((fname (if (buffer-file-name)
                   (file-name-nondirectory (buffer-file-name))
                 (error "This buffer is not visiting a file"))))
    (save-excursion
      (goto-char (point-min))
      (insert ";;; " fname " --- Insert description here -*- lexical-binding: t -*-\n"
              ";;; Commentary:\n"
              ";;; Code:\n\n")
      (goto-char (point-max))
      (insert ";;; " fname " ends here\n"))))

(global-set-key (kbd "M-r") 'eval-last-sexp)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl")
  )
;; Interactive macro expander
;; (use-package macrostep
;;   :custom-face
;;   (macrostep-expansion-highlight-face ((t (:inherit tooltip :extend t))))
;;   :bind (:map emacs-lisp-mode-map
;;          ("C-c e" . macrostep-expand)
;;          :map lisp-interaction-mode-map
;;          ("C-c e" . macrostep-expand)))

(provide 'init-lisp)
;;; init-lisp.el ends here
