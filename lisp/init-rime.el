;;; init-rime.el --- Chinese input -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require-package 'rime)

(use-package rime
  :custom
  (default-input-method "rime"))

(provide 'init-rime)
;;; init-rime.el ends here
