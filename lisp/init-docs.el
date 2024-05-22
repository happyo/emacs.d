;;; init-docs.el --- Integrate with the Mac app "Dash" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Support for the http://kapeli.com/dash documentation browser
(require 'init-elpa)
(require 'init-func)

;; (when *is-a-mac*
;;   (use-package dash-at-point)
;;   (global-set-key (kbd "C-c D") 'dash-at-point))
(use-package devdocs)

(provide 'init-docs)
;;; init-dash.el ends here
