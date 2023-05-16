;;; init-mode-line.el --- Intergration doom model line -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (use-package doom-modeline
;;   :ensure t
;;   :init
;;   (setq doom-modeline-icon nil)
;;   (setq doom-modeline-vcs-max-length 300)
;;   :hook
;;   (after-init . doom-modeline-mode)
;; )

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'init-mode-line)
;;; init-mode-line.el ends here
