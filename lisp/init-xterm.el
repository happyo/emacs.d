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
)

(use-package vterm-toggle
  :ensure t)
;; (setq vterm-toggle-fullscreen-p nil)
;; (add-to-list 'display-buffer-alist
;;              '((lambda (buffer-or-name _)
;;                    (let ((buffer (get-buffer buffer-or-name)))
;;                      (with-current-buffer buffer
;;                        (or (equal major-mode 'vterm-mode)
;;                            (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
;;                 (display-buffer-reuse-window display-buffer-at-bottom)
;;                 ;;(display-buffer-reuse-window display-buffer-in-direction)
;;                 ;;display-buffer-in-direction/direction/dedicated is added in emacs27
;;                 ;;(direction . bottom)
;;                 ;;(dedicated . t) ;dedicated is supported in emacs27
;;                 (reusable-frames . visible)
;;                 (window-height . 0.3)))


;; (add-hook 'after-make-console-frame-hooks 'sanityinc/console-frame-setup)

(provide 'init-xterm)
;;; init-xterm.el ends here
