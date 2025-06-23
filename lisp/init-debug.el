;;; init-debug.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'swift-mode)
(require 'swift-ts-mode)

(use-package dape
  :vc (:url "https://github.com/svaante/dape.git" :rev :newest)
  :config
  (setq dape-buffer-window-arrangement 'right)
  (add-to-list 'dape-configs
             `(ios
               modes (swift-mode swift-ts-mode)
               command-cwd dape-command-cwd
               command ,(file-name-concat dape-adapter-dir
                                          "codelldb"
                                          "extension"
                                          "adapter"
                                          "codelldb")
               command-args ("--port" :autoport
                             "--settings" "{\"sourceLanguages\":[\"swift\"]}"
                             "--liblldb" "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB")
               port :autoport
               simulator-id "iPhone 16 Pro Max"
               app-bundle-id ""
               fn (dape-config-autoport
                   ,(lambda (config)
                      (with-temp-buffer
                        (let* ((command
                                (format "xcrun simctl launch --wait-for-debugger --terminate-running-process %S %S"
                                        (plist-get config 'simulator-id)
                                        (plist-get config 'app-bundle-id)))
                               (code (call-process-shell-command command nil (current-buffer))))
                          (dape--repl-message (format "* Running: %S *" command))
                          (dape--repl-message (buffer-string))
                          (save-match-data
                            (if (and (zerop code)
                                     (progn (goto-char (point-min))
                                            (search-forward-regexp "[[:digit:]]+" nil t)))
                                (plist-put config :pid (string-to-number (match-string 0)))
                              (dape--repl-message (format "* Running: %S *" command))
                              (dape--repl-message (format "Failed to start simulator:\n%s" (buffer-string)))
                              (user-error "Failed to start simulator")))))
                      config))
               :type "lldb"
               :request "attach"
               :cwd "."))
(add-to-list 'dape-configs
           `(swift-single-file
             modes (swift-mode)
             command-cwd dape-command-cwd
             command ,(file-name-concat dape-adapter-dir
                                      "codelldb"
                                      "extension"
                                      "adapter"
                                      "codelldb")
             command-args ("--port" :autoport
                          "--settings" "{\"sourceLanguages\":[\"swift\"],\"showDisassembly\":\"auto\"}"
                          "--liblldb" "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB")
             port :autoport
             fn (dape-config-autoport
                 ,(lambda (config)
                    (let* ((src-file (buffer-file-name))
                           (dir (file-name-directory src-file))
                           (output-file (file-name-sans-extension (buffer-file-name))))
                      (when (yes-or-no-p "Compile current file?")
                        (compile (format "swiftc -g '%s' -o '%s'"
                                       src-file
                                       output-file))
                        ;; 等待编译完成
                        (with-current-buffer "*compilation*"
                          (while (and (eq (process-status (get-buffer-process (current-buffer))) 'run)
                                      (accept-process-output (get-buffer-process (current-buffer)) 0.1)))))
                      ;; 更新并返回配置
                      (plist-put config :program output-file)
                      (plist-put config :cwd dir)
                      config)))
             :type "lldb"
             :request "launch"
             :sourceMap (("." . "."))
             :cwd "."))
  ;; (setq dape--debug-on '(io info error std-server))
  ;; (add-to-list 'dape-configs
  ;;              `(debugpy
  ;;                modes (python-ts-mode python-mode)
  ;;                command "python3"
  ;;                command-args ("-m" "debugpy.adapter")
  ;;                :type "executable"
  ;;                :request "launch"
  ;;                :cwd dape-cwd-fn
  ;;                :program dape-find-file-buffer-default))
  ;; (add-to-list 'dape-configs
  ;;              '(codelldb
  ;;                modes (c-mode c-ts-mode
  ;;                              c++-mode c++-ts-mode
  ;;                              rust-ts-mode rust-mode
  ;;                              swift-mode)
  ;;                ;; Replace vadimcn.vscode-lldb with the vsix directory you just extracted
  ;;                command "~/developer/debug/codelldb-aarch64-darwin/extension/adapter/codelldb"
  ;;                host "localhost"
  ;;                port 5818
  ;;                command-args ("--port" "5818")
  ;;                :type "lldb"
  ;;                :request "launch"
  ;;                :cwd dape-cwd-fn
  ;;                :program dape-find-file
  ;;                ;; :initCommands ("settings set lldb.library /Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB")
  ;;                ))
  ;; Use n for next etc. in REPL
  ;; (setq dape-repl-use-shorthand t)

  ;; By default dape uses gdb keybinding prefix
  ;; (setq dape-key-prefix "\C-x\C-a")

  ;; Kill compile buffer on build success
  ;; (add-hook 'dape-compile-compile-hooks 'kill-buffer)

  ;; Projectile users
  ;; (setq dape-cwd-fn 'projectile-project-root)
  )

(provide 'init-debug)
;;; init-debug.el ends here
