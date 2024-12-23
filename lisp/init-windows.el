;;; init-windows.el --- Working with windows within frames -*- lexical-binding: t -*-
;;; Commentary:

;; This is not about the "Windows" OS, but rather Emacs's "windows"
;; concept: these are the panels within an Emacs frame which contain
;; buffers.

;;; Code:

;; Navigate window layouts with "C-c <left>" and "C-c <right>"


;; Make "M-o" prompt for a target window when there are more than 2
(windmove-default-keybindings)
(use-package transpose-frame
  :bind ("C-x 5" . transpose-frame)
  )
(setq split-width-threshold 0)
(setq split-height-threshold nil)

(provide 'init-windows)
;;; init-windows.el ends here
