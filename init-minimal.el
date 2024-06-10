;;; init-minimal.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Load path
(push (expand-file-name "site-lisp" user-emacs-directory) load-path)
(push (expand-file-name "lisp" user-emacs-directory) load-path)

;; Packages
;; Without this comment Emacs25 adds (package-initialize) here
;; Explicitly set the prefered coding systems to avoid annoying prompt
;; from emacs (especially on Microsoft Windows)
(require 'init-elpa)
(prefer-coding-system 'utf-8)

(setq auto-save-default nil)               ; Disable auto save
(setq-default c-basic-offset   4
              tab-width        4
              indent-tabs-mode nil)

(require 'init-func)
(require 'init-chinese)
(require 'init-osx-keys)
(require 'init-proxy)
    
;; Key Modifiers
(require 'init-meow)

(require 'init-projectile)

;; Need brew install cmake, brew install libtool
(require 'init-xterm)

(require 'init-search)
(require 'init-editing-utils)

(require 'init-windows)
(require 'init-treemacs)

(require 'init-lisp)
(require 'init-keybinding)

(require 'init-macos)

(server-start)

;;; init-minimal.el ends here
