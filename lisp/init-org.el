;;; init-org.el --- Org mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package org-roam
  :init
  (make-directory "~/Zettelkasten" :parents)
  :custom
  (org-roam-directory "~/Zettelkasten")
  (org-roam-capture-templates
   '(
     ("l" "LiteratureNotes" plain "\n* NOTES Status\n%?"
      :if-new (file+head "LiteratureNotes/%<%Y%m%d>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)
     ("r" "ReferenceNotes" plain "\n* NOTES Status\n%?"
      :if-new (file+head "ReferenceNotes/%<%Y%m%d>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)
     ("p" "PermanentNotes" plain "\n* NOTES Status\n%?"
      :if-new (file+head "PermanentNotes/%<%Y%m%d>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)
     ("f" "FleetingNotes" plain "\n* NOTES Status\n%?"
      :if-new (file+head "FleetingNotes/%<%Y%m%d>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)
      ))
  (org-todo-keywords '((sequence "NOTES(n)" "BOLD_P(b)" "HIGHLIGHT_P(h)" "MINI_SUM(m)" "REMIX(r)")
                       (sequence "TODO(t)" "DONE(d)")
                       ;; (sequence "FIXME(f)" "BUG(u)")
                       ))
  (org-todo-keyword-faces
        '(
          ("NOTES" . "#FA5055")
          ("BOLD_P" . "#FF6B47")
          ("HIGHLIGHT_P" . "#E2B17C")
          ("MINI_SUM" . "#468FE0")
          ("REMIX" . "#00CC7E")
          ("TODO" . "#FA5055")
          ("DONE" . "$00CC7E")
          ))
  :config
  (org-roam-db-autosync-mode)
  )


;; (use-package org-roam
;;   :ensure t
;;   :custom
;;   (org-roam-directory (file-truename "/Zettelkasten"))
;;   :bind (("C-c n l" . org-roam-buffer-toggle)
;;          ("C-c n f" . org-roam-node-find)
;;          ("C-c n g" . org-roam-graph)
;;          ("C-c n i" . org-roam-node-insert)
;;          ("C-c n c" . org-roam-capture)
;;          ;; Dailies
;;          ("C-c n j" . org-roam-dailies-capture-today))
;;   :config
;;   (org-roam-db-autosync-mode)
;;   ;; If using org-roam-protocol
;;   (require 'org-roam-protocol))

(require 'org-bars)
(add-hook 'org-mode-hook #'org-bars-mode)

(provide 'init-org)
;;; init-org.el ends here
