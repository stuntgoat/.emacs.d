

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this allows us to define keyboard input during a macro
;; Pressing ‘C-x Q’ during macro definition will present you with a minibuffer
;; prompt (using recursive edit). Inserting some text and pressing RET will end
;; recursive edit and continue the definition of the macro in the minibuffer.
;; Pressing RET again will insert the entered text at point. If you don’t want
;; to insert the text right away you can instead kill the input at this point
;; (using ‘C-a C-k RET’) and use it later in the macro definition.
(defun my-macro-query (arg)
  "Prompt for input using minibuffer during kbd macro execution.
    With prefix argument, allows you to select what prompt string to use.
    If the input is non-empty, it is inserted at point."
  (interactive "P")
  (let* ((query (lambda () (kbd-macro-query t)))
         (prompt (if arg (read-from-minibuffer "PROMPT: ") "Input: "))
         (input (unwind-protect
                    (progn
                      (add-hook 'minibuffer-setup-hook query)
                      (read-from-minibuffer prompt))
                  (remove-hook 'minibuffer-setup-hook query))))
    (unless (string= "" input) (insert input))))

(global-set-key "\C-xQ" 'my-macro-query)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; swap single and double quotes
(fset 'ig-swap-quotes
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 110 110 134217842 39 return 68 79 85 S-backspace S-backspace S-backspace 83 73 78 71 76 69 36 return 24 104 134217842 34 return 68 79 85 66 76 69 83 S-backspace 36 return 24 104 134217842 68 79 85 66 76 69 36 return 39 return 24 104 134217842 83 73 78 71 76 69 36 return 34 return 24 110 119] 0 "%d")) arg)))

(global-set-key "\C-cS" 'ig-swap-quotes)


(fset 'ig-org-src-py
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("#+BEGIN_SRC python\344END" 0 "%d")) arg)))

(global-set-key "\C-cs" 'ig-org-src-py)

(provide 'my_macros)


