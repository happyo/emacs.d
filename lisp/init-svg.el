;;; init-svg.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package svg-lib
  :demand t
  :ensure nil
  :load-path "~/.emacs.d/site-lisp/svg-lib"
  )

;; (use-package tab-bar
;;   :ensure nil
;;   :after svg-lib
;;   :config
;;   (setq tab-bar-new-button-show nil)
;;   (setq tab-bar-close-button-show nil)
;;   (setq tab-bar-tab-hints t)
;;   (customize-set-variable 'tab-bar-select-tab-modifiers '(meta))
;;   (tab-bar-mode 1))

;; 自定义 tab-bar 的标签格式函数
(defun happyo/tab-bar-tab-name-with-svg (tab i)
  "格式化 tab 名称，使用 svg-tag-mode 进行渲染."
  (let* ((current-p (eq (car tab) 'current-tab))  ;; 判断当前 tab 是否被选中
         (tab-name (alist-get 'name tab))         ;; 获取 tab 名称
         (name (concat (if tab-bar-tab-hints (format "%d " i) "") tab-name))
         ;; 设置选中与未选中状态的不同 font-weight 和前景色
         (foreground-color (if current-p "#FFFFFF" "#7F7F7F"))  ;; 选中时白色，未选中时灰色
         (font-weight (if current-p 'bold 'normal))  ;; 选中时加粗，未选中时正常
         ;; 生成 SVG 标签：使用不同 face 区分选中和未选中的 tab
         (svg-tag (svg-lib-tag
                   name
                   nil
                   :font-size 15
                   :height 1.3
                   :foreground "#FFFFFF"  ;; 动态设置前景色
                   :background (if current-p "#B1A6FF" "#E0E0E0")  ;; 动态设置背景色
                   :font-weight font-weight  ;; 动态设置字体 weight
                   :radius 10
                   :padding 6
                   :margin 2
                   )))
    ;; 返回带有 display 属性的标签，确保 SVG 正确显示
    (propertize " " 'display svg-tag)))

;; 将自定义的格式化函数应用于 tab-bar
(setq tab-bar-tab-name-format-function 'happyo/tab-bar-tab-name-with-svg)

(provide 'init-svg)
;;; init-svg.el ends here
