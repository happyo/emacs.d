;;; init-chat.el --- Interect with Chatgpt -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/site-lisp/mind-wave")

(require 'mind-wave)

;; (setq mind-wave-chat-model "gpt-4")
(setq mind-wave-chat-temperature 0.8)

(provide 'init-chat)
;;; init-chat.el ends here
