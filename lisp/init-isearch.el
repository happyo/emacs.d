
;;; init-isearch.el --- isearch settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)


;; (with-eval-after-load 'isearch
;;   ;; DEL during isearch should edit the search string, not jump back to the previous result
;;   (define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

;;   ;; Activate occur easily inside isearch
;;   (when (fboundp 'isearch-occur)
;;     ;; to match ivy conventions
;;     (define-key isearch-mode-map (kbd "C-c C-o") 'isearch-occur)))

;; Search back/forth for the symbol at point
;; See http://www.emacswiki.org/emacs/SearchAtPoint
(defun isearch-yank-symbol ()
  "*Put symbol at current point into search string."
  (interactive)
  (let ((sym (thing-at-point 'symbol)))
    (if sym
        (progn
          (setq isearch-regexp t
                isearch-string (concat "\\_<" (regexp-quote sym) "\\_>")
                isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
                isearch-yank-flag t))
      (ding)))
  (isearch-search-and-update))

(defun sanityinc/isearch-exit-other-end ()
  "Exit isearch, but at the other end of the search string.
This is useful when followed by an immediate kill."
  (interactive)
  (isearch-exit)
  (goto-char isearch-other-end))

;; Show number of matches while searching
(use-package anzu
  :init
  (setq anzu-mode-lighter "")
  :bind
  ("\C-\M-w" . 'isearch-yank-symbol)
  ("<C-return>" . 'sanityinc/isearch-exit-other-end)
  ([remap isearch-query-replace] . 'anzu-query-replace)
  ([remap isearch-query-replace-regexp] . 'anzu-query-replace-regexp)
  ("M-F" . 'anzu-query-replace)
  ;; ("M-r" . 'anzu-query-replace-regexp)
  :config
  (add-hook 'after-init-hook 'global-anzu-mode)
  )

(provide 'init-isearch)
;;; init-isearch.el ends here
