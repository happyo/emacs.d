;;; init-dash.el --- Integrate with the Mac app "Dash" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package smex
    :config
    (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
) ; Not needed if you use package.el

(provide 'init-smex)
;;; init-smex.el ends here
