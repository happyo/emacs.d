;;; init-pomodoro.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package posframe
  :ensure t)

(defun my-posframe-poshandler-frame-top-right (info)
  "Poshandler for displaying posframe at the top right of the frame."
  (let* ((parent-frame (plist-get info :parent-frame))
         (parent-width (frame-pixel-width parent-frame))
         (parent-height (frame-pixel-height parent-frame))
         (posframe-width (plist-get info :posframe-width))
         (posframe-height (plist-get info :posframe-height))
         (x (- parent-width posframe-width 10))  ; Adjust 10 pixels from the right edge
         (y 10))                                 ; 10 pixels from the top edge
    (cons x y)))

(defun my-posframe-show (text poshandler width)
  "Show a posframe with TEXT at the specified position using POSHANDLER."
  (posframe-show "my-posframe"
                 :string text
                 :poshandler poshandler
                 :timeout nil
                 :background-color "#2c3e50"
                 :foreground-color "#FFFFFF"
                 :internal-border-width width
                 :internal-border-color "#2c3e50"))

(defun my-posframe-hide ()
  "Hide the posframe."
  (posframe-hide "my-posframe"))

(defun my-posframe-update ()
  "Update the posframe countdown timer."
  (let ((remaining (time-subtract my-posframe-end-time (current-time))))
    (if (time-less-p remaining '(0 0 0))
        (progn
          (my-posframe-hide)
          (message "Time's up!")
          (my-mac-notify "Pomodoro Timer" "Time's up! Take a break.")
          (my-posframe-show "Time's up!" 'posframe-poshandler-frame-center 100))
      (let ((minutes (/ (nth 1 remaining) 60))
            (seconds (% (nth 1 remaining) 60)))
        (my-posframe-show (format "Time remaining: %02d:%02d" minutes seconds) 'my-posframe-poshandler-frame-top-right 10))
      (run-at-time 1 nil #'my-posframe-update))))

(defun my-posframe-start-countdown (minutes)
  "Start a countdown timer for MINUTES minutes."
  (interactive "nMinutes: ")
  (my-posframe-hide)
  (setq my-posframe-end-time (time-add (current-time) (seconds-to-time (* minutes 60))))
  (my-posframe-update))

(defun my-posframe-cancel-countdown ()
  "Cancel the countdown timer."
  (interactive)
  (when my-posframe-timer
    (cancel-timer my-posframe-timer)
    (setq my-posframe-timer nil))
  (my-posframe-hide))

(defun my-mac-notify (title message)
  "Send a macOS notification with TITLE and MESSAGE."
  (call-process "osascript" nil 0 nil
                "-e" (format "display notification \"%s\" with title \"%s\"" message title)))

(defun my-pomodoro-start-todo ()
  "Start a pomodoro timer for the current task."
  (interactive)
  (my-posframe-start-countdown 25))

(defun my-pomodoro-start-rest ()
  "Start a rest timer."
  (interactive)
  (my-posframe-start-countdown 5))

(defun my-next-track ()
  "Skip to the next track."
  (interactive)
  (call-process "osascript" nil 0 nil
                "-e" "tell application \"Music\" to next track"))

(defun my-previous-track ()
  "Skip to the previous track."
  (interactive)
  (call-process "osascript" nil 0 nil
                "-e" "tell application \"Music\" to previous track"))

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

(defun my/meow-exit-insert-mode-handler ()
  "当退出 meow insert 模式时执行的函数"
  (switch-input-to-english))

;; 添加到 meow-insert-exit-hook
(add-hook 'meow-insert-exit-hook #'my/meow-exit-insert-mode-handler)

(defun my/meow-enter-insert-mode-handler ()
  "当进入 meow insert 模式时执行的函数，会判断当前的 major-mode"
  (let ((current-major-mode major-mode))
    (message "进入了 Meow Insert 模式，当前 major-mode 是: %s" current-major-mode)
    
    ;; 根据不同的 major-mode 执行不同的操作
    (cond
     ((eq current-major-mode 'org-mode)
      (switch-input-to-chinese))
     ((eq current-major-mode 'copilot-chat-org-prompt-mode)
      (switch-input-to-chinese))
     ((derived-mode-p 'prog-mode)
      (switch-input-to-english))
     (t
      (message "其他模式")))))

;; 添加到 meow-insert-enter-hook
(add-hook 'meow-insert-enter-hook #'my/meow-enter-insert-mode-handler)
;; (add-hook 'meow-insert-exit-hook #'switch-input-to-english)
;; (add-hook 'meow-insert-enter-hook #'sis-set-english)

;; (defun comiple-switch-input ()
;;   (interactive)
;;   (call-process "swift" nil 0 nil "-o" switch-input-path (concat switch-input-path ".swift")))

;; (defun my-toggle-input-method ()
;;   (interactive)
;;   (call-process switch-input-path nil 0 nil))

;; (defun my-change-input-to-en ()
;;   (interactive)
;;   (call-process switch-input-path nil 0 nil "0"))

;; (defun my-change-input-to-zh ()
;;     (interactive)
;;     (call-process switch-input-path nil 0 nil "1"))

(provide 'init-pomodoro)
;;; init-pomodoro.el ends here
