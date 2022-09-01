;;; init-exec-path.el --- Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)
(require 'init-func)

(use-package exec-path-from-shell)

(with-eval-after-load 'exec-path-from-shell
  (dolist (var '("PATH"))
    (add-to-list 'exec-path-from-shell-variables var)))

(when (or (memq window-system '(mac ns x))
          (unless (memq system-type '(ms-dos windows-nt))
            (daemonp)))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
