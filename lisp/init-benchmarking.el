;;; init-benchmarking.el --- Measure startup and require times -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(use-package benchmark-init
  :ensure t
  ;; To disable collection of benchmark data after init is done.
  :hook
  (after-init . benchmark-init/deactivate)
  :init
  (benchmark-init/activate)
  )

(provide 'init-benchmarking)
;;; init-benchmarking.el ends here
