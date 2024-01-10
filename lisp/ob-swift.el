(require 'ob)

(defgroup ob-swift nil
  "Org Mode blocks for Swift."
  :prefix "ob-swift-"
  :group 'org)

(defvar swift-mode:repl-executable "swift repl")

(defcustom ob-swift-executable swift-mode:repl-executable
  "Swift REPL executable for ob-swift."
  :type 'string
  :safe #'stringp
  :group 'ob-swift)

(defcustom ob-swift-default-session "*swift*"
  "Specify ob-swift session name."
  :type 'string
  :safe #'stringp
  :group 'ob-swift)

(defvar ob-swift-process-output "")

(defvar ob-swift-eoe "print(\"my-custom-swift-eoe\")")

(defun org-babel-execute:swift (body params)
  (let ((session (cdr (assoc :session params))))
    (if (string= "none" session)
        (ob-swift--eval body)
      (ob-swift--eval-in-repl session body))))

(defun ob-swift--eval (body)
  (with-temp-buffer
    (insert body)
    (shell-command-on-region (point-min) (point-max) ob-swift-executable nil 't)
    (buffer-string)))

(defun buffer-name-by-session-name (session-name)
  "Return the buffer name formatted for a given session name for run-swift."
  (format "*Swift REPL [swift repl -D %s]*" session-name))

(defun ob-swift--initiate-session (session)
  (unless (fboundp 'run-swift-with-name)
    (error "`run-swift-with-name' not defined, ensure the definition is loaded"))
  (save-window-excursion
    (let ((name (or session ob-swift-default-session))
          (buffer-name (buffer-name-by-session-name (or session ob-swift-default-session))))
      ;; 添加日志，显示会话名称
      (unless (and (get-buffer-process buffer-name)
                   (process-live-p (get-buffer-process buffer-name)))
        ;; 使用 run-swift-with-name 创建特定会话的 Swift REPL
        (run-swift-with-name name))
      ;; 打印消息以确认函数执行
      (get-buffer buffer-name))))


(defun run-swift-with-name (session-name)
  "Run Swift REPL with a specific session name."
  (interactive "sEnter session name: ")
  (let* ((cmd (if (listp swift-mode:repl-executable)
                  (append swift-mode:repl-executable (list (concat "-D " session-name)))
                  (concat swift-mode:repl-executable " -D " session-name))))
    (run-swift cmd nil t)))

(defun ob-swift--eval-in-repl (session body)
  (let* ((full-body (org-babel-expand-body:generic body params))
         (lines (split-string full-body "\n"))
         (session (ob-swift--initiate-session session))
         (start-point (with-current-buffer (get-buffer session) (point-max))))
    (org-babel-comint-in-buffer session
      ;; 逐行发送代码
      (dolist (line lines)
        (comint-send-string session (concat line "\n")))
      ;; 发送结束标记
      (comint-send-string session (concat ob-swift-eoe "\n"))
      ;; 等待输出
      (let ((end-of-output-reached nil))
        (while (not end-of-output-reached)
          (accept-process-output (get-buffer-process session) 1)
          (with-current-buffer (get-buffer session)
            (goto-char start-point)
            (setq end-of-output-reached (re-search-forward (regexp-quote "my-custom-swift-eoe\n") nil t))))
        (message "REPL processing completed."))
      ;; 捕获输出
      (let ((output (ob-swift--capture-output session full-body start-point)))
        (message "Captured result: %s" output)
        output))))


(defun ob-swift--capture-output (session full-body start-point)
  (let ((repl-buffer (get-buffer session))
        (eoe-marker ob-swift-eoe))
    (with-current-buffer repl-buffer
      (goto-char start-point)  ; 从记录的开始点开始搜索
      (if (re-search-forward (regexp-quote eoe-marker) nil t)
          (progn
            (forward-line 1)
            (let ((start (point)))
              (goto-char (point-max))
              (let ((output (buffer-substring-no-properties start (point))))
                ;; 清理输出
                (setq output (replace-regexp-in-string "^\\([0-9]+[>.] \\)+" "" output))
                (setq output (replace-regexp-in-string "^\\([0-9]+\\. \\)+\\([0-9]+> \\)*" "" output))
                (setq output (replace-regexp-in-string "my-custom-swift-eoe\n" "" output))
                output)))
        (message "eoe-marker not found")))))


(provide 'ob-swift)
;;; ob-swift.el ends here
