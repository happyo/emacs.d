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
  :ensure t
  :config 
  (global-set-key (kbd "M-i") 'vterm-toggle)
)

(provide 'init-xterm)
;;; init-xterm.el ends here
