;;; init-mode-line.el --- Intergration doom model line -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-themes)

(use-package diminish
  :ensure t)

(defun my-flycheck-error-count ()
  "Get the number of flycheck errors."
  (let ((errors (flycheck-count-errors flycheck-current-errors)))
    (or (cdr (assq 'error errors)) 0)))

(defun my-flycheck-warning-count ()
  "Get the number of flycheck warnings."
  (let ((errors (flycheck-count-errors flycheck-current-errors)))
    (or (cdr (assq 'warning errors)) 0)))

(defun my-flycheck-info-count ()
  "Get the number of flycheck infos."
  (let ((errors (flycheck-count-errors flycheck-current-errors)))
    (or (cdr (assq 'info errors)) 0)))

(defun my-flycheck-mode-line-string ()
  "Generate a string for flycheck errors and warnings for the mode line."
  (let ((e (my-flycheck-error-count))
        (w (my-flycheck-warning-count))
        (i (my-flycheck-info-count)))
    (cond
     (t (format " ☢ %d W %d ℹ %d " e w i)))))

(setq-default mode-line-format
              (list
               "-------- "
               "%b"
               " --- "
               '(line-number-mode "%l 行")
               " --- "
               '(:eval (format "%d 字" (count-words (point-min) (point-max))))
               " --- "
               '(-3 "%p")
               " --- "
               ;; "%-"
               ;; '(:eval (my-flycheck-mode-line-string))
               ;; lsp-bridge--mode-line-format
               ))

(provide 'init-mode-line)
;;; init-mode-line.el ends here
