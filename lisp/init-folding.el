;;; init-folding.el --- Support code and region folding -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; (when (maybe-require-package 'origami)
;;   (with-eval-after-load 'origami
;;     (define-key origami-mode-map (kbd "C-c f") 'origami-recursively-toggle-node)
;;     (define-key origami-mode-map (kbd "C-c F") 'origami-toggle-all-nodes)))
;; Flexible text folding
(use-package origami
  ;; :pretty-hydra
  ;; ((:title (pretty-hydra-title "Origami" 'octicon "fold" :height 1.1 :v-adjust -0.05)
  ;;   :color amaranth :quit-key "q")
  ;;  ("Node"
  ;;   ((";" origami-recursively-toggle-node "toggle recursively")
  ;;    ("a" origami-toggle-all-nodes "toggle all")
  ;;    ("t" origami-toggle-node "toggle current")
  ;;    ("o" origami-open-node "open current")
  ;;    ("c" origami-close-node "close current")
  ;;    ("s" origami-show-only-node "only show current"))
  ;;   "Actions"
  ;;   (("u" origami-undo "undo")
  ;;    ("d" origami-redo "redo")
  ;;    ("r" origami-reset "reset")
  ;;    ("n" origami-next-fold "next fold")
  ;;    ("p" origami-previous-fold "previous fold"))))
  ;; :bind (:map origami-mode-map
  ;;        ("C-~" . origami-hydra/body))
  :hook (prog-mode . origami-mode)
  :init (setq origami-show-fold-header t)
  :config (face-spec-reset-face 'origami-fold-header-face))


(provide 'init-folding)
;;; init-folding.el ends here
