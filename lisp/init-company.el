;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(require 'init-elpa)

;; (use-package company)
(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-excluded-modes'.
  :init
  (global-corfu-mode))
;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))
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
;; (defun my-tab ()
;;   (interactive)
;;   (or (copilot-accept-completion)
;;       (company-indent-or-complete-common nil)))

;; ; modify company-mode behaviors
;; (with-eval-after-load 'company
;;   ; disable inline previews
;;   (delq 'company-preview-if-just-one-frontend company-frontends)
;;   ; enable tab completion
;;   (define-key company-mode-map (kbd "<tab>") 'my-tab)
;;   (define-key company-mode-map (kbd "TAB") 'my-tab)
;;   (define-key company-active-map (kbd "<tab>") 'my-tab)
;;   (define-key company-active-map (kbd "TAB") 'my-tab))


(provide 'init-company)
;;; init-company.el ends here
