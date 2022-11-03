;;; init-pdf.el --- PDF tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package tablist)

(pdf-tools-install)  ; Standard activation command
(pdf-loader-install) ; On demand loading, leads to faster startup time

(provide 'init-pdf)
;;; init-pdf.el ends here
