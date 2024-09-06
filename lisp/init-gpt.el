;;; init-gpt.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package gptel
  :custom (gptel-temperature 0.1)
  :config (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (setq-default gptel-backend
                (gptel-make-openai "GithubModels"
                                   :host "models.inference.ai.azure.com"
                                   :endpoint "/chat/completions"
                                   :models '("gpt-4o")
                                   :stream t
                                   :header `(("Authorization" . ,(concat "Bearer " (getenv "GITHUB_TOKEN")))))))

(provide 'init-gpt)
;;; init-gpt.el ends here
