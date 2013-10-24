(load "~/.emacs.d/.environ")


;(setq MY_ENVIRONMENT "work")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load paths to load requires
(setq load-path (append (list (expand-file-name "~/.emacs.d/")) load-path))
(require 'my_paths)
(require 'my_reqs)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UNIQUE FILE NAMES IN BUFFER LIST
;; TODO: - show full path of each file in the status bar
(setq uniqueify-buffer-name-style 'reverse)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUZZY FIND FILE
(ido-mode t)
(setq ido-default-buffer-method 'selected-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(global-auto-revert-mode t)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; aspell
(setq-default ispell-program-name "/usr/local/bin/aspell")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; tramp
(setq tramp-debug-buffer t)
(setq shell-prompt-pattern "")
(setq tramp-default-method "ssh")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ansi-term colors
;;(setq term-default-bg-color nil)
(add-hook 'ansi-term-mode-hook
          (lambda ()
            (set-background-color "white")))

(add-hook 'ansi-term-mode-hook
          (lambda ()
            (setq term-default-fg-color "#AAAAAA")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; org-mode org mode
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
					; org-metaleft
	    (local-set-key  "\M-\S-l" 'org-metaright)
					; org-metaright
	    (local-set-key "\M-\S-h" 'org-metaleft)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; moving between windows
(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-k") 'windmove-up)
(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-l") 'windmove-right)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Yaml mode
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Multiple Cursors
; When you have an active region that spans multiple lines, the following will add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ux
(setq visible-bell t)

(setq font-lock-maximum-decoration t)
(display-time)
(defun night-screen ()
  (interactive)
  (set-cursor-color "#8fc92a")
  (set-foreground-color "#ffa500")
  (set-background-color "#2b2b2b"))

(defun daylight-screen ()
  (interactive)
  (set-cursor-color "black")
  (set-foreground-color "brown")
  (set-background-color "white"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; MARKDOWN MODE
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-command "/usr/local/bin/markdown")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; IDO MODE
(global-set-key (kbd "C-c C-d") 'ido-find-file)


;; (require 'git)

;(require 'flymake-cursor)
;; Overwrite flymake-display-warning so that no annoying dialog box is
;; used.

;; This version uses lwarn instead of message-box in the original version.
;; lwarn will open another window, and display the warning in there.
;; (defadvice flymake-display-warning (after stop-x-message (warning))
;;   "Display a warning to the user, using lwarn"
;;   (lwarn 'flymake :warning warning))

;; ;; Using lwarn might be kind of annoying on its own, popping up windows and
;; ;; what not. If you prefer to recieve the warnings in the mini-buffer, use:
;; (defadvice flymake-display-warning (after stop-x-warning (warning))
;;   "Display a warning to the user, using lwarn"
;;   (message warning))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-no-changes-timeout 0.5)
 '(ido-default-buffer-method (quote selected-window))
 '(ido-default-file-method (quote selected-window))
 '(ido-enable-flex-matching t)
 '(markdown-command "/usr/local/bin/markdown" t)
 '(python-indent-guess-indent-offset t)
 '(python-indent-offset 4)
 '(python-python-command "/Library/Frameworks/Python.framework/Versions/2.7/bin/python")
 '(scroll-conservatively 101)
 '(scroll-step 0)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2b2b2b" :foreground "#ffa500" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Courier_New"))))
 '(flymake-errline ((t (:background "red3" :foreground "Black"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "red3"))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "CadetBlue1")))))
