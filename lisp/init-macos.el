;;; init-macos.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (display-graphic-p)
  (add-to-list 'load-path "~/.emacs.d/site-lisp/EmacsMacPluginModule")

  (require 'mac-plugin)
  (require 'chinese-color)

  (mac-plugin-load-release)
  (atmosphere-enable)
  ;; (mac-plugin-set-cursor-color tcc-076-danfeng)
  (mac-plugin-set-cursor-color "#f2d5cf")
  (mac-plugin-set-shadow-opacity 1.0)
  )

(provide 'init-macos)
;;; init-macos.el ends here
