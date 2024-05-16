;;; init-debug.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/site-lisp/dape")

(use-package dape
  ;; Currently only on github
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/dape"
  :config
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
               simulator-id "iPhone 15 Plus"
               app-bundle-id "ai.lilyn.FinPal"
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
