;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues

;;(setq debug-on-error t)

(setq gc-cons-threshold most-positive-fixnum)


;; Load path
(push (expand-file-name "site-lisp" user-emacs-directory) load-path)
(push (expand-file-name "lisp" user-emacs-directory) load-path)

(setq warning-minimum-level :error)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load custom-file 'noerror 'nomessage)

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

(setq-default bidi-display-reordering nil)
(setq bidi-inhibit-bpa t
      long-line-threshold 1000
      large-hscroll-threshold 1000
      syntax-wholeline-max 1000)


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
(require 'init-keybinding)
(require 'init-editing-utils)

(require 'init-windows)
(require 'init-treemacs)

(require 'init-lisp)

;; Version Control
(require 'init-magit)



;; (if (needRime)
;;     (require 'init-rime))
;; (require 'init-dired)

;; (require 'init-beframe)


(require 'init-themes)
(require 'init-gui-frames)
(require 'init-mode-line)
(require 'init-translate)
;; org
(require 'init-org)
(require 'init-denote)

(require 'init-sessions)
(require 'init-yasnippet)

;; After this need path
(require 'init-exec-path) ;; Set up $PATH

;; Coding

;; Code Completion
;; pip3 install epc orjson sexpdata six setuptools paramiko rapidfuzz, require markdown-mode, yasnippet
(require 'init-lsp)
;; Need copilot-install-server and copilot-login
(require 'init-copilot)
(require 'init-gpt)

;; Language mode
(require 'init-treesit)

;; Debug
(require 'init-debug)

;; Language
;; ;; (require 'init-citre)

;; (require 'init-haskell)
(require 'init-web)
;; ;; (require 'init-scheme)
;; (require 'init-dart)
;; (if (needConda)
;;     (require 'init-python))
(require 'init-swift)

(require 'init-pomodoro)

(require 'init-macos)

;;(require 'init-browser)
(require 'init-svg)


(server-start)

(provide 'init)
