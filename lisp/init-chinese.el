;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require-package 'cnfonts)

(require 'init-elpa)

(use-package cnfonts
    :config
    (cnfonts-enable))

(provide 'init-chinese)
;;; init-chinese.el ends here
