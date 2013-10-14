(add-hook 'ess-mode-hook
	  (lambda () (camelCase-mode 1)))
(add-hook 'ess-mode-hook 'linum-mode)
(add-hook 'ess-mode-hook
	  (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'ess-mode-hook
	  (lambda () (setq tab-width 4)))
(add-hook 'ess-mode-hook
          (lambda () (autopair-mode)))
(add-hook 'ess-mode-hook
          (lambda () (show-paren-mode)))


(define-key ess-mode-map (kbd "C-h") 'comment-line-python)

(define-key ess-mode-map (kbd "C-j") 'uncomment-line-python)

(provide 'my_ess)
