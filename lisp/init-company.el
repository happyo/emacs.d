;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(require 'init-elpa)

(use-package company)
(use-package company-tabnine)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)


;; Customize company backends.
(setq company-backends
      '(
        (company-tabnine company-dabbrev company-keywords company-files company-capf)
        ))


;; Add yasnippet support for all company backends.
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

;; Add `company-elisp' backend for elisp.
(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
              (require 'company-elisp)
              (push 'company-elisp company-backends)))

;; Remove duplicate candidate.
;; (add-to-list 'company-transformers #'delete-dups)
;; (when (maybe-require-package 'company)
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   (with-eval-after-load 'company
;;     (diminish 'company-mode)
;;     (setq company-idle-delay 0
;;         company-show-quick-access t)
;;     (define-key company-mode-map (kbd "M-/") 'company-complete)
;;     (define-key company-mode-map [remap completion-at-point] 'company-complete)
;;     (define-key company-mode-map [remap indent-for-tab-command] 'company-indent-or-complete-common)
;;     (define-key company-active-map (kbd "M-/") 'company-other-backend)
;;     (define-key company-active-map (kbd "C-n") 'company-select-next)
;;     (define-key company-active-map (kbd "C-p") 'company-select-previous)
;;     (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
;;     (define-key company-active-map (kbd "M-.") 'company-show-location)
;;     (setq-default company-dabbrev-other-buffers 'all
;;                   company-tooltip-align-annotations t))
;;   (global-set-key (kbd "M-C-/") 'company-complete)
;;   (when (maybe-require-package 'company-quickhelp)
;;     (add-hook 'after-init-hook 'company-quickhelp-mode)))

;; (set-company-backend! '(c-mode
;;                         c++-mode
;;                         ess-mode
;;                         haskell-mode
;;                         lisp-mode
;;                         sh-mode
;;                         php-mode
;;                         python-mode
;;                         go-mode
;;                         ruby-mode
;;                         rust-mode
;;                         js-mode
;;                         css-mode
;;                         web-mode
;;                         dart-mode
;;                         )
;;   '(:separate company-tabnine
;;     company-files
;;     company-yasnippet))

;; (setq +lsp-company-backend '(company-lsp :with company-tabnine :separate))


(provide 'init-company)
;;; init-company.el ends here
