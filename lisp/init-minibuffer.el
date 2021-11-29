;;; init-minibuffer.el --- Config for minibuffer completion       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (when (maybe-require-package 'vertico)
;;   (add-hook 'after-init-hook 'vertico-mode)

;;   (require-package 'orderless)
;;   (with-eval-after-load 'vertico
;;     (require 'orderless))

;;   (defun sanityinc/use-orderless-in-minibuffer ()
;;     (setq-local completion-styles '(substring orderless)))
;;   (add-hook 'minibuffer-setup-hook 'sanityinc/use-orderless-in-minibuffer)

;;   (when (maybe-require-package 'embark)
;;     (with-eval-after-load 'vertico
;;       (define-key vertico-map (kbd "C-c C-o") 'embark-export)
;;       (define-key vertico-map (kbd "C-c C-c") 'embark-act)))

;;   (when (maybe-require-package 'consult)
;;     (defmacro sanityinc/no-consult-preview (&rest cmds)
;;       `(with-eval-after-load 'consult
;;          (consult-customize ,@cmds :preview-key (kbd "M-P"))))

;;     (sanityinc/no-consult-preview
;;      consult-ripgrep
;;      consult-git-grep consult-grep
;;      consult-bookmark consult-recent-file consult-xref
;;      consult--source-file consult--source-project-file consult--source-bookmark)

;;     (when (maybe-require-package 'projectile)
;;       (setq-default consult-project-root-function 'projectile-project-root))

;;     (when (and (executable-find "rg") (maybe-require-package 'affe))
;;       (defun sanityinc/affe-grep-at-point (&optional dir initial)
;;         (interactive (list prefix-arg (when-let ((s (symbol-at-point)))
;;                                         (symbol-name s))))
;;         (affe-grep dir initial))
;;       (global-set-key (kbd "M-?") 'sanityinc/affe-grep-at-point)
;;       (sanityinc/no-consult-preview sanityinc/affe-grep-at-point)
;;       (with-eval-after-load 'affe (sanityinc/no-consult-preview affe-grep)))

;;     (global-set-key [remap switch-to-buffer] 'consult-buffer)
;;     (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
;;     (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
;;     (global-set-key [remap goto-line] 'consult-goto-line)



;;     (when (maybe-require-package 'embark-consult)
;;       (with-eval-after-load 'embark
;;         (require 'embark-consult)
;;         (add-hook 'embark-collect-mode-hook 'embark-consult-preview-minor-mode)))

;;     (maybe-require-package 'consult-flycheck)))

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))
;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Optionally use the `orderless' completion style. See
;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; dispatcher. Additionally enable `partial-completion' for file path
;; expansion. `partial-completion' is important for wildcard support.
;; Multiple files can be opened at once with `find-file' if you enter a
;; wildcard. You may also give the `initials' completion style a try.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
