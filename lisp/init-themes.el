;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (require-package 'color-theme-sanityinc-solarized)
;; (require-package 'color-theme-sanityinc-tomorrow)
(use-package flucui-themes)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
(setq custom-safe-themes t)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(flucui-dark))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme t)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes)))
  (set-face-background 'line-number (face-attribute 'default :background))
  )

(add-hook 'after-init-hook 'reapply-themes)


;; ;; Toggle between light and dark

(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(flucui-light))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(flucui-dark))
  (reapply-themes))

;; (load-theme 'flucui-dark t)

(use-package dimmer
  :config
  (add-hook 'after-init-hook 'dimmer-mode)
  (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all)))
  (defun sanityinc/display-non-graphic-p ()
    (not (display-graphic-p)))
  (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p)
  )

(provide 'init-themes)
;;; init-themes.el ends here
