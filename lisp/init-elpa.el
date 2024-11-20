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

;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; (setq package-archives '(("gnu"   . "http://mirrors.163.com/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.163.com/elpa/melpa/")))

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))


;; Official MELPA Mirror, in case necessary.
;; (add-to-list 'package-archives (cons "melpa-mirror" (concat proto "://www.mirrorservice.org/sites/melpa.org/packages/")) t)

;; Initialize packages
(setq package-enable-at-startup nil)
(setq package-native-compile t)
(package-initialize)

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

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
