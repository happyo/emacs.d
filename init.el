;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues

;;(setq debug-on-error t)

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.5)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Recover GC values after startup."
            (setq gc-cons-threshold 800000
                  gc-cons-percentage 0.1)))

;; (setq package-gnupghome-dir "~/.emace.d/elpa/gnupg")


;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
;; (defun update-load-path (&rest _)
;;   "Update `load-path'."
;;   (dolist (dir '("site-lisp" "lisp"))
;;     (push (expand-file-name dir user-emacs-directory) load-path)))

;; (defun add-subdirs-to-load-path (&rest _)
;;    "Add subdirectories to `load-path'."
;;    (let ((default-directory (expand-file-name "site-lisp" user-emacs-directory)))
;;      (normal-top-level-add-subdirs-to-load-path)))

;; (advice-add #'package-initialize :after #'update-load-path)
;; (advice-add #'package-initialize :after #'add-subdirs-to-load-path)

;; (update-load-path)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Adjust garbage collection thresholds during startup, and thereafter

;; (let ((normal-gc-cons-threshold (* 20 1024 1024))
;;       (init-gc-cons-threshold (* 128 1024 1024)))
;;   (setq gc-cons-threshold init-gc-cons-threshold)
;;   (add-hook 'emacs-startup-hook
;;             (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;; Bootstrap config

;; ignore cl warning
(setq byte-compile-warnings '(cl-functions))
(setq warning-minimum-level :error)


;; Adjust garbage collection thresholds during startup, and thereafter

(setq custom-file (locate-user-emacs-file "custom.el"))
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-benchmarking) ;; Measure startup time
(require 'init-func)
(require 'init-exec-path) ;; Set up $PATH
(require 'init-proxy)

(let ((my/old package-check-signature))
  (use-package gnu-elpa-keyring-update
    :ensure t
    :init   (setq package-check-signature nil)
    :config (setq package-check-signature my/old)))

(use-package scratch)
(use-package command-log-mode)

(if (needRime)
    (require 'init-rime))

(require 'init-meow)
(require 'init-editing-utils)
(require 'init-completion)

(if (needFonts)
    (require 'init-chinese)
    )

(require 'init-themes)
(require 'init-xterm)
(require 'init-keyfreq)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-search)
(require 'init-ibuffer)
;; 感觉这个和lsp功能重复了
;; (require 'init-flycheck)

(require 'init-windows)

(require 'init-treemacs)
(require 'init-projectile)
(require 'init-docs)

(require 'init-translate)

;; Code Completion
(require 'init-lsp)
(require 'init-copilot)
(require 'init-debug)

;; Language
;; (require 'init-citre)
(require 'init-magit)
(require 'init-yasnippet)
(require 'init-lisp)
(require 'init-haskell)
;; (require 'init-web)
;; (require 'init-scheme)
(require 'init-dart)
(if (needConda)
    (require 'init-python))
(require 'init-swift)


;; org
(require 'init-org)
(require 'init-denote)
(require 'init-mode-line)

;; eaf
(if (needEAF)
    (require 'init-eaf)
  )

(require 'init-keybinding)
;; (require 'init-beframe)
(require 'init-sessions)

;; Start emacsclient server
(server-start)

(when (file-exists-p custom-file)
  (load custom-file))
(put 'erase-buffer 'disabled nil)
