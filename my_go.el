(provide 'my_go)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GO MODE

(require 'go-mode)

;; hooks
(add-hook 'go-mode-hook
	  (lambda () (setq-default indent-tabs-mode nil)))
(add-hook 'go-mode-hook
	  (lambda () (camelCase-mode 1)))
(add-hook 'go-mode-hook 'linum-mode)
(add-hook 'go-mode-hook
	  (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'go-mode-hook
	  (lambda () (setq tab-width 4)))
(add-hook 'go-mode-hook
          (lambda () (autopair-mode)))
(add-hook 'go-mode-hook
          (lambda () (show-paren-mode)))

(fset 'ig-go-Println
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 81 1 11 return 102 109 116 46 80 114 105 110 116 108 110 40 34 34 41 2 2 25 6] 0 "%d")) arg)))

(fset 'ig-go-Println-var
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 81 1 11 return 102 109 116 46 80 114 105 110 116 108 110 40 34 25 34 44 32 25 41] 0 "%d")) arg)))

;; macros
(fset 'ig-golang-simple-for-loop
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([tab 102 111 114 32 24 81 1 11 return 25 32 58 61 32 48 59 32 25 32 60 32 24 81 return 59 32 25 43 43 32 123 13 13 125 16 tab] 0 "%d")) arg)))

(fset 'ig-golang-range-for-loop
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([tab 102 111 114 32 24 81 return 44 32 24 81 return 32 58 61 32 114 97 110 103 101 32 24 81 return 32 123 13 125 16 5 13 tab] 0 "%d")) arg)))

(fset 'ig-go-func-search
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 81 1 11 return 134217788 134217747 102 117 110 99 46 42 25 5 12] 0 "%d")) arg)))

;; go-mode-map
(define-key go-mode-map "\M-k" 'line-to-kill-ring)
(define-key go-mode-map "\C-h" 'comment-line-python)  ; recycle Python macro
(define-key go-mode-map "\C-j" 'uncomment-line-python)  ; recycle Python macro
(define-key go-mode-map "\M-r" 'replace-string)
(define-key go-mode-map (kbd "C-c l") 'ig-py-copy-line-paste-below)
(define-key go-mode-map (kbd "C-c C-l") 'ig-golang-simple-for-loop)
(define-key go-mode-map (kbd "C-c C-r") 'ig-golang-range-for-loop)
(define-key go-mode-map (kbd "C-c t") 'ig-py-TODO)  ; recycle Python macro
(define-key go-mode-map (kbd "C-c p") 'ig-go-Println)
(define-key go-mode-map (kbd "C-c C-p") 'ig-go-Println-var)
(define-key go-mode-map (kbd "C-c n") 'ig-go-func-search)


;; go-mode
