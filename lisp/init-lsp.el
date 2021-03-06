;;; init-lsp.el --- lsp support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package yasnippet)
(use-package yasnippet-snippets)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package posframe)
;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   (setq lsp-headerline-breadcrumb-enable nil)
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (lisp-mode . lsp-deferred)
;;          (dart-mode . lsp-deferred)
;;          (haskell-mode . lsp-deferred)
;;          (python-mode . lsp-deferred)
;;          ;;  ;; if you want which-key integration
;;          ;;  (lsp-mode . lsp-enable-which-key-integration)
;;          )
;;   :commands (lsp lsp-deferred)
;;   )

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
;; (use-package which-key
;;     :config
;;     (which-key-mode))

(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge")

(yas-global-mode 1)

(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)

(setq lsp-bridge-python-command (if (string-match-p user-login-name "happyo")
                                    "/opt/miniconda3/bin/python"
                                    "/Users/belyenochi/opt/anaconda3/bin/python"))
(setq acm-snippet-insert-index 0)
(setq lsp-bridge-enable-log t)

(global-lsp-bridge-mode)

(use-package dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)

;; ?????? `lsp-bridge' `find-function' ?????? `dumb-jump' ???????????????
(defun lsp-bridge-jump ()
  (interactive)
  (cond
   ((eq major-mode 'emacs-lisp-mode)
    (let ((symb (function-called-at-point)))
      (when symb
        (xref-find-definitions symb))))
   (lsp-bridge-mode
    (lsp-bridge-find-def))
   (t
    (dumb-jump-go))))

(defun lsp-bridge-jump-back ()
  (interactive)
  (cond
   ((eq major-mode 'emacs-lisp-mode)
    (xref-pop-marker-stack))
   (lsp-bridge-mode
    (lsp-bridge-find-def))
   (lsp-bridge-mode
    (lsp-bridge-return-from-def))
   (t
    (xref-pop-marker-stack)
    )
   ))

;; (global-set-key (kbd "M-.") 'lsp-bridge-jump)
;; (global-set-key (kbd "M-,") 'lsp-bridge-jump-back)
(global-set-key (kbd "M-.") 'xref-find-definitions)
(global-set-key (kbd "M-,") 'xref-pop-marker-stack)

(use-package unicode-escape)

(add-to-list 'load-path "~/.emacs.d/site-lisp/tabnine-capf")
(require 'tabnine-capf)
(add-to-list 'completion-at-point-functions #'tabnine-completion-at-point)

;; (defun lsp-bridge-mix-multi-backends ()
;;   (setq-local completion-category-defaults nil)
;;   (setq-local completion-at-point-functions
;;               (list
;;                (cape-capf-buster
;;                 (cape-super-capf
;;                  ;; #'lsp-bridge-capf

;;                  ;; ?????????TabNine???????????????CPU?????? ?????????????????????????????????????????????
;;                  #'tabnine-completion-at-point

;;                  #'cape-file
;;                  #'cape-dabbrev
;;                  )
;;                 'equal)
;;                )))

;; (dolist (hook lsp-bridge-default-mode-hooks)
;;   (add-hook hook (lambda ()
;;                    (lsp-bridge-mix-multi-backends) ; ??????Cape????????????????????????
;;                    )))

(provide 'init-lsp)
;;; init-lsp.el ends here
