(provide 'my_paths)

(setq load-path (append (list (expand-file-name "~/.emacs.d/")) load-path))

(add-to-list 'load-path "~/.emacs.d/bm")
(add-to-list 'load-path "~/.emacs.d/yaml-mode") ;; check path

(add-to-list 'load-path "~/.emacs.d/ESS") ;; check path

(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el") ;; check path
(setq load-path (append (list (expand-file-name "~/.emacs.d/js2-mode/")) load-path))

