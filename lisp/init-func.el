;;; init-func.el --- Common functions -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))
(defconst *is-a-win32p* (eq system-type 'windows-nt))

;; (defun pythonPath ()
;;   "Different computer python path"
;;   (if *is-a-mac*
;;       (if (string-match-p user-login-name "happyo")
;;                                     "/opt/miniconda3/bin/python"
;;                                   "/Users/belyenochi/opt/anaconda3/bin/python")
;;     "/home/happyo/miniconda3/bin/python"))

(setq mac "belyenochi")
(setq archWsl "happy-pc")

(defun isNewMac ()
    (string-match-p user-login-name mac))

(defun isMyWsl ()
    (string-match-p system-name archWsl))

(defun pythonPath()
  (cond
   ((isNewMac) "/opt/homebrew/bin/python3")
   ((isMyWsl) "/home/linuxbrew/.linuxbrew/bin/python3")
   (t "python3")
   )
  )

(defun proxy-ip()
  (cond
   ((isNewMac) "127.0.0.1:7890")
   ((isMyWsl) "172.25.112.1:7890")
   (t "127.0.0.1:7890")
   )
  )

(defun needEAF()
  (cond
   ;; ((string-match-p system-name mac) t)
        ((isMyWsl) t)
        (t nil))
  )

(defun needEAFWeb()
  (cond
        ((isMyWsl) t)
        (t nil))
  )

(defun needEAFTerminal()
  (cond
        ((isMyWsl) t)
        (t nil))
  )

(defun needConda()
  (cond ((isNewMac) nil)
        ((isMyWsl) nil)
        (t nil)))

(defun needFonts()
  (cond ((isNewMac) t)
        ((isMyWsl) t)
        (t nil)))

(defun needRime()
  (cond ((isNewMac) nil)
        ((isMyWsl) t)
        (t nil)))


(defun transform-content (content)
  "Transform content based on given rules."
  (let ((lines (split-string content "\n"))
        (result ""))
    (dolist (line lines)
      (let* ((level (length (car (s-match "^\\*+" line))))
             (indentation (make-string (max (1- level) 0) ?\t))
             (clean-line (replace-regexp-in-string "^\\*+ " "" line)))
        (setq result (concat result indentation clean-line "\n"))))
    result))

(defun transform-selected-content-to-clipboard ()
  "Transform selected content according to the specified rules and add it to the clipboard."
  (interactive)
  (let* ((start (region-beginning))
         (end (region-end))
         (content (buffer-substring-no-properties start end))
         (transformed-content (transform-content content)))
    (kill-new transformed-content)
    (message "Transformed content added to clipboard.")))

(defun reverse-transform-content (content)
  "Reverse transform content from indented format to original format."
  (let ((lines (split-string content "\n"))
        (result ""))
    (dolist (line lines)
      (let* ((indentation (length (car (s-match "^\\(\t\\)+" line))))
             (stars (make-string (1+ indentation) ?*))
             (clean-line (replace-regexp-in-string "^\t+" "" line)))
        (setq result (concat result stars " " clean-line "\n"))))
    result))

(defun reverse-transform-selected-content ()
  "Reverse transform selected content to original format and replace the selection."
  (interactive)
  (let* ((start (region-beginning))
         (end (region-end))
         (content (buffer-substring-no-properties start end))
         (reversed-content (reverse-transform-content content)))
    (delete-region start end)
    (insert reversed-content)))

(provide 'init-func)
;;; init-func.el ends here
