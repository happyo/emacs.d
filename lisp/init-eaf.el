;;; init-eaf.el --- Emacs Application Framework -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
;; (require 'eaf-org-previewer)
;; (require 'eaf-mindmap)
;; (require 'eaf-mermaid)
(require 'eaf-pdf-viewer)
;; (require 'eaf-markdown-previewer)
(require 'eaf-browser)
;; (require 'eaf-airshare)
;; (require 'eaf-image-viewer)
;; (require 'eaf-rss-reader)
(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  (eaf-browser-dark-mode nil)
  (eaf-pdf-dark-mode nil) 
  :config
  ;; (defalias 'browse-web #'eaf-open-browser)
  ;; (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key kill-this-buffer "M-q" eaf-browser-keybinding)
  (eaf-bind-key nil "M-o" eaf-browser-keybinding)
  ) ;; unbind, see more in the Wiki

(provide 'init-eaf)
;;; init-eaf.el ends here
