
;; my_paths.el
(setq load-path (append (list (expand-file-name "~/.emacs.d/")) load-path))

(add-to-list 'load-path "~/.emacs.d/bm")
(add-to-list 'load-path "~/.emacs.d/yaml-mode") ;; check path

(add-to-list 'load-path "~/.emacs.d/ESS") ;; check path

(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el") ;; check path
(setq load-path (append (list (expand-file-name "~/.emacs.d/js2-mode/")) load-path))

(add-to-list 'load-path "~/.emacs.d/cl-lib")
(add-to-list 'load-path "~/.emacs.d/git-modes")
(add-to-list 'load-path "~/.emacs.d/magit")

;;;; my mode files
(add-to-list 'load-path "~/.emacs.d/my_modes")



(provide 'my_paths)
