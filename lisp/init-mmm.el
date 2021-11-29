;;; init-mmm.el --- Multiple Major Modes support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package mmm-mode
  :config
  (setq mmm-global-mode 'buffers-with-submode-classes)
  (setq mmm-submode-decoration-level 2)
  )
(require 'mmm-auto)

(provide 'init-mmm)
;;; init-mmm.el ends here
