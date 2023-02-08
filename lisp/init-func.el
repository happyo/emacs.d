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
(defun pythonPath()
  (cond ((string-match-p system-name "xxzdeMBP") "/usr/bin/python3")
        ;; ((string-match-p ))
        )
  )

(provide 'init-func)
;;; init-func.el ends here
