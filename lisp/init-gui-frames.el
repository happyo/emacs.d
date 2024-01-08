;;; init-gui-frames.el --- Behaviour specific to non-TTY frames -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)
(require 'init-func)

;; Suppress GUI features

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)

;; Window size and features

(setq-default
 window-resize-pixelwise t
 frame-resize-pixelwise t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(menu-bar-mode -1)

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(defun adjust-opacity (frame incr)
  "Adjust the background opacity of FRAME by increment INCR."
  (unless (display-graphic-p frame)
    (error "Cannot adjust opacity of this frame"))
  (let* ((alpha (frame-parameter frame 'alpha))
         (background-alpha (if (listp alpha) (car alpha) alpha))
         (text-alpha (if (listp alpha) (cadr alpha) 100))
         (new-background-alpha (+ background-alpha incr)))
    (set-frame-parameter frame 'alpha (list new-background-alpha text-alpha))))


(global-set-key (kbd "M-C-e") (lambda () (interactive) (adjust-opacity (selected-frame) -3)))
(global-set-key (kbd "M-C-r") (lambda () (interactive) (adjust-opacity (selected-frame) 3)))
(global-set-key (kbd "M-C-7") (lambda () (interactive) (modify-frame-parameters nil `((alpha . 100)))))


(use-package ns-auto-titlebar)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Non-zero values for `line-spacing' can mess up ansi-term and co,
;; so we zero it explicitly in those cases.
(add-hook 'term-mode-hook
          (lambda ()
            (setq line-spacing 0)))

;; Change global font size easily

(use-package default-text-scale)
(when *is-a-mac* (ns-auto-titlebar-mode))

(use-package disable-mouse)


(add-to-list 'load-path "~/.emacs.d/site-lisp/holo-layer")
(require 'holo-layer)
;; (setq holo-layer-sort-tab-ui t)
(setq holo-layer-enable-cursor-animation t)
(setq holo-layer-enable-indent-rainbow t)
(setq holo-layer-cursor-block-commands '("watch-other-window-up" "watch-other-window-down" "self-insert-command"))
;; (holo-layer-enable)


(defun my-set-window-margins ()
  (set-window-margins nil 1 1))

(add-hook 'window-configuration-change-hook 'my-set-window-margins)
(setq-default header-line-format " ")
(set-face-attribute 'header-line nil :height 100)

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
