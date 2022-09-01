;;; init-org.el --- Org mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package org-modern
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-morden-agenda))
  :config
  ;; (modify-all-frames-parameters
  ;;  '((right-divider-width . 40)
  ;;    (internal-border-width . 40)))
  ;; (dolist (face '(window-divider
  ;;                 window-divider-first-pixel
  ;;                 window-divider-last-pixel))
  ;;   (face-spec-reset-face face)
  ;;   (set-face-foreground face (face-attribute 'default :background)))
  ;; (set-face-background 'fringe (face-attribute 'default :background))

  (setq
   ;; Edit settings
   org-use-sub-superscripts "{}"
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"

   ;; Agenda styling
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "⭠ now ─────────────────────────────────────────────────"))

(use-package org
  :init
  (setq org-agenda-span 'day)
  )

(provide 'init-org)
;;; init-org.el ends here
