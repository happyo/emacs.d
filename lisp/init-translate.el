;;; init-translate.el --- Translate package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package plz)

(use-package go-translate
  :demand t
  :ensure t
  :vc (:url "https://github.com/lorniu/go-translate.git")
  :config
  (setq gt-langs '(zh en))
  (setq gt-default-translator (gt-translator :engines (gt-google-engine)
                                             :render (gt-buffer-render)))
  ;; 如果是 gt-plz-http-client
  (setq gt-default-http-client
        (gt-plz-http-client :args '("--proxy" "socks5://127.0.0.1:7890")))
  )

(defun my-translate-prompt-and-translate ()
  "Prompt for text and translate it using the default translator settings."
  (interactive)
  (let ((text (read-string "Enter text to translate: "))) ; 读取用户输入的文本
    (gt-start
     (gt-translator
      :taker (gt-taker :langs '(en zh) :text text)  ; 直接使用用户输入的文本
      :engines (gt-google-engine)  ; 从 gt-langs 设置获取翻译引擎配置
      :render (gt-buffer-render)))))  ; 使用 buffer 渲染翻译结果

;; (global-set-key (kbd "M-n") 'my-translate-prompt-and-translate)


(provide 'init-translate)
;;; init-translate.el ends here
