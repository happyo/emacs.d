;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues

;;(setq debug-on-error t)

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


(server-start)

;; (require 'init-exec-path) ;; Set up $PATH
;; (if (needRime)
;;     (require 'init-rime))
;; (require 'init-completion)
;; (require 'init-keyfreq)
;; (require 'init-dired)
;; (require 'init-ibuffer)
;; 感觉这个和lsp功能重复了
;; (require 'init-flycheck)
;; (require 'init-docs)
;; (require 'init-mode-line)

(require 'init-themes)
(require 'init-gui-frames)
(require 'init-translate)
;; org
(require 'init-org)
(require 'init-denote)

(require 'init-sessions)

;; ;; Code Completion
;; (require 'init-lsp)
;; (require 'init-copilot)
;; (require 'init-debug)

;; ;; Language
;; ;; (require 'init-citre)
;; (require 'init-magit)
;; (require 'init-yasnippet)
;; (require 'init-lisp)
;; (require 'init-haskell)
;; ;; (require 'init-web)
;; ;; (require 'init-scheme)
;; (require 'init-dart)
;; (if (needConda)
;;     (require 'init-python))
;; (require 'init-swift)



;; ;; eaf
;; (if (needEAF)
;;     (require 'init-eaf)
;;   )

;; ;; (require 'init-beframe)
;
;; ;; Start emacsclient server
;; (server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
