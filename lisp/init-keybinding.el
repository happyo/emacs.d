;;; init-keybinding.el --- Global key binding -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(global-set-key (kbd "M-/") 'comment-line)
(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-[") 'indent-region)


;; (defun my-custom-m-dot-function ()
;;   "Execute different functions based on the current major mode."
;;   (interactive)
;;   (cond ((eq major-mode 'org-mode) (org-open-at-point))
;;         (t (lsp-bridge-find-def))))

(defun my-delete-to-line-beginning ()
  "Delete text from the current position to the beginning of the line."
  (interactive)
  (delete-region (point) (line-beginning-position)))

(defun my-kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defvar my-custom-minor-mode-map (make-sparse-keymap)
  "自定义的 keymap，用于覆盖其他 mode 的快捷键。")

(define-key my-custom-minor-mode-map (kbd "M-w") 'tab-close)
(define-key my-custom-minor-mode-map (kbd "M-DEL") 'my-delete-to-line-beginning)
(define-key my-custom-minor-mode-map (kbd "C-o") 'universal-argument)
(define-key my-custom-minor-mode-map (kbd "M--") 'text-scale-decrease)
(define-key my-custom-minor-mode-map (kbd "M-=") 'text-scale-increase)
(define-key my-custom-minor-mode-map (kbd "M-c") 'kill-ring-save)
(define-key my-custom-minor-mode-map (kbd "M-s") 'save-buffer)
(define-key my-custom-minor-mode-map (kbd "M-z") 'undo)
(define-key my-custom-minor-mode-map (kbd "M-k") 'my-kill-this-buffer)
(define-key my-custom-minor-mode-map (kbd "M-K") 'delete-window)
(define-key my-custom-minor-mode-map (kbd "M-D") 'delete-other-windows)
(define-key my-custom-minor-mode-map (kbd "M-v") 'yank)

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
