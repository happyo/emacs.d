;;; init-meow.el --- Integrate with the "Meow" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

;; meow
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . meow-motion-origin-command)
   '("k" . meow-motion-origin-command)
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
   '("RET" . meow-next)
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
   '("a" . meow-insert)
   '("A" . meow-end-or-call-kmacro)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-delete)
   '("D" . scroll-up)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("F" . meow-find-expand)
   '("g" . meow-goto-line)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-append)
   '("I" . meow-start-kmacro-or-insert-counter)
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
   '("P" . meow-sync-grab)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("T" . meow-till-expand)
   '("u" . undo)
   '("U" . scroll-down)
   '("v" . meow-line)
   '("V" . meow-kmacro-matches)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-kill)
   '("X" . meow-kmacro-lines)
   '("y" . meow-save)
   '("Y" . meow-grab)
   '("z" . meow-pop-selection)
   '("Z" . meow-pop-all-selection)
   '("&" . meow-query-replace)
   '("%" . meow-query-replace-regexp)
   '("'" . repeat)
   '("\\" . quoted-insert)
   '("/" . meow-visit)
   '("<escape>" . meow-cancel)
   ))

(setq meow-selection-command-fallback '((meow-delete . meow-kill-whole-line)
                                        (meow-change . meow-change-char)
                                        (meow-save . meow-save-char)
                                        (meow-replace . meow-replace-char)
                                        (meow-cancel . meow-minibuffer-quit)
                                        (meow-kill . meow-C-d)
                                        (meow-quit . meow-minibuffer-quit)
                                         ))

(use-package meow
  :demand t
  :init
  (meow-global-mode 1)
  :config
  ;; meow-setup is your custom function, see below
  (meow-setup)
  ;; If you want relative line number in NORMAL state(for display-line-numbers-mode)
  (meow-setup-line-number)
  ;; If you need setup indicator, see `meow-indicator' for customizing by hand.
  (meow-setup-indicator))

(global-set-key (kbd "M-c") 'meow-clipboard-save)
(global-set-key (kbd "M-v") 'meow-clipboard-yank)


(provide 'init-meow)
;;; init-meow.el ends here
