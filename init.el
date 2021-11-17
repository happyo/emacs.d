(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds during startup, and thereafter

;; (let ((normal-gc-cons-threshold (* 20 1024 1024))
;;       (init-gc-cons-threshold (* 128 1024 1024)))
;;   (setq gc-cons-threshold init-gc-cons-threshold)
;;   (add-hook 'emacs-startup-hook
;;             (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; Bootstrap config

;; (desktop-save-mode 1)

(setq custom-file (locate-user-emacs-file "custom.el"))
;; (require 'init-utils)
;; (require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH


(require-package 'diminish)
(maybe-require-package 'scratch)
(require-package 'command-log-mode)

(require 'init-desktop)

(require 'init-meow)
(require 'init-editing-utils)
;; (require 'init-smex)

(require 'init-chinese)
(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-keyfreq)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-minibuffer)
(require 'init-hippie-expand)
(require 'init-company)
(require 'init-windows)
(require 'init-mmm)

(require 'init-treemacs)
(require 'init-projectile)
(require 'init-folding)
(require 'init-dash)

(require 'init-lsp)
(require 'init-lisp)
(require 'init-haskell)
(require 'init-scheme)
(require 'init-dart)



(when (file-exists-p custom-file)
  (load custom-file))
