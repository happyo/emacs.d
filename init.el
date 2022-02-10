;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
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

;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("site-lisp" "lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(defun add-subdirs-to-load-path (&rest _)
  "Add subdirectories to `load-path'."
  (let ((default-directory (expand-file-name "site-lisp" user-emacs-directory)))
    (normal-top-level-add-subdirs-to-load-path)))

(advice-add #'package-initialize :after #'update-load-path)
(advice-add #'package-initialize :after #'add-subdirs-to-load-path)

(update-load-path)

(require 'init-benchmarking) ;; Measure startup time

;; ignore cl warning
(setq byte-compile-warnings '(cl-functions))


;; Adjust garbage collection thresholds during startup, and thereafter

;; (let ((normal-gc-cons-threshold (* 20 1024 1024))
;;       (init-gc-cons-threshold (* 128 1024 1024)))
;;   (setq gc-cons-threshold init-gc-cons-threshold)
;;   (add-hook 'emacs-startup-hook
;;             (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; Bootstrap config

(setq custom-file (locate-user-emacs-file "custom.el"))
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-func)
(require 'init-exec-path) ;; Set up $PATH


(use-package diminish)
(use-package scratch)
(use-package command-log-mode)

(require 'init-rime)

(require 'init-persp)

(require 'init-meow)
(require 'init-editing-utils)
;; (require 'init-smex)
(require 'init-chinese)
(require 'init-themes)
(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-keyfreq)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-windows)
(require 'init-mmm)

(require 'init-treemacs)
(require 'init-projectile)
(require 'init-folding)
(require 'init-dash)

;; Language
(require 'init-yasnippet)
(require 'init-lsp)
(require 'init-lisp)
;; (require 'init-haskell)
;; (require 'init-scheme)
(require 'init-dart)
(require 'init-python)

(require 'init-company)

;; org
(require 'init-org)

;; eaf
(if (not *is-a-mac*)
    (require 'init-eaf)
    )

(when (file-exists-p custom-file)
  (load custom-file))
