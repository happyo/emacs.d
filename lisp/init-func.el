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

(defgroup switch-input nil
  "Input method switching utilities for macOS."
  :group 'i18n
  :prefix "switch-input-")

(defcustom switch-input-path (expand-file-name "~/.emacs.d/switch-input/SwitchInput")
  "Path to the compiled SwitchInput program.
This program is used for switching between input methods on macOS."
  :type 'string
  :group 'switch-input)

(defcustom switch-input-source-path (concat switch-input-path ".swift")
  "Path to the SwitchInput Swift source file."
  :type 'string
  :group 'switch-input)

(defcustom switch-input-english-index 0
  "Index of the English input method."
  :type 'integer
  :group 'switch-input)

(defcustom switch-input-chinese-index 1
  "Index of the Chinese input method."
  :type 'integer
  :group 'switch-input)

(defun switch-input-compile ()
  "Compile the SwitchInput Swift program."
  (interactive)
  (let ((default-directory (file-name-directory switch-input-path)))
    (message "Compiling SwitchInput...")
    (if (executable-find "swiftc")
        (let ((result (call-process "swiftc" nil "*SwitchInput Compilation*" nil 
                                    "-o" switch-input-path switch-input-source-path)))
          (if (eq result 0)
              (progn 
                (message "SwitchInput compiled successfully")
                (chmod switch-input-path #o755)
                t)
            (pop-to-buffer "*SwitchInput Compilation*")
            (message "Failed to compile SwitchInput")
            nil))
      (message "Cannot find swiftc. Make sure Swift is installed.")
      nil)))

(defun switch-input-ensure-available ()
  "Ensure the SwitchInput program is available and compiled."
  (unless (file-executable-p switch-input-path)
    (if (file-exists-p switch-input-source-path)
        (or (switch-input-compile)
            (error "Failed to compile SwitchInput. Check *SwitchInput Compilation* buffer"))
      (error "SwitchInput source file not found at %s" switch-input-source-path))))

(defun switch-input-toggle ()
  "Toggle between input methods using SwitchInput."
  (interactive)
  (switch-input-ensure-available)
  (let ((result (call-process switch-input-path nil nil nil)))
    (unless (= result 0)
      (message "Failed to toggle input method"))))

(defun switch-input-select (index)
  "Select input method by INDEX using SwitchInput."
  (switch-input-ensure-available)
  (let ((result (call-process switch-input-path nil nil nil (number-to-string index))))
    (unless (= result 0)
      (message "Failed to select input method %d" index))))

(defun switch-input-to-english ()
  "Switch to English input method."
  (interactive)
  (switch-input-select switch-input-english-index)
  (message "Switched to English input method"))
 
(defun switch-input-to-chinese ()
  "Switch to Chinese input method."
  (interactive)
  (switch-input-select switch-input-chinese-index)
  (message "Switched to Chinese input method"))


(provide 'init-func)
;;; init-func.el ends here
