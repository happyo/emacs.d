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
  (setq-local truncate-lines nil)

  (modify-all-frames-parameters
   '((right-divider-width . 30)
     (internal-border-width . 30)))
  (dolist (face '(window-divider
                  window-divider-first-pixel
                  window-divider-last-pixel))
    (face-spec-reset-face face)
    (set-face-foreground face (face-attribute 'default :background)))
  (set-face-background 'fringe (face-attribute 'default :background))

  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 1
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "⭠ now ─────────────────────────────────────────────────")

  (global-org-modern-mode))

(use-package org
  :hook (org-mode . org-indent-mode)
  :init
  (setq org-agenda-span 'day)

;;   (setq org-directory "~/org")
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
;; (setq org-agenda-files (list org-directory))

;; (setq org-todo-keywords
;;       '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; (setq org-todo-keyword-faces
;;       '(("TODO" . org-warning)
;;         ("IN-PROGRESS" . "yellow")
;;         ("WAITING" . "purple")
;;         ("DONE" . "green")))

;; (setq org-capture-templates
;;       '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
;;          "* TODO %?\n%U\n%a\n")
;;         ("n" "Note" entry (file+headline org-default-notes-file "Notes")
;;          "* %?\n%U\n%a\n")))

;; (setq org-calc-default-modes (quote (calc-internal-prec 12 calc-float-format (float 2) calc-angle-mode deg calc-prefer-frac nil calc-symbolic-mode nil calc-date-format (YYYY "-" MM "-" DD " " Wwwday) calc-display-working-message t)))

;; (setq org-agenda-span 'week)
;; (setq org-agenda-start-on-weekday 1)
;; (setq org-agenda-window-setup 'current-window)

  )

;; (use-package xmind-org)

(use-package org-pomodoro)

(provide 'init-org)
;;; init-org.el ends here
