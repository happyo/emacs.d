;; init-org.el --- Org mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'chinese-color)

(add-hook 'org-mode-hook  (lambda ()
                            (setq prettify-symbols-alist
                                  '(("lambda" . ?λ)
                                    ;; (":PROPERTIES:" . ?)
                                    ;; (":ID:" . ?)
                                    ;; (":END:" . ?)
                                    ;; ("#+TITLE:" . ?)
                                    ;; ("#+AUTHOR:" . ?)
                                    ("#+BEGIN_QUOTE" . ?)
                                    ("#+END_QUOTE" . ?)
                                    ("#+RESULTS:" . ?)
                                    ("[ ]" . ?)
                                    ("[-]" . ?)
                                    ("[X]" . ?)
                                    ("*" . ?☰)
                                    ("**" . ?☱)
                                    ("***" . ?☲)
                                    ("****" . ?☳)
                                    ("*****" . ?☴)
                                    ("******" . ?☵)
                                    ("*******" . ?☶)
                                    ("********" . ?☷)
                                    ("TODO" . ?󰞇)
                                    ("DONE" . ?)
                                    ("STODO" . ?)
                                    ("ATODO" . ?)
                                    ("BTODO" . ?)
                                    ("CTODO" . ?)
                                    ("YDONE" . ?)
                                    ("XCANCEL" . ?󱎘)))
                            (prettify-symbols-mode)))

(defun my-org-mode-line-spacing ()
  (setq-local line-spacing 8))  ; 设置为3像素的间距

(defun fold-done-headings ()
  "Fold all headings marked as DONE."
  (org-show-all)  ;; First ensure everything is visible
  (org-cycle-hide-drawers 'all) ;; Hide all drawers
  (org-map-entries (lambda () 
                    (when (org-entry-is-done-p)
                      (hide-subtree)))
                   nil 'tree))

(add-hook 'org-mode-hook 'fold-done-headings)

(use-package org
  :ensure t
  :hook (
         (org-mode . org-indent-mode)
         (org-mode . my-org-mode-line-spacing)
         )
  :init
  (setq org-indent-mode-turns-on-hiding-stars nil)
  (setq org-agenda-span 'day)
  (setq org-agenda-files '("~/Zettelkasten/PersonalTasks/" "~/Zettelkasten/WorkTasks/" "~/Zettelkasten/TodoList/"))
  ;; (debug-on-variable-change 'org-agenda-files)
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
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)")
          (type "STODO(s)" "ATODO(a)" "BTODO(b)" "CTODO(c)" "|" "YDONE(y)" "XCANCEL(x)")))
  )

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
