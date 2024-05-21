;;; init-translate.el --- Translate package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package plz)
(add-to-list 'load-path "~/.emacs.d/site-lisp/go-translate/")
(require 'go-translate)

(setq gt-langs '(zh en))
(setq gt-default-translator (gt-translator :engines (gt-google-engine)
                              :render (gt-buffer-render)))
;; 如果是 gt-plz-http-client
(setq gt-default-http-client
      (gt-plz-http-client :args '("--proxy" "socks5://127.0.0.1:7890")))

(provide 'init-translate)
;;; init-translate.el ends here
