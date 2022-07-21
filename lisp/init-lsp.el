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

(global-lsp-bridge-mode)

(use-package dumb-jump)

;; 融合 `lsp-bridge' `find-function' 以及 `dumb-jump' 的智能跳转
(defun lsp-bridge-jump ()
  (interactive)
  (cond
   ((eq major-mode 'emacs-lisp-mode)
    (let ((symb (function-called-at-point)))
      (when symb
        (find-function symb))))
   (lsp-bridge-mode
    (lsp-bridge-find-def))
   (t
    (require 'dumb-jump)
    (dumb-jump-go))))

(defun lsp-bridge-jump-back ()
  (interactive)
  (cond
   (lsp-bridge-mode
    (lsp-bridge-return-from-def))
   (t
    (require 'dumb-jump)
    (dumb-jump-back))))

(global-set-key (kbd "M-.") 'lsp-bridge-jump)
(global-set-key (kbd "M-,") 'lsp-bridge-jump-back)

(use-package unicode-escape)

(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge")
;; (require 'tabnine-capf)
;; (add-to-list 'completion-at-point-functions #'tabnine-completion-at-point)


;; (defun lsp-bridge-mix-multi-backends ()
;;   (setq-local completion-category-defaults nil)
;;   (setq-local completion-at-point-functions
;;               (list
;;                (cape-capf-buster
;;                 (cape-super-capf
;;                  ;; #'lsp-bridge-capf

;;                  ;; 我嫌弃TabNine太占用我的CPU了， 需要的同学注释下面这一行就好了
;;                  #'tabnine-completion-at-point

;;                  #'cape-file
;;                  #'cape-dabbrev
;;                  )
;;                 'equal)
;;                )))

;; (dolist (hook lsp-bridge-default-mode-hooks)
;;   (add-hook hook (lambda ()
;;                    (lsp-bridge-mix-multi-backends) ; 通过Cape融合多个补全后端
;;                    )))

(provide 'init-lsp)
;;; init-lsp.el ends here
