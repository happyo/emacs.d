;;; init-xterm.el --- Integrate with terminals such as xterm -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;(require 'init-frame-hooks)

;; (global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
;; (global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

;; (autoload 'mwheel-install "mwheel")

;; (defun sanityinc/console-frame-setup ()
;;   (xterm-mouse-mode 1) ; Mouse in a terminal (Use shift to paste with middle button)
;;   (mwheel-install))
(use-package vterm
  :ensure t
  :config
  (setq vterm-buffer-name-string "vterm: %s")
  (setq vterm-buffer-name "*vterm*")
  (define-key vterm-mode-map (kbd "M-i") 'vterm-toggle)
)

(use-package vterm-toggle
  :demand t
  :ensure t 
  :config 
  (global-set-key (kbd "M-i") 'vterm-toggle)
  )

(defvar meow-vterm-normal-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "RET") #'vterm-send-return)
    map)
  "Keymap for vterm in normal mode.")

(defun meow-vterm-insert-enter ()
  "Enable vterm default binding in insert and set cursor."
  (use-local-map vterm-mode-map)
  (vterm-goto-char (point)))

(defun meow-vterm-insert-exit ()
  "Use regular bindings in normal mode."
  (use-local-map meow-vterm-normal-mode-map))

(defun meow-vterm-setup ()
  "Configure insert mode for vterm."
  (add-hook 'meow-insert-enter-hook #'meow-vterm-insert-enter nil t)
  (add-hook 'meow-insert-exit-hook #'meow-vterm-insert-exit nil t)
  (use-local-map meow-vterm-normal-mode-map))

;;;###autoload
(defun meow-vterm-enable ()
  "Enable syncing vterm keymap with current meow mode."
  (setq vterm-keymap-exceptions '("C-c"))
  (define-key vterm-mode-map (kbd "C-c ESC") #'vterm-send-escape)
  (dolist (c '((yank . vterm-yank)
               (xterm-paste . vterm-xterm-paste)
               (yank-pop . vterm-yank-pop)
               (mouse-yank-primary . vterm-yank-primary)
               (self-insert-command . vterm--self-insert)
               (beginning-of-defun . vterm-previous-prompt)
               (end-of-defun . vterm-next-prompt)))
    (define-key meow-vterm-normal-mode-map (vector 'remap (car c)) (cdr c)))
  (add-hook 'vterm-mode-hook #'meow-vterm-setup))

(meow-vterm-enable)

(provide 'init-xterm)
;;; init-xterm.el ends here
