;;; init-mode-line.el --- Intergration doom model line -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-themes)

(use-package diminish
  :ensure t)

(require 'doom-modeline)
(setq doom-modeline-icon nil)

(doom-modeline-def-modeline 'my-simple-line
  '(buffer-info buffer-position)
  '(misc-info buffer-encoding major-mode))

;; Set default mode-line
(add-hook 'doom-modeline-mode-hook
          (lambda ()
            (doom-modeline-set-modeline 'my-simple-line 'default)))
;; Or disable other mode-lines
;;(setq 'doom-modeline-mode-alist nil)

(doom-modeline-mode 1)
;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode)
;;   :config
;;   ;; Define your custom doom-modeline
;; Configure other mode-lines based on major modes
;; (add-to-list 'doom-modeline-mode-alist '(my-mode . my-simple-line))

;; Or disable other mode-lines
;;  (setq 'doom-modeline-mode-alist nil)

;; )
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/awesome-tray")

;; (require 'awesome-tray)

;; (setq awesome-tray-mode-line-inactive-color tcc-285-xueya)
;; (setq awesome-tray-mode-line-active-color tcc-010-handan)
;; (setq awesome-tray-meow-show-mode t)
;; (setq awesome-tray-mode-line-height 0.1)
;; (awesome-tray-mode 1)

;; (use-package awesome-tray
;;   :demand t
;;   :ensure nil
;;   :load-path "~/.emacs.d/site-lisp/awesome-tray"
;;   (awesome-tray-mode 1))

(provide 'init-mode-line)
;;; init-mode-line.el ends here
