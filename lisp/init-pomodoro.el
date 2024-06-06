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

(defun my-posframe-show (text poshandler)
  "Show a posframe with TEXT at the specified position using POSHANDLER."
  (posframe-show "my-posframe"
                 :string text
                 :poshandler poshandler
                 :timeout nil
                 :background-color "#2c3e50"
                 :foreground-color "#FFFFFF"
                 :internal-border-width 10
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
          (my-posframe-show "Time's up!" 'posframe-poshandler-frame-center))
      (let ((minutes (/ (nth 1 remaining) 60))
            (seconds (% (nth 1 remaining) 60)))
        (my-posframe-show (format "Time remaining: %02d:%02d" minutes seconds) 'my-posframe-poshandler-frame-top-right))
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

(provide 'init-pomodoro)
;;; init-pomodoro.el ends here
