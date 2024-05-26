;; init-yasnippet.el --- Initialize yasnippet configurations.	-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package yasnippet
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/yasnippet"
  :config
  (yas-global-mode 1)
  )

;; (use-package yasnippet-snippets
;;   :after yasnippet)

(use-package autoinsert
  :init
  ;; Don't want to be prompted before insertion:
  (setq auto-insert-query nil)

  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode 1)

  :config
  (define-auto-insert "\\.swift\\'" 'my-swift-template))

(defun my-swift-template ()
  (let ((user-name (user-full-name))  ; 获取用户全名
        (date (format-time-string "%Y/%m/%d")))  ; 获取当前日期
    (insert (concat "//\n"
                    "//  Created by " user-name " on " date ".\n"
                    "//\n"))))


(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
