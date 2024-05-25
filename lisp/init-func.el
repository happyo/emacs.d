;;; init-func.el --- Common functions -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))
(defconst *is-a-win32p* (eq system-type 'windows-nt))

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

(provide 'init-func)
;;; init-func.el ends here
