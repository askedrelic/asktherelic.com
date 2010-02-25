;;; add load path for orgmode
;;;    and intialize code and prehandling routine
(setq load-path (cons "~/path/to/orgdir/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\.org$" . org-mode))
