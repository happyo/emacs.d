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

;; Version Control
(require 'init-magit)



;; (if (needRime)
;;     (require 'init-rime))
;; (require 'init-dired)
;; 感觉这个和lsp功能重复了
;; (require 'init-docs)
;; ;; eaf
;; (if (needEAF)
;;     (require 'init-eaf)
;;   )

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

;; Language mode
(require 'init-treesit)

;; Debug
(require 'init-debug)

;; Language
;; ;; (require 'init-citre)

;; (require 'init-haskell)
;; ;; (require 'init-web)
;; ;; (require 'init-scheme)
;; (require 'init-dart)
;; (if (needConda)
;;     (require 'init-python))
(require 'init-swift)

(require 'init-pomodoro)

(require 'init-macos)

(server-start)

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
