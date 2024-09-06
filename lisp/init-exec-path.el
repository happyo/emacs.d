;;; init-exec-path.el --- Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-func)

(when (or (memq window-system '(mac ns x))
          (unless (memq system-type '(ms-dos windows-nt))
            (daemonp)))
    (use-package exec-path-from-shell
      :init
      (exec-path-from-shell-initialize)
      (exec-path-from-shell-copy-env "GITHUB_TOKEN")
      ))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
