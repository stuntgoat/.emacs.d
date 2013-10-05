(provide 'my_js2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; JS2 MODE
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(fset 'ig-js2-comment-line
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("// " 0 "%d")) arg)))

(fset 'ig-js2-uncomment-line
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 117 110 99 111 109 109 tab 108 105 110 tab return] 0 "%d")) arg)))

(fset 'ig-js2-curly-complete
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([32 123 13 13 125 59 16 tab] 0 "%d")) arg)))

(defun ig-js2-mode-hook ()
(define-key js2-mode-map "\C-h" 'ig-js2-comment-line)
(define-key js2-mode-map "\C-j" 'ig-js2-uncomment-line)
(define-key js2-mode-map (kbd "C-{") 'ig-js2-curly-complete)
  (message "Isaac's js2-mode hook"))


(add-hook 'js2-mode-hook 'ig-js2-mode-hook)
(add-hook 'js2-mode-hook 'linum-mode)
(add-hook 'js2-mode-hook
	  (lambda () (camelCase-mode 1)))

(add-hook 'js2-mode-hook (lambda () (set-variable 'indent-tabs-mode t)))
