

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Python
(add-to-list 'load-path "~/.emacs.d/flymake-python")

; python macros
(fset 'line-to-kill-ring
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("" 0 "%d")) arg)))

(fset 'comment-line-python
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 32 backspace 1 67108896 5 134217848 99 111 109 109 tab 101 110 tab 114 101 tab return] 0 "%d")) arg)))

(fset 'uncomment-line-python
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 67108896 5 134217848 117 110 99 111 109 109 101 110 116 45 114 101 103 105 111 110 return] 0 "%d")) arg)))

(fset 'ig-py-raise-Exception
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("raise Exception()" 0 "%d")) arg)))

(fset 'ig-py-comment-object
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([34 34 34 tab return tab 34 34 34 up return tab] 0 "%d")) arg)))

(fset 'ig-python-main-statement
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([105 102 32 95 95 110 97 109 101 95 95 32 61 61 32 39 95 95 109 97 105 110 95 95 39 58 return tab] 0 "%d")) arg)))

(fset 'ig-py-TODO
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("TODO: - " 0 "%d")) arg)))

(fset 'ig-py-debug-line
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([tab 112 114 105 110 116 32 34 21 52 48 35 34 13 tab] 0 "%d")) arg)))

(fset 'ig-py-copy-line-paste-below
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\353
\355" 0 "%d")) arg)))

;;; created with autopair mode
(fset 'ig-python-print-var
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("Qprint(\": %s % " 0 "%d")) arg)))

(fset 'ig-py-set-trace
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("import pdb; pdb.set_trace()" 0 "%d")) arg)))

(define-key python-mode-map "\M-k" 'line-to-kill-ring)
(define-key python-mode-map "\C-h" 'comment-line-python)
(define-key python-mode-map "\C-j" 'uncomment-line-python)
(define-key python-mode-map "\M-r" 'replace-string)

(define-key python-mode-map (kbd "C-c b") 'ig-py-set-trace)
(define-key python-mode-map (kbd "C-S-f") 'ig-py-raise-Exception)
(define-key python-mode-map (kbd "C-c q") 'ig-py-comment-object)
(define-key python-mode-map (kbd "C-c C-p") 'ig-python-print-var)
(define-key python-mode-map (kbd "C-c t") 'ig-py-TODO)
(define-key python-mode-map (kbd "C-c d") 'ig-py-debug-line)

;; convenience macros
(define-key python-mode-map (kbd "C-c l") 'ig-py-copy-line-paste-below)
(define-key python-mode-map (kbd "C-c C-l") 'ig-py-comment-copy-line)

;;;; Hooks
(add-hook 'python-mode-hook
	  (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(add-hook 'python-mode-hook
	  (lambda () (camelCase-mode 1)))

(add-hook 'python-mode-hook
	  (lambda () (flymake-mode)))

(add-hook 'python-mode-hook
	  (lambda () (linum-mode)))

(add-hook 'go-mode-hook
          (lambda () (autopair-mode)))

(add-hook 'go-mode-hook
          (lambda () (show-paren-mode)))

(add-hook 'python-mode-hook
	  (lambda () (setq-default indent-tabs-mode nil)))

(setq python-check-command "/Library/Frameworks/Python.framework/Versions/2.7/bin/pyflakes")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flymake mode
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "/Library/Frameworks/Python.framework/Versions/2.7/bin/pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pyflakes-init)))

(provide 'my_python)
