;;; init-elpa.el --- Init elpa auto download packages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
(require 'cl-lib)

;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
;; (setq package-user-dir
;;       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
;;                         user-emacs-directory))
;;; Standard package repositories

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-unsigned-archives "melpa")

;; Official MELPA Mirror, in case necessary.
;; (add-to-list 'package-archives (cons "melpa-mirror" (concat proto "://www.mirrorservice.org/sites/melpa.org/packages/")) t)

(setq use-package-vc-prefer-newest t)
;; Initialize packages
(setq package-native-compile t)
(package-initialize)
;; (package-refresh-contents)

;; Setup `use-package'

;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

(provide 'init-elpa)
;;; init-elpa.el ends here
