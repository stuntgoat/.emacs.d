(provide 'my_flymake)

(defun my-flymake-err-at (pos)
  (let ((overlays (overlays-at pos)))
    (remove nil
            (mapcar (lambda (overlay)
                      (and (overlay-get overlay 'flymake-overlay)
                           (overlay-get overlay 'help-echo)))
                    overlays))))

(defun my-flymake-err-echo ()
  (message "%s" (mapconcat 'identity (my-flymake-err-at (point)) "\n")))

(defun my-flymake-show-next-error()
    (interactive)
    (flymake-goto-next-error)
    (my-flymake-err-echo)
    ;; (flymake-display-err-menu-for-current-line)
    )

(defun my-flymake-show-prev-error()
    (interactive)
    (flymake-goto-prev-error)
    (my-flymake-err-echo)
    ;; (flymake-display-err-menu-for-current-line)
    )

(defvar my-flymake-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\M-p" 'my-flymake-show-prev-error)
    (define-key map "\M-n" 'my-flymake-show-next-error)
    map)
  "Keymap for my flymake minor mode.")

;;(add-hook 'python-mode-hook 'my-flymake-minor-mode-map)

(define-minor-mode my-flymake-minor-mode
  "Simple minor mode which adds some key bindings for moving to the next and previous errors.
Key bindings:
\\{my-flymake-minor-mode-map}"
  nil
  ""
  :keymap 'my-flymake-minor-mode-map)

(add-hook 'python-mode-hook 'my-flymake-minor-mode)
