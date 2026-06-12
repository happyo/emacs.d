;;; init-dart.el --- Dart support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package dart-mode)

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/dart-ts-mode")
;; (require 'dart-ts-mode)

;; dart-ts-mode is not on MELPA; install from GitHub via :vc.
;; (:vc disables the ELPA :ensure, and only installs when the package
;; is missing, so it won't contact melpa.org on every startup.)
(use-package dart-ts-mode
  :vc (:url "https://github.com/50ways2sayhard/dart-ts-mode.git" :rev :newest))

(use-package yaml-mode)

(provide 'init-dart)

;;; init-dart.el ends here
