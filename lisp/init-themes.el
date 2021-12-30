;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package flucui-themes
  :config
  (flucui-themes-load-style 'dark)
  )

(use-package lab-themes
  )

;; (use-package modus-themes
;;   :init
;;   ;; Add all your customizations prior to loading the themes
;;   (setq modus-themes-italic-constructs t
;;         modus-themes-bold-constructs nil
;;         modus-themes-region '(bg-only no-extend))

;;   ;; Load the theme files before enabling a theme (else you get an error).
;;   (modus-themes-load-themes)
;;   ;;:config
;;   ;; Load the theme of your choice:
;;   ;; (modus-themes-load-operandi) ;; OR
;;   ;; (modus-themes-load-vivendi)
;;   ;;(my-modus-themes-saturate 20)
;;   :bind ("<f5>" . modus-themes-toggle))

;; (defun my-modus-themes-saturate (percent)
;;   "Saturate current Modus theme palette overrides by PERCENT."
;;   (interactive
;;    (list (read-number "Saturation by percent: ")))
;;   (let* ((theme (modus-themes--current-theme))
;;          (palette (pcase theme
;;                     ('modus-operandi modus-themes-operandi-colors)
;;                     ('modus-vivendi modus-themes-vivendi-colors)
;;                     (_ (error "No Modus theme is active"))))
;;          (overrides (pcase theme
;;                       ('modus-operandi 'modus-themes-operandi-color-overrides)
;;                       ('modus-vivendi 'modus-themes-vivendi-color-overrides)
;;                       (_ (error "No Modus theme is active")))))
;;     (let (name cons colors)
;;       (dolist (cons palette)
;;         (setq name (color-saturate-name (cdr cons) percent))
;;         (setq name (format "%s" name))
;;         (setq cons `(,(car cons) . ,name))
;;         (push cons colors))
;;       (set overrides colors))
;;     (pcase theme
;;       ('modus-operandi (modus-themes-load-operandi))
;;       ('modus-vivendi (modus-themes-load-vivendi)))))


(add-hook 'after-init-hook (lambda () (lab-themes-load-style 'dark)
                                       )
                            )


;; sample Elisp calls (or call `my-modus-themes-saturate' interactively)
;; (my-modus-themes-saturate -75)

;; (require-package 'color-theme-sanityinc-solarized)
;; (require-package 'color-theme-sanityinc-tomorrow)
;; (use-package flucui-themes
  ;; :ensure t
  ;; :config
  ;; (load-theme 'flucui-dark t)
  ;; )
;; (use-package color-theme-sanityinc-solarized)
;; (use-package color-theme-sanityinc-tomorrow)
;; (use-package dracula-theme)
;; (use-package zenburn-theme)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
;; (setq custom-safe-themes t)

;; ;; ;; If you don't customize it, this is the theme you get.
;; (setq-default custom-enabled-themes '(modus-themes-load-vivendi))

;; Or if you have use-package installed
;; (use-package kaolin-themes
  ;; :ensure t
  ;; :config
  ;; (load-theme 'kaolin-dark t)
  ;; (kaolin-treemacs-theme)
  ;; )

;; Ensure that themes will be applied even if they have not been customized
;; (defun reapply-themes ()
;;   "Forcibly load the themes listed in `custom-enabled-themes'."
;;   (dolist (theme custom-enabled-themes)
;;     (unless (custom-theme-p theme)
;;       (load-theme theme t)))
;;   (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes)))
;;   (set-face-background 'line-number (face-attribute 'default :background))
;;   )

;; (add-hook 'after-init-hook 'reapply-themes)


;; ;; Toggle between light and dark

;; (defun light ()
;;   "Activate a light color theme."
;;   (interactive)
;;   (setq custom-enabled-themes '(flucui-light))
;;   ;; (setq custom-enabled-themes '(flucui-light))
;;   (reapply-themes))

;; (defun dark ()
;;   "Activate a dark color theme."
;;   (interactive)
;;   ;; (setq custom-enabled-themes '(sanityinc-solarized-dark))
;;   (setq custom-enabled-themes '(kaolin-dark))
;;   (reapply-themes))


;; (use-package dimmer
;;   :config
;;   (add-hook 'after-init-hook 'dimmer-mode)
;;   (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all)))
;;   (defun sanityinc/display-non-graphic-p ()
;;     (not (display-graphic-p)))
;;   (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p)
;;   )

(use-package all-the-icons
  :if (display-graphic-p))

(provide 'init-themes)
;;; init-themes.el ends here
