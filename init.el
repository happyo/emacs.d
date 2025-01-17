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
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-property-name-face ((((class color) (min-colors 256)) :inherit (modus-themes-reset-soft) :foreground "#da6d83")))
 '(font-lock-variable-use-face ((((class color) (min-colors 256)) :inherit (bold modus-themes-reset-soft) :foreground "#fef263")))
 '(meow-position-highlight-number-1 ((((class color) (min-colors 256)) :inherit (bold modus-themes-reset-soft) :background "#7feaff")))
 '(meow-position-highlight-number-2 ((((class color) (min-colors 256)) :inherit (bold modus-themes-reset-soft) :background "#ffaaff")))
 '(meow-position-highlight-number-3 ((((class color) (min-colors 256)) :inherit (bold modus-themes-reset-soft) :background "#dff000")))
 '(meow-region-cursor-1 ((((class color) (min-colors 256)) :inherit (bold modus-themes-reset-soft) :background "#7feaff")))
 '(meow-region-cursor-2 ((((class color) (min-colors 256)) :inherit (bold modus-themes-reset-soft) :background "#ffaaff")))
 '(meow-region-cursor-3 ((((class color) (min-colors 256)) :inherit (bold modus-themes-reset-soft) :background "#dff000")))
 '(nerd-icons-green ((((background dark)) :foreground "#FA7343") (((background light)) :foreground "#FA7343")))
 '(success ((t (:weight regular))))
 '(treemacs-directory-face ((t (:foreground "unspecified-fg" :inherit default))))
 '(treemacs-file-face ((t (:foreground "#999999" :height 0.8))))
 '(treemacs-nerd-icons-dir-face ((t (:foreground "#00B4D8"))))
 '(treemacs-nerd-icons-file-face ((t (:foreground "#00B4D8"))))
 '(treemacs-nerd-icons-root-face ((t (:foreground "#179299" :background "#EEEEEE" :color "gtk_selection_bg_color" :weight bold :height 1.4))))
 '(treemacs-root-face ((t (:foreground "#ff79c6" :background "#EEEEEE" :weight bold :height 1.4 :line-spacing 0.4))))
 '(treemacs-window-background-face ((t (:background "#EEEEEE"))))
 '(warning ((t (:weight regular)))))
