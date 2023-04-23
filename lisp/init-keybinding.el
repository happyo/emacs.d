;;; init-keybinding.el --- Global key binding -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(global-set-key (kbd "M-/") 'comment-line)
(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-K") 'delete-window)
(global-set-key (kbd "M-d") 'delete-char)
(global-set-key (kbd "M-[") 'indent-region)
(global-set-key (kbd "M-=") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "C-d") 'scroll-up)
(global-set-key (kbd "C-u") 'scroll-down)
(global-set-key (kbd "M-r") 'eval-last-sexp)
(global-set-key (kbd "C-o") 'universal-argument)
(global-set-key (kbd "M-DEL") 'backward-kill-sentence)

(provide 'init-keybinding)
;;; init-keybinding.el ends here
