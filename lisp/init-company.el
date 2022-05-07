;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(require 'init-elpa)

(use-package company)
;; (use-package company
;;   :hook (after-init . global-company-mode)
;;   :init
;;   (setq company-idle-delay 0
;;       company-tooltip-idle-delay 10
;;       company-require-match nil
;;       )
;;   :config
;;   (defun company//sort-by-tabnine (candidates)
;;     (if (or (functionp company-backend)
;;             (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
;;         candidates
;;       (let ((candidates-table (make-hash-table :test #'equal))
;;             candidates-1
;;             candidates-2)
;;         (dolist (candidate candidates)
;;           (if (eq (get-text-property 0 'company-backend candidate)
;;                   'company-tabnine)
;;               (unless (gethash candidate candidates-table)
;;                 (push candidate candidates-2))
;;             (push candidate candidates-1)
;;             (puthash candidate t candidates-table)))
;;         (setq candidates-1 (nreverse candidates-1))
;;         (setq candidates-2 (nreverse candidates-2))
;;         (nconc (seq-take candidates-1 2)
;;                (seq-take candidates-2 2)
;;                (seq-drop candidates-1 2)
;;                (seq-drop candidates-2 2)))))

;;   (add-to-list 'company-transformers 'company//sort-by-tabnine t)
;;   ;; `:separate`  使得不同 backend 分开排序
;;   (add-to-list 'company-backends '(company-capf :with company-tabnine :separate))
;;   )
(use-package dash)
(use-package s)
(use-package editorconfig)
(load-file "~/.emacs.d/site-lisp/copilot.el/copilot.el")

(add-hook 'prog-mode-hook 'copilot-mode)

; complete by copilot first, then company-mode
(defun my-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (company-indent-or-complete-common nil)))

; modify company-mode behaviors
(with-eval-after-load 'company
  ; disable inline previews
  (delq 'company-preview-if-just-one-frontend company-frontends)
  ; enable tab completion
  (define-key company-mode-map (kbd "<tab>") 'my-tab)
  (define-key company-mode-map (kbd "TAB") 'my-tab)
  (define-key company-active-map (kbd "<tab>") 'my-tab)
  (define-key company-active-map (kbd "TAB") 'my-tab))

(u)

(provide 'init-company)
;;; init-company.el ends here
