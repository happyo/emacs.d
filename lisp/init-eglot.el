;;; init-eglot.el --- Init eglot -*- lexical-binding: t -*-
;;; Commentary: Now using lsp-bridge, this is not using
;;; Code:

(require 'init-elpa)

(setq mk-sourcekit-lsp-options '("--sync"))
  (defun mk-sourcekit-lsp-executable ()
	(setq mk-sourcekit-lsp-executable
          (cond ((executable-find "sourcekit-lsp"))
				((equal system-type 'darwin)
				 (cond ((executable-find "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))
					   ((executable-find "/usr/local/bin/sourcekit-lsp"))
                       ((executable-find "/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp"))))
				((equal system-type 'gnu/linux)
				 (cond ((executable-find "/home/linuxbrew/.linuxbrew/bin/sourcekit-lsp"))))
				(t
				 ("sourcekit-lsp")))))

  (defun mk-sourcekit-lsp-command (interactive)
	(append (list (mk-sourcekit-lsp-executable)) mk-sourcekit-lsp-options))

 ;; (use-package eglot
 ;;    :config
   ;; (add-to-list 'eglot-server-programs '(swift-mode . ("/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp")))
;; )
(with-eval-after-load 'eglot
   (add-to-list 'eglot-server-programs '(swift-mode . ("/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp")))
  )

(provide 'init-eglot)
;;; init-eglot.el ends here
