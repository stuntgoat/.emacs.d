
(add-hook 'rust-mode-hook
	  (lambda () (camelCase-mode 1)))
(add-hook 'rust-mode-hook 'linum-mode)
(add-hook 'rust-mode-hook
	  (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'rust-mode-hook
	  (lambda () (setq tab-width 4)))
(add-hook 'rust-mode-hook
          (lambda () (autopair-mode)))
(add-hook 'rust-mode-hook
          (lambda () (show-paren-mode)))




(provide 'my_rust)
