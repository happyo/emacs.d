;;; init-beframe.el --- Init beframe package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (use-package 'frame-tabs
;;    :ensure t)

;; (use-package pulsar
;;   :config
;;   ;; integration with the `consult' package:
;;   (add-hook 'consult-after-jump-hook #'pulsar-recenter-top)
;;   (add-hook 'consult-after-jump-hook #'pulsar-reveal-entry)
;;   (setq pulsar-pulse t)
;;   (setq pulsar-delay 0.055)
;;   (setq pulsar-iterations 10)
;;   (setq pulsar-face 'pulsar-magenta)
;;   (setq pulsar-highlight-face 'pulsar-yellow)

;;   (pulsar-global-mode 1)
;;   )

;; (use-package cursory
;;   :config
;;   ;; Check the `cursory-presets' for how to set your own preset styles.

;;   (setq cursory-latest-state-file (locate-user-emacs-file "cursory-latest-state"))

;;   ;; Set last preset or fall back to desired style from `cursory-presets'.
;;   (cursory-set-preset (or (cursory-restore-latest-preset) 'bar))

;;   ;; The other side of `cursory-restore-latest-preset'.
;;   (add-hook 'kill-emacs-hook #'cursory-store-latest-preset)

;;   ;; We have to use the "point" mnemonic, because C-c c is often the
;;   ;; suggested binding for `org-capture'.
;;   (define-key global-map (kbd "C-c p") #'cursory-set-preset))

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/beframe")

(require 'beframe)

;; This is the default value.  Write here the names of buffers that
;; should not be beframed.
(setq beframe-global-buffers '("*scratch*" "*Messages*" "*Backtrace*"))
;; (setq beframe-functions-in-frames '(projectile-switch-project))

(beframe-mode 1)

;; This is just an example.  We do not define any key bindings.  You
;; do not need this command if you enable `beframe-mode', as
;; `switch-to-buffer' only shows a list of beframed buffers.
(define-key global-map (kbd "C-x B") #'beframe-switch-buffer)

;; Replace the generic `buffer-menu'.  With a prefix argument, this
;; commands prompts for a frame.  Call the `buffer-menu' via M-x if
;; you absolutely need the global list of buffers.
(define-key global-map (kbd "C-x C-b") #'beframe-buffer-menu)

(defvar consult-buffer-sources)
(declare-function consult--buffer-state "consult")


(with-eval-after-load 'consult
  (defface beframe-buffer
    '((t :inherit font-lock-string-face))
    "Face for `consult' framed buffers.")

  (defvar beframe-consult-source
    `( :name     "Frame-specific buffers (current frame)"
       :narrow   ?F
       :category buffer
       :face     beframe-buffer
       :history  beframe-history
       :items    ,#'beframe-buffer-names
       :action   ,#'switch-to-buffer
       :state    ,#'consult--buffer-state))

  (add-to-list 'consult-buffer-sources 'beframe-consult-source))

;; (with-eval-after-load 'ibuffer
;;   (defun beframe-buffer-in-frame (buf frame)
;;     "Return non-nil if BUF is in FRAME."
;;     (memq buf (beframe-buffer-list (beframe-frame-object frame))))

;;   (defun beframe-frame-name-list ()
;;     "Return list with frame names."
;;     (mapcar #'car (make-frame-names-alist)))

;;   (defun beframe-generate-ibuffer-filter-groups ()
;;     "Create a set of ibuffer filter groups based on the vc root dirs of buffers."
;;     (mapcar
;;      (lambda (frame)
;;        (list (format "%s" frame)
;;              (list 'predicate 'beframe-buffer-in-frame '(current-buffer) frame)))
;;      (beframe-frame-name-list)))

;;   (setq ibuffer-saved-filter-groups
;;         `(("Frames" ,@(beframe-generate-ibuffer-filter-groups))))

;;   (define-ibuffer-filter frame
;;       "Limit current view to buffers in frames."
;;     (:description "frame")
;;     (memq buf (beframe-buffer-list))))

(provide 'init-beframe)
;;; init-beframe.el ends here
