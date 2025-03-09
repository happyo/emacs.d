;;; init-gpt.el --- Insert description here -*- lexical-binding -*-
;;; Commentary:
;;; Code:

(use-package smerge-mode
  :ensure nil
  :hook (prog-mode . smerge-mode))

(use-package gptel
  :ensure t
  :demand t
  :custom
  (gptel-temperature 0.1)
  (gptel-model "gpt-4o")
  :config (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (setq gptel-api-key (getenv "GITHUB_TOKEN"))
  (setq ds-api-key (getenv "DS_TOKEN"))
  ;; (setq gptel-backend
  ;;       (gptel-make-openai "GithubModels"
  ;;         :host "models.inference.ai.azure.com"
  ;;         :endpoint "/chat/completions"
  ;;         :stream t
  ;;         :key gptel-api-key
  ;;         :models '(gpt-4o)
  ;;         ))
  ;; OPTIONAL configuration
(setq gptel-model   'deepseek-chat
      gptel-backend
      (gptel-make-openai "DeepSeek"     ;Any name you want
        :host "api.deepseek.com"
        :endpoint "/chat/completions"
        :stream t
        :key ds-api-key             ;can be a function that returns the key
        :models '(deepseek-reasoner
                  ;; deepseek-chat
                  ;; deepseek-coder
                  )))
  )

;; (use-package gptel-aibo
;;   :after (gptel)
;;   :demand t
;;   :ensure t
;;   :straight t
;;   :config
;;   (define-key gptel-aibo-mode-map
;;               (kbd "C-c /") #'gptel-aibo-apply-last-suggestions))

(use-package copilot-chat
  :ensure t
  :demand t
  :after (magit)
  :config
  (add-hook 'git-commit-setup-hook 'copilot-chat-insert-commit-message)
  )

(provide 'init-gpt)
;;; init-gpt.el ends here
