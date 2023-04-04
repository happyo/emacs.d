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

(message system-name)

(setq mac "xxzdeMacBook-Pro.local")
(setq archWsl "happy-pc")

(defun pythonPath()
  (cond
   ((string-match-p system-name mac) "/opt/homebrew/bin/python3")
   ((string-match-p system-name archWsl) "/home/linuxbrew/.linuxbrew/bin/python3")
   (t "python3")
   )
  )

(defun proxy-ip()
  (cond
   ((string-match-p system-name mac) "127.0.0.1:7890")
   ((string-match-p system-name archWsl) "172.25.112.1:7890")
   (t "127.0.0.1:7890")
   )
  )

(defun needEAF()
  (cond
   ;; ((string-match-p system-name mac) t)
        ((string-match-p system-name archWsl) t)
        (t nil))
  )

(defun needEAFWeb()
  (cond
        ((string-match-p system-name archWsl) t)
        (t nil))
  )

(defun needEAFTerminal()
  (cond
        ((string-match-p system-name archWsl) t)
        (t nil))
  )

(defun needConda()
  (cond ((string-match-p system-name mac) nil)
        ((string-match-p system-name archWsl) nil)
        (t nil)))

(defun needFonts()
  (cond ((string-match-p system-name mac) t)
        ((string-match-p system-name archWsl) t)
        (t nil)))

(defun needRime()
  (cond ((string-match-p system-name mac) nil)
        ((string-match-p system-name archWsl) t)
        (t nil)))

(provide 'init-func)
;;; init-func.el ends here
