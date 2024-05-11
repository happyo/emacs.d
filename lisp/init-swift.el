;;; init-swift.el --- Apple languages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-elpa)

(require 'swift-mode)

(use-package cc-mode
    :ensure nil
    :config
  (setq c-basic-offset 4))
(add-to-list 'auto-mode-alist '("\\.m\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . objc-mode))

;; (use-package swift-mode)
(use-package objc-font-lock
  :ensure t
  :hook (objc-mode . objc-font-lock-mode))


(defun my-swift-mode-save-hook ()
  "在 Swift 模式文件保存时执行 'swift build'。"
  (when (eq major-mode 'swift-mode)  ; 确保我们处于 Swift 模式
    (let ((git-root (vc-git-root (buffer-file-name))))
      (when git-root
        (let ((default-directory git-root)) ; 设置 'swift build' 的执行目录
          (start-process "swift-build-process" "*swift build*" "swift" "build")
          (message "Executing 'swift build' at %s" git-root))))))

;; 将上面的函数挂载到 `after-save-hook`
(add-hook 'after-save-hook #'my-swift-mode-save-hook)

(defun run-xcode-project-sync ()
  "同步构建并在模拟器中运行 Xcode 项目。"
  (interactive)
  (let* ((project-root (locate-dominating-file (buffer-file-name) "ProcrastinationTerminator.xcodeproj"))
         (build-command "xcodebuild -project ProcrastinationTerminator.xcodeproj -scheme ProcrastinationTerminator -destination 'platform=iOS Simulator,name=iPhone 15 Pro' -configuration Debug")
         (app-path "/Users/belyenochi/Library/Developer/Xcode/DerivedData/ProcrastinationTerminator-gnieogblqecguzadkzzawivkyhwm/Build/Products/Debug-iphonesimulator/ProcrastinationTerminator.app")
         (bundle-id "com.belyenochi.ProcrastinationTerminator")
         (install-command (format "xcrun simctl install booted \"%s\"" app-path))
         (launch-command (format "xcrun simctl launch booted %s" bundle-id))
         (full-command (format "%s && %s && %s" build-command install-command launch-command)))
    (when project-root
      (let ((default-directory project-root))
        (shell-command full-command)
        (message "Xcode 项目在模拟器上构建、安装和启动完成。")))))


;; (defvar swift--treesit-settings
;;   (treesit-font-lock-rules
;;    :feature 'comment
;;    :language 'swift
;;    :override t
;;    '((prefix_expression
;;       target: (simple_identifier) @font-lock-variable-name-face
;;       operation: "." @font-lock-operator-face))

;;    ;; :feature 'string
;;    ;; :language 'swift
;;    ;; '((string) @font-lock-string-face)

;;    ;; :feature 'function-name
;;    ;; :language 'swift
;;    ;; '((function_declaration
;;    ;;    name: (identifier) @font-lock-function-name-face))

;;    ;; :feature 'class-name
;;    ;; :language 'swift
;;    ;; '((class_declaration
;;    ;;    name: (identifier) @font-lock-type-face))

;;    ;; 添加更多特性...
;;    ))

;; (define-derived-mode swift-ts-mode swift-mode "Swift"
;;   ;; 其他 Swift 模式设置...
;;   (when (treesit-ready-p 'swift) ; 确保 tree-sitter 支持 Swift
;;     (treesit-parser-create 'swift) ; 创建 Swift 的 tree-sitter 解析器
;;     (setq-local treesit-font-lock-settings swift--treesit-settings) ; 应用字体锁定设置
;;     (setq-local treesit-font-lock-feature-list
;;                 '(( comment ) ; 启用的特性
;;                   ;; 可以在这里添加更多特性
;;                   ))
;;     (treesit-major-mode-setup))) ; 设置 tree-sitter 主模式


(provide 'init-swift)
;;; init-swift.el ends here

