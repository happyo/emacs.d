;;; init-beframe.el --- Init beframe package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/site-lisp/beframe")

(require 'beframe)

;; This is the default value.  Write here the names of buffers that
;; should not be beframed.
(setq beframe-global-buffers '("*scratch*" "*Messages*" "*Backtrace*"))

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

(use-package substitute)

;; (with-eval-after-load 'consult
;;   (defface beframe-buffer
;;     '((t :inherit font-lock-string-face))
;;     "Face for `consult' framed buffers.")

;;   (defvar beframe-consult-source
;;     `( :name     "Frame-specific buffers (current frame)"
;;        :narrow   ?F
;;        :category buffer
;;        :face     beframe-buffer
;;        :history  beframe-history
;;        :items    ,#'beframe-buffer-names
;;        :action   ,#'switch-to-buffer
;;        :state    ,#'consult--buffer-state))

;;   (add-to-list 'consult-buffer-sources 'beframe-consult-source))

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
