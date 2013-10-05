(provide 'my_work)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; for Dell large monitor
;; SCREEN MACRO
(fset 'ig-split-work-monitor-evenly-vertical
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 51 21 53 48 24 123 33554444 24 51 33554440 24 125 33554444 24 123 24 123 33554440 24 123 24 123 24 123 24 123 33554444 24 125 33554440 24 125 24 123 24 125 33554444] 0 "%d")) arg)))

(global-set-key (kbd "C-x 4") 'ig-split-work-monitor-evenly-vertical)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; executables; ie. markdown
(setq exec-path (append exec-path '("/Users/isaac/bin")))

