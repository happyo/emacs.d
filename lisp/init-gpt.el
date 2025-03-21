;;; -*- lexical-binding: t -*-
;;; init-gpt.el --- Insert description here -*- lexical-binding -*-
;;; Commentary:
;;; Code:

(use-package smerge-mode
  :ensure nil
  :hook (prog-mode . smerge-mode))

(use-package plz
  :ensure t
  :demand t
  )
(use-package shr
  :ensure t
  :demand t
  )

(use-package gptel
  :ensure t
  :demand t
  :bind (("C-c g" . gptel-menu))
  :vc (:url "https://github.com/karthink/gptel.git")
  :custom
  ;; (gptel-temperature 0.1)
  ;; (gptel-model "DeepSeek-R1")
  (gptel-default-mode 'org-mode)
  (gptel-org-branching-context t)
  :config
  (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n")
  (setq gptel-display-buffer-action '((display-buffer-same-window)))
  (setq gptel-api-key (getenv "GITHUB_TOKEN"))
  (setq ds-api-key (getenv "DEEPSEEK_API_KEY"))
  (gptel-make-openai "GithubModels"
    :host "models.inference.ai.azure.com"
    :endpoint "/chat/completions"
    :stream t
    :key gptel-api-key
    :models '("DeepSeek-R1")
    )
  ;; (setq gptel-model 'DeepSeek-R1
  ;;     gptel-backend
  ;;     (gptel-make-openai "Github Models" ;Any name you want
  ;;       :host "models.inference.ai.azure.com"
  ;;       :endpoint "/chat/completions"
  ;;       :stream t
  ;;       :key gptel-api-key
  ;;       :models '(DeepSeek-R1))
  (setq gptel-model   'deepseek-reasoner
        gptel-backend (gptel-make-deepseek "DeepSeek"
                        :stream t
                        :key ds-api-key))
  (defun gptel-set-default-directory ()
    (unless (buffer-file-name)
      (setq default-directory "~/developer/chatgpt/")))


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


  ;; 你需要定义一个 tavily-api-key 函数

  (gptel-make-tool
   :category "web"
   :name "search"
   :async t
   :function (lambda (cb keyword)
               (tavily-search-async cb keyword))
   :description "Search the Internet"
   :args (list '(:name "keyword"
                       :type string
                       :description "The keyword to search")))

  (gptel-make-tool
   :category "web"
   :name "fetch_url_text"
   :async t
   :description "Fetch the plaintext contents from an HTML page specified by its URL"
   :args (list '(:name "url"
                       :type string
                       :description "The url of the web page"))
   :function (lambda (cb url)
               (fetch-url-text-async cb url)))

  (setq tavily-api-key
        (getenv "TAVILY_API_KEY"))

  (defun tavily-search-async (callback query &optional search-depth max-results)
    "Perform a search using the Tavily API and return results as JSON string."
    (let* ((url "https://api.tavily.com/search")
           (search-depth (or search-depth "basic"))
           (max-results (or max-results 5))
           (request-headers            ; 根据 cURL 示例需要 Authorization 头
            `(("Content-Type" . "application/json")
              ("Authorization" . ,(format "Bearer %s" tavily-api-key))))  ; 关键修复点
           (request-data
            `(
              ("query" . ,query)
              ("search_depth" . ,search-depth)
              ("max_results" . ,max-results)
              ))
           (cb callback)
           )
      (plz 'post url
        :headers request-headers
        :body (json-encode request-data)
        :as 'string
        :then (lambda (result)
                (funcall cb result)))
      )
    )

  (defun fetch-url-text-async (callback url)
    "Fetch text content from URL."
    (require 'plz)
    (require 'shr)
    (plz 'get url
      :as 'string
      :then (lambda (html)
              (with-temp-buffer
                (insert html)
                (shr-render-region (point-min) (point-max))
                (shr-link-to-markdown)
                (funcall callback (buffer-substring-no-properties (point-min) (point-max)))))))

  (defun shr-link-to-markdown ()
    "Replace all shr-link in the current buffer to markdown format"
    (goto-char (point-min))
    (while (setq prop (text-property-search-forward 'shr-url))
      (let* ((start (prop-match-beginning prop))
             (end (prop-match-end prop))
             (text (buffer-substring-no-properties start end))
             (link (prop-match-value prop)))
        (delete-region start end)
        (goto-char start)
        (insert (format "[%s](%s)" text link)))))
  )

(use-package aidermacs
  :bind (("C-c a" . aidermacs-transient-menu))
  :custom
  (aidermacs-backend 'vterm)
  (aidermacs-use-architect-mode t)
  (aidermacs-architect-model "deepseek") ; default
  (aidermacs-vterm-multiline-newline-key "S-<return>")
  (aidermacs-default-model "deepseek"))

(use-package copilot-chat
  :ensure t
  :demand t
  :vc (:url "https://github.com/chep/copilot-chat.el.git")
  :after (magit)
  :config
  (add-hook 'git-commit-setup-hook 'copilot-chat-insert-commit-message)
  )

(provide 'init-gpt)
;;; init-gpt.el ends here
