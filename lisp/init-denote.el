;;; init-denote.el --- Note package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-elpa)

(use-package denote
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/denote"
  :config
(setq denote-silo-extras-directories '("~/Documents/ProcrastinationTerminator/doc/design/" "~/work/lining/doc"))
;; Remember to check the doc strings of those variables.
(setq denote-directory (expand-file-name "~/Zettelkasten"))
(setq denote-known-keywords '("emacs" "philosophy" "politics" "economics"))
(setq denote-infer-keywords t)
(setq denote-sort-keywords t)
(setq denote-file-type nil) ; Org is the default, set others here
(setq denote-prompts '(title keywords))

;; We allow multi-word keywords by default.  The author's personal
;; preference is for single-word keywords for a more rigid workflow.
;; (setq denote-allow-multi-word-keywords t)

(setq denote-date-format nil) ; read doc string

(defvar my-denote-silo-directories
  `("~/Documents/ProcrastinationTerminator/doc/design/"
    ;; You don't actually need to include the `denote-directory' here
    ;; if you use the regular commands in their global context.  I am
    ;; including it for completeness.
    ;; ,denote-directory
    )
  "List of file paths pointing to my Denote silos.
  This is a list of strings.")

(defvar my-denote-commands-for-silos
  '(
    denote-insert-link
    org-open-at-point
    )
  "List of Denote commands to call after selecting a silo.
  This is a list of symbols that specify the note-creating
  interactive functions that Denote provides.")

(defun my-denote-pick-silo-then-command (silo command)
  "Select SILO and run Denote COMMAND in it.
  SILO is a file path from `my-denote-silo-directories', while
  COMMAND is one among `my-denote-commands-for-silos'."
  (interactive
   (list (completing-read "Select a silo: " my-denote-silo-directories nil t)
         (intern (completing-read
                  "Run command in silo: "
                  my-denote-commands-for-silos nil t))))
  (let ((denote-directory silo))
    (call-interactively command)))

;; ;; You will not need to `require' all those individually once the
;; ;; package is available.
;; (require 'denote-retrieve)
;; (require 'denote-link)

;; ;; By default, we fontify backlinks in their bespoke buffer.
;; (setq denote-link-fontify-backlinks t)

;; ;; Also see `denote-link-backlinks-display-buffer-action' which is a bit
;; ;; advanced.

;; ;; If you use Markdown or plain text files (Org renders links as buttons
;; ;; right away)
;; (add-hook 'find-file-hook #'denote-link-buttonize-buffer)

;; (require 'denote-dired)
;; (setq denote-dired-rename-expert nil)

;; ;; We use different ways to specify a path for demo purposes.
;; (setq denote-dired-directories
;;       (list denote-directory
;;             (thread-last denote-directory (expand-file-name "attachments"))
;;             (expand-file-name "~/Documents/books")))

;; ;; Generic (great if you rename files Denote-style in lots of places):
;; ;; (add-hook 'dired-mode-hook #'denote-dired-mode)
;; ;;
;; ;; OR if only want it in `denote-dired-directories':
;; (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)

;; ;; Here is a custom, user-level command from one of the examples we
;; ;; showed in this manual.  We define it here and add it to a key binding
;; ;; below.
;; (defun my-denote-journal ()
;;   "Create an entry tagged 'journal', while prompting for a title."
;;   (interactive)
;;   (denote
;;    (denote--title-prompt)
;;    '("journal")))

;; ;; Denote DOES NOT define any key bindings.  This is for the user to
;; ;; decide.  For example:
;; (let ((map global-map))
;;   (define-key map (kbd "C-c n j") #'my-denote-journal) ; our custom command
;;   (define-key map (kbd "C-c n n") #'denote)
;;   (define-key map (kbd "C-c n N") #'denote-type)
;;   (define-key map (kbd "C-c n d") #'denote-date)
;;   (define-key map (kbd "C-c n s") #'denote-subdirectory)
;;   ;; If you intend to use Denote with a variety of file types, it is
;;   ;; easier to bind the link-related commands to the `global-map', as
;;   ;; shown here.  Otherwise follow the same pattern for `org-mode-map',
;;   ;; `markdown-mode-map', and/or `text-mode-map'.
;;   (define-key map (kbd "C-c n i") #'denote-link) ; "insert" mnemonic
;;   (define-key map (kbd "C-c n I") #'denote-link-add-links)
;;   (define-key map (kbd "C-c n l") #'denote-link-find-file) ; "list" links
;;   (define-key map (kbd "C-c n b") #'denote-link-backlinks)
;;   ;; Note that `denote-dired-rename-file' can work from any context, not
;;   ;; just Dired bufffers.  That is why we bind it here to the
;;   ;; `global-map'.
;;   (define-key map (kbd "C-c n r") #'denote-dired-rename-file)
;;   (define-key map (kbd "C-c n R") #'denote-dired-rename-file-and-add-front-matter))

;; ;; Key bindings specifically for Dired.
;; (let ((map dired-mode-map))
;;   (define-key map (kbd "C-c C-d C-i") #'denote-link-dired-marked-notes)
;;   (define-key map (kbd "C-c C-d C-r") #'denote-dired-rename-marked-files)
;;   (define-key map (kbd "C-c C-d C-R") #'denote-dired-rename-marked-files-and-add-front-matters))


  )
(require 'denote-silo-extras)

(with-eval-after-load 'org-capture
  (require 'denote-org-capture)
  (setq denote-org-capture-specifiers "%l\n%i\n%?")
  (add-to-list 'org-capture-templates
               '("n" "New note (with denote.el)" plain
                 (file denote-last-path)
                 #'denote-org-capture
                 :no-save t
                 :immediate-finish nil
                 :kill-buffer t
                 :jump-to-captured t)))

(use-package consult-notes
  :ensure nil
  :demand t
  :load-path "~/.emacs.d/site-lisp/consult-notes"
  :commands (consult-notes
             consult-notes-search-in-all-notes)
  :config
  (setq consult-notes-file-dir-sources
        '(
          ;; ("denote"             ?n "~/Zettelkasten")
        ("Org Refile"      ?w "~/work")))
  ;; Set org-roam integration, denote integration, or org-heading integration e.g.:
  ;; (setq consult-notes-org-headings-files '("~/path/to/file1.org"
  ;;                                          "~/path/to/file2.org"))
  ;; (consult-notes-org-headings-mode)
  (when (locate-library "denote")
    (consult-notes-denote-mode)))

;; (use-package org-super-links
;;   :demand t
;;   :ensure nil
;;   :load-path "~/.emacs.d/site-lisp/org-super-links"
;;   :bind (("C-c s s" . org-super-links-link)
;;          ("C-c s l" . org-super-links-store-link)
;;          ("C-c s C-l" . org-super-links-insert-link)))

(provide 'init-denote)
;;; init-denote.el ends here
