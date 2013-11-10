(require 'tls)
(require 'erc)

(require 'yaml-mode)
(require 'uniquify)
(require 'ido)
(require 'saveplace)
(require 'multiple-cursors)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; visible bookmarks git://github.com/joodland/bm.git
(require 'bm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; for R
(load "~/.emacs.d/ESS/lisp/ess-site")
(require 'ess-site)

(require 'uniquify)

(load "~/.emacs.d/camelCase-mode.el")
(require 'camelCase)

(load "~/.emacs.d/autopair/autopair.el")
(require 'autopair)

;; (require 'git)

(load "~/src/git/contrib/emacs/git.el")
(load "~/src/git/contrib/emacs/git-blame.el")
(require 'git)

(require 'magit)

(require 'line-num)


(require 'python)
(require 'go-mode)

(require 'my_flymake)

(require 'my_go)

(require 'my_python)

(require 'my_ess)

(require 'my_macros)

(require 'my_js2)



(load "~/.emacs.d/rust-mode.el")
(require 'rust-mode)

(if
    (equal MY_ENVIRONMENT "work")
    (require 'my_work))

(provide 'my_reqs)
