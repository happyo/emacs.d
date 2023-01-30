;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (use-package ample-theme
;;   :init (progn (load-theme 'ample t t)
;;                (load-theme 'ample-flat t t)
;;                (load-theme 'ample-light t t)
;;                (enable-theme 'ample-light))
;;   :defer t
;;   :ensure t)

;; (use-package dimmer
;;   :config
;;   (dimmer-configure-which-key)
;;   (dimmer-mode t)
;;   )

(add-to-list 'load-path "~/.emacs.d/site-lisp/ef-themes")
(require 'ef-themes)
(setq ef-themes-to-toggle '(ef-spring ef-autumn))

;; (setq ef-themes-headings ; read the manual's entry or the doc string
;;       '((0 . (variable-pitch light 1.9))
;;         (1 . (variable-pitch light 1.8))
;;         (2 . (variable-pitch regular 1.7))
;;         (3 . (variable-pitch regular 1.6))
;;         (4 . (variable-pitch regular 1.5))
;;         (5 . (variable-pitch 1.4)) ; absence of weight means `bold'
;;         (6 . (variable-pitch 1.3))
;;         (7 . (variable-pitch 1.2))
;;         (t . (variable-pitch 1.1))))

(setq ef-themes-mixed-fonts t
      ef-themes-variable-pitch-ui t)

;; Disable all other themes to avoid awkward blending:
(mapc #'disable-theme custom-enabled-themes)

;; Load the theme of choice:
(load-theme 'ef-spring :no-confirm)

;; The themes we provide:
;;
;; Light: `ef-day', `ef-light', `ef-spring', `ef-summer'.
;; Dark:  `ef-autumn', `ef-dark', `ef-night', `ef-winter'.
;;
;; Also those which are optimized for deuteranopia (red-green color
;; deficiency): `ef-deuteranopia-dark', `ef-deuteranopia-light'.

;; We also provide these commands, but do not assign them to any key:
;;
;; - `ef-themes-toggle'
;; - `ef-themes-select'
;; - `ef-themes-load-random'
;; - `ef-themes-preview-colors'
;; - `ef-themes-preview-colors-current'

(use-package all-the-icons
  :if (display-graphic-p))

(use-package rainbow-mode
  :init
  (defun sanityinc/enable-rainbow-mode-if-theme ()
    (when (and (buffer-file-name) (string-match-p "-theme\\.el" (buffer-file-name)))
      (rainbow-mode)))
  (add-hook 'emacs-lisp-mode-hook 'sanityinc/enable-rainbow-mode-if-theme)
  (add-hook 'help-mode-hook 'rainbow-mode)
)

;; (diminish 'rainbow-mode)))


(provide 'init-themes)
;;; init-themes.el end

