;;; init-org.el --- Org mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (use-package org-modern
;;   :hook ((org-mode . org-modern-mode)
;;          ;; (org-agenda-finalize . org-morden-agenda)
;;          )
;;   :config
;;   (setq org-modern-timestamp nil)
;;   (setq-local truncate-lines nil)

;;   ;; (dolist (face '(window-divider
;;   ;;                 window-divider-first-pixel
;;   ;;                 window-divider-last-pixel))
;;   ;;   (face-spec-reset-face face)
;;   ;;   (set-face-foreground face (face-attribute 'default :background)))
;;   ;; (set-face-background 'fringe (face-attribute 'default :background))

;;   (setq
;;    ;; Edit settings
;;    org-auto-align-tags nil
;;    org-tags-column 1
;;    org-catch-invisible-edits 'show-and-error
;;    org-special-ctrl-a/e t
;;    org-insert-heading-respect-content t

;;    ;; Org styling, hide markup etc.
;;    org-hide-emphasis-markers t
;;    org-pretty-entities t
;;    org-ellipsis "…"

;;    ;; Agenda styling
;;    ;; org-agenda-tags-column 0
;;    ;; org-agenda-block-separator ?─
;;    ;; org-agenda-time-grid
;;    ;; '((daily today require-timed)
;;    ;;   (2300 100 300 500 700 900 1100 1300 1500 1700 1900 2100)
;;    ;;   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
;;    ;; org-agenda-current-time-string
;;    ;; "⭠ now ─────────────────────────────────────────────────")
;;    )

;;   (global-org-modern-mode))

(use-package org
  :hook (org-mode . org-indent-mode)
  :init
  (setq org-agenda-span 'day)
  (setq org-agenda-files '("~/Zettelkasten/"))
  (setq org-agenda-include-diary t)
  (setq diary-file "~/Zettelkasten/standard-diary")
  (setq org-agenda-include-diary "~/Zettelkasten/standard-diary")
  (setq org-agenda-time-grid (quote ((daily today require-timed)
                                   (2300
                                    100
                                    300
                                    500
                                    700
                                    900
                                    1100
                                    1300
                                    1500
                                    1700
                                    1900
                                    2100
                                    )
                                   "......"
                                   "-----------------------------------------------------"
                                   )))
  ;; location
(setq calendar-longitude 116.9962)
(setq calendar-latitude 39.91) 
  

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

(defun diary-shichen ()
  "A diary sexp entry that returns all the Chinese shichen for today."
  (let* ((shichen-names '("丑时" "寅时" "卯时" "辰时" "巳时" "午时" "未时" "申时" "酉时" "戌时" "亥时" "子时"))
         (now (current-time))
         (decoded-time (decode-time now))
         (year (nth 5 decoded-time))
         (month (nth 4 decoded-time))
         (day (nth 3 decoded-time))
         (shichen-events '()))
    (dotimes (i 12)
      (let* ((hour (mod (+ (* i 2) 1) 24)) ; 丑时从1:00开始
             (event-time (encode-time 0 0 hour day month year))
             (shichen-name (nth i shichen-names)))
        (push (format "%s: %s"
                      (format-time-string "%Y-%m-%d %H:%M" event-time)
                      shichen-name)
              shichen-events)))
    (mapconcat 'identity (nreverse shichen-events) "\n")))

(provide 'init-org)
;;; init-org.el ends here
