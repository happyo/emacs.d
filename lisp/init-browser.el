;;; init-browser.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package xwidget
  :ensure nil
  :bind (:map xwidget-webkit-mode-map
              ("C-d" . xwidget-webkit-scroll-up)
              ("C-u" . xwidget-webkit-scroll-down)
              ("b" . xwidget-webkit-back)
              ("f" . xwidget-webkit-forward)
              ("v" . xwwp-follow-link)
              ("t" . xwwp-ace-toggle))
  )

(use-package ctable
  :demand t
  :ensure t)

(use-package xwwp-full
  :demand t
  :ensure nil
  :after ctable
  :load-path "~/.emacs.d/site-lisp/xwwp"
  :custom
  (xwwp-follow-link-completion-system 'default)
  )

(provide 'init-browser)
;;; init-browser.el ends here
