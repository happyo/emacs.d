;;; init-translate.el --- Translate package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package websocket)
;; (use-package go-translate
;;   :config
;;   (setq gts-translate-list '(("en" "zh")))

;;   (setq gts-default-translator
;;         (gts-translator
;;          :picker (gts-prompt-picker)
;;          :engines (list (gts-bing-engine) (gts-google-engine))
;;          :render (gts-buffer-render))))

(add-to-list 'load-path "~/.emacs.d/site-lisp/websocket-bridge/")
(require 'websocket-bridge)

(add-to-list 'load-path "~/.emacs.d/site-lisp/dictionary-overlay/")
(require 'dictionary-overlay)

(provide 'init-translate)
;;; init-translate.el ends here
