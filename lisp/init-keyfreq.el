;;; init-keyfreq.el --- Integrate with the "Keyfreq" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package keyfreq
  :init
  (setq keyfreq-excluded-commands
      '(self-insert-command
        forward-char
        backward-char
        previous-line
        next-line))
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  )

(provide 'init-keyfreq)
;;; init-keyfreq.el ends here
