;;; init-macos.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/site-lisp/EmacsMacPluginModule")

(require 'mac-plugin)

(mac-plugin-load-release)
(atmosphere-enable)
(mac-plugin-set-cursor-color "#fcc800")
(mac-plugin-set-shadow-opacity 1)

(provide 'init-macos)
;;; init-macos.el ends here
