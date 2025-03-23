;;; init-search.el --- Settings for grep and grep-like tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'init-func)

;; (use-package substitute
;;   )

;; (require 'substitute)
;; ;; Set this to nil if you do not like visual feedback on the matching
;; ;; target.  Default is t.
;; (setq substitute-highlight nil)

;; ;; Set this to t if you want to always treat the letter casing
;; ;; literally.  Otherwise each command accepts a `C-u' prefix
;; ;; argument to do this on-demand.
;; (setq substitute-fixed-letter-case t)

;; ;; If you want a message reporting the matches that changed in the
;; ;; given context.  We don't do it by default.
;; (add-hook 'substitute-post-replace-functions #'substitute-report-operation)

;; ;; We do not bind any keys.  This is just an idea.  The mnemonic is
;; ;; that M-# (or M-S-3) is close to M-% (or M-S-5).
;; (let ((map global-map))
;;   (define-key map (kbd "M-# s") #'substitute-target-below-point)
;;   (define-key map (kbd "M-# r") #'substitute-target-above-point)
;;   (define-key map (kbd "M-# d") #'substitute-target-in-defun)
;;   (define-key map (kbd "M-# b") #'substitute-target-in-buffer))


(use-package vertico
  :ensure t
  :vc (:url "https://github.com/minad/vertico.git")
  :init
  (vertico-mode)
;;  (vertico-multiform-mode)
  :config
  (global-set-key (kbd "C-d") 'vertico-scroll-up)
  (global-set-key (kbd "C-u") 'vertico-scroll-down)
  (setq completion-styles '(fussy substring partial-completion initials))
  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.

  ;; (setq vertico-cycle t)
  ;; Persist history over Emacs restarts. Vertico sorts by history position.
  )

(use-package vertico-multiform
  :ensure nil
  :after vertico
  )

;; (use-package savehist
;;   :init
;;   (savehist-mode))

(use-package flx)

(use-package fussy
  :after flx
  :config
  (setq
   ;; For example, project-find-file uses 'project-files which uses
   ;; substring completion by default. Set to nil to make sure it's using
   ;; flx.
   completion-category-defaults nil
   completion-category-overrides nil))

(use-package vertico-posframe
  :ensure t
  :after vertico
  :config
  (setq vertico-posframe-parameters
      '((left-fringe . 10)
        (right-fringe . 10)))
  (setq vertico-posframe-poshandler #'posframe-poshandler-frame-top-center)
  (vertico-posframe-mode 1)
  )


;; Optionally use the `orderless' completion style. See
;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; dispatcher. Additionally enable `partial-completion' for file path
;; expansion. `partial-completion' is important for wildcard support.
;; Multiple files can be opened at once with `find-file' if you enter a
;; wildcard. You may also give the `initials' completion style a try.
;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Support opening new minibuffers from inside existing minibuffers.
  (setq enable-recursive-minibuffers t)

  ;; Emacs 28 and newer: Hide commands in M-x which do not work in the current
  ;; mode.  Vertico commands are hidden in normal buffers. This setting is
  ;; useful beyond Vertico.
  (setq read-extended-command-predicate #'command-completion-default-include-p))

;; Optionally use the `orderless' completion style.
;; (use-package orderless
;;   :init
;;   ;; Configure a custom style dispatcher (see the Consult wiki)
;;   ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
;;   ;;       orderless-component-separator #'orderless-escapable-split-on-space)
;;   (setq completion-styles '(orderless basic)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles partial-completion)))))

                                        ; Example configuration for Consult
(use-package consult
  :ensure t
  :demand t
  :vc (:url "https://github.com/minad/consult.git")
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("M-f" . consult-ripgrep)
         ("M-b" . consult-buffer)
         ("M-O" . consult-fd)
         :map isearch-mode-map
         ("M-h" . consult-isearch-history)         ;; orig. isearch-edit-string
         :map minibuffer-local-map
         ("M-h" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.2
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config
  ;; 设置 debounce 时间为 0.3 秒，适用于较快的输入
  (setq consult-async-input-debounce 0.1)
  ;; 设置 throttle 时间为 0.2 秒，保证输入处理不会过于频繁
  (setq consult-async-input-throttle 0.1)
  (setq consult-async-min-input 2)
  (setq consult-ripgrep-args "rg --null --line-buffered --color=never --max-columns=500 --path-separator /   --smart-case --no-heading --with-filename --line-number --search-zip --glob !**/*.xcworkspace --glob !**/*.xcodeproj --glob !Target Support Files/ --glob !site-lisp/")
  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  ;; (consult-customize
  ;;  consult-theme :preview-key '(:debounce 0.2 "M-.")
  ;;  consult-ripgrep consult-git-grep consult-grep
  ;;  consult-bookmark consult-recent-file consult-xref
  ;;  consult--source-bookmark consult--source-file-register
  ;;  consult--source-recent-file consult--source-project-recent-file
  ;;  ;; :preview-key "M-."
  ;;  :preview-key '(:debounce 0.2 "M-."))
  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 3. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  ;;;; 4. projectile.el (projectile-project-root)
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 5. No project support
  ;; (setq consult-project-function nil)

  (setq consult-buffer-filter
        '("\\` "
          ;; "\\`\\*"
          "\\`\\*Warnings"
          "\\`\\*copilot"
          "\\`\\*dashboard"
          "\\`\\*scratch"
          "\\`\\*lsp"
          "\\`\\magit"
          "\\`\\vterm"
          "\\`\\*Completions\\*\\'"
          "\\`\\*Flymake log\\*\\'"
          "\\`\\*Semantic SymRef\\*\\'"
          "\\`\\*tramp/.*\\*\\'"))


  (defvar consult--fd-command nil)

  (defun my-consult-fd-options (re buffer)
    "根据关联的文件名返回 fd 选项列表。"
    (let ((options (list consult--fd-command
                         "--color=never"
                         "--type" "f"
                         (consult--join-regexps re 'extended))))
      options))

  (defun consult--fd-builder (input buffer)
    (unless consult--fd-command
      (setq consult--fd-command
            (if (eq 0 (call-process-shell-command "fdfind"))
                "fdfind"
              "fd")))
    (pcase-let* ((`(,arg . ,opts) (consult--command-split input))
                 (`(,re . ,hl) (funcall consult--regexp-compiler
                                        arg 'extended t)))
      (when re
        (cons (append
               (my-consult-fd-options re buffer)
               opts)
              hl))))

  (defun consult-fd (&optional dir initial)
    (interactive "P")
    (let* ((prompt-dir (cdr (consult--directory-prompt "Fd" dir)))
           (default-directory (car (cdr prompt-dir)))
           (current-buffer (current-buffer)))
      (find-file (consult--find (car (car prompt-dir))
                                (lambda (input)
                                  (consult--fd-builder input current-buffer))
                                initial))))
  )

(use-package wgrep
  :bind
  (:map grep-mode-map
        ("C-c C-p" . wgrep-change-to-wgrep-mode)))

(use-package marginalia
  :ensure t
  :demand t
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
  :vc (:url "https://github.com/oantolin/embark.git")
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc. You may adjust the
  ;; Eldoc strategy, if you want to see the documentation from
  ;; multiple providers. Beware that using this can be a little
  ;; jarring since the message shown in the minibuffer can be more
  ;; than one line, causing the modeline to move up and down:

  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


(provide 'init-search)
