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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(apheleia catppuccin-theme cnfonts colorful-mode consult-notes
              copilot copilot-chat dape dashboard default-text-scale
              denote disable-mouse dogears embark-consult
              exec-path-from-shell f format-all fussy general
              go-translate gptel ibuffer-projectile imenu-list
              indent-guide kkp lin marginalia meow move-dup
              ns-auto-titlebar ob-swiftui objc-font-lock olivetti
              persistent-scratch plz rainbow-delimiters rainbow-mode
              slime smartparens smooth-scrolling speed-type
              symbol-overlay transpose-frame transwin
              treemacs-icons-dired treemacs-magit treemacs-nerd-icons
              treemacs-projectile unicode-escape vertico-posframe
              vterm-toggle vundo web-mode wgrep wrap-region yasnippet))
 '(package-vc-selected-packages
   '((dape :url "https://github.com/svaante/dape.git")
     (copilot :url "https://github.com/copilot-emacs/copilot.el.git")
     (yasnippet :url "https://github.com/joaotavora/yasnippet.git")
     (consult-notes :url
                    "https://github.com/mclear-tools/consult-notes.git")
     (denote :url "https://github.com/protesilaos/denote.git")
     (go-translate :url "https://github.com/lorniu/go-translate.git")
     (consult :url "https://github.com/minad/consult.git")
     (meow :url "https://github.com/meow-edit/meow.git"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nerd-icons-green ((((background dark)) :foreground "#FA7343") (((background light)) :foreground "#FA7343")))
 '(success ((t (:weight regular))))
 '(treemacs-nerd-icons-dir-face ((t (:foreground "#00B4D8"))))
 '(treemacs-nerd-icons-file-face ((t (:foreground "#00B4D8"))))
 '(treemacs-nerd-icons-root-face ((t (:foreground "#179299" :color "gtk_selection_bg_color" :weight bold :height 1.4))))
 '(treemacs-root-face ((t (:foreground "#ff79c6" :weight bold :height 1.4 :line-spacing 0.4))))
 '(warning ((t (:weight regular)))))
