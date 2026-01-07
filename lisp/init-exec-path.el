;;; init-exec-path.el --- Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-func)

(when (or (memq window-system '(mac ns x))
          (unless (memq system-type '(ms-dos windows-nt))
            (daemonp)))
  (use-package exec-path-from-shell
    :config
    ;; 一次性获取所有需要的环境变量，避免多次启动 shell
    (setq exec-path-from-shell-variables
          '("PATH" "MANPATH"
            "GITHUB_TOKEN"
            "DEEPSEEK_API_KEY"
            "OPENAI_API_BASE"
            "OPENAI_API_KEY"
            "TAVILY_API_KEY"
            "DUIBA_API_KEY"
            "ANTHROPIC_BASE_URL"
            "ANTHROPIC_AUTH_TOKEN"))
    ;; 使用更快的 shell 参数
    (setq exec-path-from-shell-arguments '("-l"))
    ;; 只初始化一次
    (exec-path-from-shell-initialize)))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
