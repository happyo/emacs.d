;;; init-org.el --- Org mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (use-package org-roam
;;   :init
;;   (make-directory "~/Zettelkasten" :parents)
;;   :custom
;;   (org-roam-directory "~/Zettelkasten")
;;   (org-roam-capture-templates
;;    '(
;;      ("l" "LiteratureNotes" plain "\n* NOTES Status\n%?"
;;       :if-new (file+head "LiteratureNotes/%<%Y%m%d>-${slug}.org"
;;                          "#+title: ${title}\n")
;;       :unnarrowed t)
;;      ("r" "ReferenceNotes" plain "\n* NOTES Status\n%?"
;;       :if-new (file+head "ReferenceNotes/%<%Y%m%d>-${slug}.org"
;;                          "#+title: ${title}\n")
;;       :unnarrowed t)
;;      ("p" "PermanentNotes" plain "\n* NOTES Status\n%?"
;;       :if-new (file+head "PermanentNotes/%<%Y%m%d>-${slug}.org"
;;                          "#+title: ${title}\n")
;;       :unnarrowed t)
;;      ("f" "FleetingNotes" plain "\n* NOTES Status\n%?"
;;       :if-new (file+head "FleetingNotes/%<%Y%m%d>-${slug}.org"
;;                          "#+title: ${title}\n")
;;       :unnarrowed t)
;;      ("t" "Tasks" plain "\n* Tasks \n%?"
;;       :if-new (file+head "PersonalTasks/${slug}.org"
;;                          "#+title: ${title}\n")
;;       :unnarrowed t)
;;      ("w" "Work" plain "\n* Tasks \n%?"
;;       :if-new (file+head "WorkTasks/${slug}.org"
;;                          "#+title: ${title}\n")
;;       :unnarrowed t)
;;      ))
;;   (org-todo-keywords '((sequence "NOTES(n)" "BOLD_P(b)" "HIGHLIGHT_P(h)" "MINI_SUM(m)" "REMIX(r)")
;;                        (sequence "TODO(t!)" "DONE(d!)")
;;                        ;; (sequence "FIXME(f)" "BUG(u)")
;;                        ))
;;   (org-todo-keyword-faces
;;    '(
;;      ("NOTES" . "#FA5055")
;;      ("BOLD_P" . "#FF6B47")
;;      ("HIGHLIGHT_P" . "#E2B17C")
;;      ("MINI_SUM" . "#468FE0")
;;      ("REMIX" . "#00CC7E")
;;      ("TODO" . "#FA5055")
;;      ("DONE" . "$00CC7E")
;;      ))
;;   :bind (("C-c n l" . org-roam-buffer-toggle)
;;          ("C-c n f" . org-roam-node-find)
;;          ("C-c n g" . org-roam-graph)
;;          ("C-c n i" . org-roam-node-insert)
;;          ("C-c n c" . org-roam-capture)
;;          ("C-c n a" . org-agenda)
;;          ;; Dailies
;;          ("C-c n j" . org-roam-dailies-capture-today)
;;          )
;;   :config
;;   (org-roam-db-autosync-mode)
;;   )

;; (require 'org-bars)
;; (add-hook 'org-mode-hook #'org-bars-mode)
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
