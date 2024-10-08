;;; init-gpt.el --- Insert description here -*- lexical-binding: jjjjjjjjt -*-
;;; Commentary:
;;; Code:

(use-package elysium
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/elysium"
  :after gptel
  :custom
  ;; Below are the default values
  (elysium-window-size 0.33) ; The elysium buffer will be 1/3 your screen
  (elysium-window-style 'vertical)) ; Can be customized to horizontal

(use-package smerge-mode
  :ensure nil
  :hook (prog-mode . smerge-mode))

(use-package gptel
  :demand t
  :custom
  (gptel-temperature 0.1)
  (gptel-model "gpt-4o")
  :config (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (setq gptel-backend
        (gptel-make-openai "GithubModels"
          :host "models.inference.ai.azure.com"
          :endpoint "/chat/completions"
          :models '("gpt-4o")
          :stream t
          :header `(("Authorization" . ,(concat "Bearer " (getenv "GITHUB_TOKEN")))))))

(use-package aider
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/aider"
  :config
  (setq aider-args '("--model" "gpt-4o" "--no-auto-commits"))
  (global-set-key (kbd "C-c a") 'aider-transient-menu))

(provide 'init-gpt)
;;; init-gpt.el ends here
