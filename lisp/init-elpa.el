;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
(require 'cl-lib)


;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(setq package-user-dir
      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                        user-emacs-directory))



;;; Standard package repositories

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; Official MELPA Mirror, in case necessary.
;;(add-to-list 'package-archives (cons "melpa-mirror" (concat proto "://www.mirrorservice.org/sites/melpa.org/packages/")) t)



;; Work-around for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
;; (when (and (version< emacs-version "26.3") (boundp 'libgnutls-version) (>= libgnutls-version 30604))
;;   (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))


;;; On-demand installation of packages

;; (defun require-package (package &optional min-version no-refresh)
;;   "Install given PACKAGE, optionally requiring MIN-VERSION.
;; If NO-REFRESH is non-nil, the available package lists will not be
;; re-downloaded in order to locate PACKAGE."
;;   (or (package-installed-p package min-version)
;;       (let* ((known (cdr (assoc package package-archive-contents)))
;;              (best (car (sort known (lambda (a b)
;;                                       (version-list-<= (package-desc-version b)
;;                                                        (package-desc-version a)))))))
;;         (if (and best (version-list-<= min-version (package-desc-version best)))
;;             (package-install best)
;;           (if no-refresh
;;               (error "No version of %s >= %S is available" package min-version)
;;             (package-refresh-contents)
;;             (require-package package min-version t)))
;;         (package-installed-p package min-version))))

;; (defun maybe-require-package (package &optional min-version no-refresh)
;;   "Try to install PACKAGE, and return non-nil if successful.
;; In the event of failure, return nil and print a warning message.
;; Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
;; available package lists will not be re-downloaded in order to
;; locate PACKAGE."
;;   (condition-case err
;;       (require-package package min-version no-refresh)
;;     (error
;;      (message "Couldn't install optional package `%s': %S" package err)
;;      nil)))


;;; Fire up package.el

;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))
;; (setq package-enable-at-startup nil)v
;; (package-initialize)


;; package.el updates the saved version of package-selected-packages correctly only
;; after custom-file has been loaded, which is a bug. We work around this by adding
;; the required packages to package-selected-packages after startup is complete.

;; (defvar sanityinc/required-packages nil)

;; (defun sanityinc/note-selected-package (oldfun package &rest args)
;;   "If OLDFUN reports PACKAGE was successfully installed, note that fact.
;; The package name is noted by adding it to
;; `sanityinc/required-packages'.  This function is used as an
;; advice for `require-package', to which ARGS are passed."
;;   (let ((available (apply oldfun package args)))
;;     (prog1
;;         available
;;       (when available
;;         (add-to-list 'sanityinc/required-packages package)))))

;; (advice-add 'require-package :around 'sanityinc/note-selected-package)

;; (when (fboundp 'package--save-selected-packages)
;;   (require-package 'seq)
;;   (add-hook 'after-init-hook
;;             (lambda ()
;;               (package--save-selected-packages
;;                (seq-uniq (append sanityinc/required-packages package-selected-packages))))))


;; (require-package 'fullframe)
;; (fullframe list-packages quit-window)

;; 
;; (let ((package-check-signature nil))
;;   (require-package 'gnu-elpa-keyring-update))

;; 
;; (defun sanityinc/set-tabulated-list-column-width (col-name width)
;;   "Set any column with name COL-NAME to the given WIDTH."
;;   (when (> width (length col-name))
;;     (cl-loop for column across tabulated-list-format
;;              when (string= col-name (car column))
;;              do (setf (elt column 1) width))))

;; (defun sanityinc/maybe-widen-package-menu-columns ()
;;   "Widen some columns of the package menu table to avoid truncation."
;;   (when (boundp 'tabulated-list-format)
;;     (sanityinc/set-tabulated-list-column-width "Version" 13)
;;     (let ((longest-archive-name (apply 'max (mapcar 'length (mapcar 'car package-archives)))))
;;       (sanityinc/set-tabulated-list-column-width "Archive" longest-archive-name))))

;; (add-hook 'package-menu-mode-hook 'sanityinc/maybe-widen-package-menu-columns)

;; A modern Packages Menu
(use-package paradox
  :init
  (setq paradox-execute-asynchronously t
        paradox-github-token t
        paradox-display-star-count nil)

  ;; Replace default `list-packages'
  (defun my-paradox-enable (&rest _)
    "Enable paradox, overriding the default package-menu."
    (paradox-enable))
  (advice-add #'list-packages :before #'my-paradox-enable)
  :config
  (when (fboundp 'page-break-lines-mode)
    (add-hook 'paradox-after-execute-functions
              (lambda (&rest _)
                (let ((buf (get-buffer-create "*Paradox Report*"))
                      (inhibit-read-only t))
                  (with-current-buffer buf
                    (page-break-lines-mode 1))))
              t)))

;; Auto update packages
(use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (defalias 'upgrade-packages #'auto-package-update-now))


(provide 'init-elpa)
;;; init-elpa.el ends here
