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
  ;; (setq dape--debug-on '(io info error std-server))
  (add-to-list 'dape-configs
               `(debugpy
                 modes (python-ts-mode python-mode)
                 command "python3"
                 command-args ("-m" "debugpy.adapter")
                 :type "executable"
                 :request "launch"
                 :cwd dape-cwd-fn
                 :program dape-find-file-buffer-default))
  (add-to-list 'dape-configs
               '(codelldb
                 modes (c-mode c-ts-mode
                               c++-mode c++-ts-mode
                               rust-ts-mode rust-mode
                               swift-mode)
                 ;; Replace vadimcn.vscode-lldb with the vsix directory you just extracted
                 command "~/developer/debug/codelldb-aarch64-darwin/extension/adapter/codelldb"
                 host "localhost"
                 port 5818
                 command-args ("--port" "5818")
                 :type "lldb"
                 :request "launch"
                 :cwd dape-cwd-fn
                 :program dape-find-file
                 ;; :initCommands ("settings set lldb.library /Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB")
                 ))
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
