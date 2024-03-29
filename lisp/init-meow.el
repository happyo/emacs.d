;;; init-meow.el --- Integrate with the "Meow" -*- lexical-binding: t -*-
;;; Commentary: Vim like edit package
;;; Code:

(require 'init-elpa)
(require 'init-editing-utils)

(global-set-key (kbd "M-d") 'delete-char)

;; meow
(defun meow-setup ()
  (setq meow--kbd-delete-char "M-d")
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  ;; Must set before enable `meow-global-mode`
  (setq meow-use-cursor-position-hack t
        meow-use-enhanced-selection-effect t)  ;; optional, for visual effect
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   ;; '("RET" . meow-next)
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   ;; '("A" . meow-end-or-call-kmacro)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-kill-whole-line)
   ;; '("C-d" . scroll-up)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("F" . meow-find-expand)
   '("g" . meow-goto-line)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   ;; '("I" . meow-start-kmacro-or-insert-counter)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-kmacro-matches)
   '("n" . meow-search)
   '("N" . meow-pop-search)
   '("o" . meow-open-below)
   '("O" . meow-open-above)
   '("p" . meow-yank)
   ;; '("P" . meow-sync-grab)
   '("q" . meow-minibuffer-quit)
   '("Q" . meow-last-buffer)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("T" . meow-till-expand)
   '("u" . undo)
   ;; '("C-u" . scroll-down)
   '("v" . meow-line)
   ;; '("V" . meow-kmacro-matches)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-kill)
   ;; '("X" . meow-kmacro-lines)
   '("y" . kill-ring-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("Z" . meow-pop-all-selection)
   '("'" . repeat)
   '("\\" . quoted-insert)
   '("/" . meow-visit)
   '("<escape>" . ignore)
   '("DEL" . meow-beacon-kill-delete)
   ))

(use-package meow
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/meow"
  :custom
  (meow-selection-command-fallback '(
                                          (meow-change . meow-change-char)
                                          (meow-kill . meow-C-d)
                                          ;; (meow-cancel-selection . keyboard-quit)
                                          ;; (meow-pop-selection . meow-pop-grab)
                                          )) 
  (meow-expand-exclude-mode-list '(markdown-mode org-mode eaf-mode treemacs-mode))
  :config
  ;; meow-setup is your custom function, see below
  (add-to-list 'meow-mode-state-list '(eaf-mode . normal))
  (meow-setup)
  ;; If you want relative line number in NORMAL state(for display-line-numbers-mode)
  (meow-setup-line-number)
  (meow-global-mode 1)
  )


(provide 'init-meow)
;;; init-meow.el ends here
