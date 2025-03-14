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
  (gptel-model "DeepSeek-R1")
  (gptel-default-mode 'org-mode)
  (gptel-org-branching-context t)
  :config
  (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n")
  (setq gptel-display-buffer-action '((display-buffer-same-window)))
  (setq gptel-api-key (getenv "GITHUB_TOKEN"))
  (setq gptel-backend
        (gptel-make-openai "GithubModels"
          :host "models.inference.ai.azure.com"
          :endpoint "/chat/completions"
          :stream t
          :key gptel-api-key
          :models '(gpt-4o)
          ))

  (add-hook 'gptel-mode-hook #'gptel-set-default-directory)
  (defun my-gptel-global-prompt-and-send ()
    "Prompt user for input and send it to a global gptel buffer."
    (interactive)
    (let ((buffer-name "*gptel-global*")
          (input (read-string "Enter your prompt: ")))
      (unless (get-buffer buffer-name)
        (with-current-buffer (get-buffer-create buffer-name)
          (org-mode)
          (gptel-mode)))
      (switch-to-buffer buffer-name)
      (goto-char (point-max))
      (insert input)
      (gptel-send input)
      ))

  (global-set-key (kbd "M-n") #'my-gptel-global-prompt-and-send)
  )

(defun gptel-set-default-directory ()
  (unless (buffer-file-name)
    (setq default-directory "~/developer/chatgpt/")))

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
