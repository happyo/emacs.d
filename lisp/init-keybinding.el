;;; init-keybinding.el --- Global key binding -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-projectile)
(require 'init-lsp)
(require 'init-func)

(add-to-list 'auto-mode-alist '("\\.h\\'" . objc-mode))

(global-set-key (kbd "M-/") 'comment-line)
(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-[") 'indent-region)


(defun my-jump-to-definition ()
  "根据当前的 major-mode 调用相应的跳转到定义的函数。"
  (interactive)
  (if (my-is-mode-jump-by-xref)
      (xref-find-definitions (xref-backend-identifier-at-point (xref-find-backend)))
    (lsp-bridge-find-def)))

(defun my-go-back ()
  "根据当前的 major-mode 调用相应的返回上一个位置的函数。"
  (interactive)
  (if (my-is-mode-jump-by-xref)
      (xref-go-back)
    (lsp-bridge-find-def-return)))


(defvar my-custom-minor-mode-map (make-sparse-keymap)
  "自定义的 keymap，用于覆盖其他 mode 的快捷键。")

(define-key my-custom-minor-mode-map (kbd "M-h") 'tab-bar-select-tab)
(define-key my-custom-minor-mode-map (kbd "M-w") 'delete-window)
(define-key my-custom-minor-mode-map (kbd "M-DEL") 'backward-kill-sentence)
(define-key my-custom-minor-mode-map (kbd "C-o") 'universal-argument)
(define-key my-custom-minor-mode-map (kbd "C-d") 'my-scroll-up-half-page)
(define-key my-custom-minor-mode-map (kbd "C-u") 'my-scroll-down-half-page)
(define-key my-custom-minor-mode-map (kbd "M-r") 'eval-last-sexp)
(define-key my-custom-minor-mode-map (kbd "M--") 'text-scale-decrease)
(define-key my-custom-minor-mode-map (kbd "M-=") 'text-scale-increase)
(define-key my-custom-minor-mode-map (kbd "M-c") 'kill-ring-save)
(define-key my-custom-minor-mode-map (kbd "M-s") 'save-buffer)
(define-key my-custom-minor-mode-map (kbd "M-z") 'undo)
(define-key my-custom-minor-mode-map (kbd "M-k") 'kill-this-buffer)
(define-key my-custom-minor-mode-map (kbd "M-K") 'delete-window)
(define-key my-custom-minor-mode-map (kbd "M-v") 'yank)
(define-key my-custom-minor-mode-map (kbd "M-V") 'consult-yank-from-kill-ring)
(define-key my-custom-minor-mode-map (kbd "M-s-v") 'consult-yank-from-kill-ring)
(define-key my-custom-minor-mode-map (kbd "M-p") 'projectile-switch-project)
(define-key my-custom-minor-mode-map (kbd "M-.") 'xref-find-definitions)
(define-key my-custom-minor-mode-map (kbd "M-,") 'xref-go-back)
(define-key my-custom-minor-mode-map (kbd "M-]") 'lsp-bridge-code-format)


(define-minor-mode my-custom-minor-mode
  "自定义的 minor mode，用于覆盖其他 mode 的快捷键。"
  :init-value nil
  :global t
  :keymap my-custom-minor-mode-map)

(my-custom-minor-mode 1)
;; (dotimes (i 9)
;;   (define-key global-map (kbd (format "M-%d" (1+ i))) '(select-tab-key i)))

(provide 'init-keybinding)
;;; init-keybinding.el ends here
