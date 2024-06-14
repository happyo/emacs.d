;;; init-macos.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/site-lisp/EmacsMacPluginModule")

(require 'mac-plugin)
(require 'chinese-color)

(mac-plugin-load-release)
(atmosphere-enable)
(mac-plugin-set-cursor-color tcc-059-qiaohong)
(mac-plugin-set-shadow-opacity 1.0)

(provide 'init-macos)
;;; init-macos.el ends here
