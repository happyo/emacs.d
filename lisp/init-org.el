;; init-org.el --- Org mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'chinese-color)

(defun my-org-setup ()
  "Setup for Org mode."

  ;; Prettify symbols
  (let ((org-prettify-symbols-alist
         '(("lambda" . ?λ)
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
           ("-" . ?󰧞)
           ("+" . ?󰧞)
           ("TODO" . ?󰞇)
           ("DONE" . ?󰒘)
           ("STODO" . ?)
           ("ATODO" . ?)
           ("BTODO" . ?)
           ("CTODO" . ?)
           ("YDONE" . ?)
           ("XCANCEL" . ?󱎘))))
    (setq-local prettify-symbols-alist org-prettify-symbols-alist))

  (prettify-symbols-mode 1)

  ;; Line spacing
  (setq-local line-spacing 8)
  )

(use-package org
  :ensure t
  :hook ((org-mode . my-org-setup)
         (org-mode . org-indent-mode))
  :init
  (setq org-indent-mode-turns-on-hiding-stars nil)
  (setq org-agenda-span 'day)
  (setq org-agenda-files '("~/Zettelkasten/PersonalTasks/" "~/Zettelkasten/WorkTasks/" "~/Zettelkasten/TodoList/"))
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

  ;; (setq org-todo-keyword-faces
  ;;     `(("TODO" . ,tcc-063-zhushi)
  ;;       ("DONE" . ,tcc-317-hehui)
  ;;       ("STODO" . ,tcc-076-danfeng)
  ;;       ("ATODO" . ,tcc-095-qingzi)
  ;;       ("BTODO" . ,tcc-192-hupo)
  ;;       ("CTODO" . ,tcc-116-fenqing)
  ;;       ("YDONE" . ,tcc-317-hehui)
  ;;       ("XCANCEL" . ,tcc-317-hehui)))

  (org-babel-do-load-languages
 'org-babel-load-languages
 '((swift . t)       ; 已存在的 Swift 支持
   (C . t);; 其他需要支持的语言
    ))
  
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

(defun my-org-mode-setup ()
  (setq truncate-lines nil))

(add-hook 'org-mode-hook 'my-org-mode-setup)

(provide 'init-org)
;;; init-org.el ends here
