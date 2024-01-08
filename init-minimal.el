;;; init-minimal.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.5)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Recover GC values after startup."
            (setq gc-cons-threshold 800000
                  gc-cons-percentage 0.1)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq byte-compile-warnings '(cl-functions))
(setq warning-minimum-level :error)

(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-benchmarking) ;; Measure startup time
(require 'init-func)
(require 'init-osx-keys)

(require 'init-meow)
(require 'init-editing-utils)
(require 'init-completion)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-search)
(require 'init-ibuffer)
(require 'init-flycheck)
(require 'init-windows)
(require 'init-lsp)
(require 'init-magit)
(require 'init-treemacs)
(require 'init-projectile)
(require 'init-keybinding)

;;; init-minimal.el ends here
