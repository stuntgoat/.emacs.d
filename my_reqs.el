(provide 'my_reqs)

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

(require 'line-num)
(require 'python)
(require 'go-mode)

(require 'my_flymake)
(require 'my_go)
(require 'my_python)
(require 'my_macros)
(require 'my_js2)

(if
    (equal MY_ENVIRONMENT "work")
    (require 'my_work))

