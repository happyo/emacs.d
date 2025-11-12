;;; -*- lexical-binding: t -*-
;;; init-gpt.el --- Insert description here -*- lexical-binding -*-
;;; Commentary:
;;; Code:

(use-package poly-markdown
  :ensure t)

(use-package request
  :ensure t
  :defer t)

(use-package aio
  :ensure t
  :defer t)

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
  :bind (("C-c g" . gptel-menu))
  :vc (:url "https://github.com/karthink/gptel.git" :rev :newest)
  :custom
  ;; (gptel-temperature 0.1)
  ;; (gptel-model "DeepSeek-R1")
  (gptel-default-mode 'org-mode)
  (gptel-org-branching-context t)
  :config
  (setq gptel-log-level 'debug)
  (add-hook 'gptel-post-response-functions 'gptel-end-of-response)
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n")
  (setq gptel-display-buffer-action '((display-buffer-same-window)))
  (setq gptel-api-key (getenv "GITHUB_TOKEN"))
  (setq ds-api-key (getenv "DEEPSEEK_API_KEY"))
  (setq work-api-key (getenv "DUIBA_API_KEY"))
  (gptel-make-openai "GithubModels"
    :host "models.inference.ai.azure.com"
    :endpoint "/chat/completions"
    :stream t
    :key gptel-api-key
    :models '("DeepSeek-R1")
    )
  (gptel-make-openai "WorkModels"
    :host "api.zhizengzeng.com"
    :endpoint "/v1/chat/completions"
    :stream t
    :key work-api-key
    :models '("o3")
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

;; (use-package aidermacs
;;   :bind (("C-c a" . aidermacs-transient-menu))
;;   :custom
;;   (aidermacs-backend 'vterm)
;;   (aidermacs-use-architect-mode t)
;;   (aidermacs-architect-model "deepseek") ; default
;;   (aidermacs-vterm-multiline-newline-key "S-<return>")
;;   (aidermacs-default-model "deepseek"))

;; (use-package emigo
;;   :vc (:url "https://github.com/MatthewZMD/emigo.git" :branch "main")
;;   :config
;;   (emigo-enable) ;; Starts the background process automatically
;;   :custom
;;   (emigo-python-command (pythonPath))
;;   ;; Encourage using OpenRouter with Deepseek
;;   (emigo-model "deepseek-chat")
;;   (emigo-base-url "https://api.deepseek.com/v1")
;;   ;; Securely load your API key (replace with your preferred method)
;;   (emigo-api-key (getenv "DEEPSEEK_API_KEY")))

(use-package mcp-hub
  :vc (:url "https://github.com/lizqwerscott/mcp.el.git")
  :config
  (setq mcp-hub-servers
        '(("fetch" . (:command "python3" :args ("-m" "mcp_server_fetch")))

          ("filesystem" . (:command "npx" :args ("-y" "@modelcontextprotocol/server-filesystem" "~/developer")))

          ("weather" . (:command "python3" :args ("-m" "weather")))
          ))

  (defun gptel-mcp-register-tool ()
    (interactive)
    (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
      (mapcar #'(lambda (tool)
                  (apply #'gptel-make-tool
                         tool))
              tools)))

  ;; 激活所有 mcp 工具
  ;; (defun gptel-mcp-use-tool ()
  ;;   (interactive)
  ;;   (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
  ;;     (mapcar #'(lambda (tool)
  ;;                 (let ((path (list (plist-get tool :category)
  ;;                                   (plist-get tool :name))))
  ;;                   (push (gptel-get-tool path)
  ;;                         gptel-tools)))
  ;;             tools)))

  (defun gptel-mcp-register-tool ()
  "Fetch tools from mcp-hub and register with gptel, ensuring all args have :description."
  (interactive)
  (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
    (mapcar
     (lambda (tool)
       ;; 修复 tool 中每个 arg 缺少 description 的问题
       (let* ((args (plist-get tool :args))
              (fixed-args
               (mapcar (lambda (arg)
                         (if (plist-member arg :description)
                             arg
                           (plist-put arg :description "")))
                       args)))
         (apply #'gptel-make-tool
                (plist-put tool :args fixed-args))))
     tools)))


  ;; 关闭所有 mcp 工具
  (defun gptel-mcp-close-use-tool ()
    (interactive)
    (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
      (mapcar #'(lambda (tool)
                  (let ((path (list (plist-get tool :category)
                                    (plist-get tool :name))))
                    (setq gptel-tools
                          (cl-remove-if #'(lambda (tool)
                                            (equal path
                                                   (list (gptel-tool-category tool)
                                                         (gptel-tool-name tool))))
                                        gptel-tools))))
              tools)))
  )

(use-package copilot-chat
  :vc (:url "https://github.com/chep/copilot-chat.el.git" :rev :newest)
  :after (magit)
  :config
  (setq copilot-chat-backend 'request)
  (setq copilot-chat-commit-model "gpt-4o")
  (add-hook 'git-commit-setup-hook 'copilot-chat-insert-commit-message)
  )

(use-package claude-code
  :defer t
  :vc (:url "https://github.com/stevemolitor/claude-code.el" :rev :newest)
  :bind-keymap ("C-c c" . claude-code-command-map)
  :config
  (setq claude-code-program-switches '("--dangerously-skip-permissions"))
  (setq claude-code-terminal-backend 'vterm)
  (claude-code-mode)
  )

(provide 'init-gpt)
;;; init-gpt.el ends here
