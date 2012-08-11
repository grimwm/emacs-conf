(setq grep-command "egrep -nH -e ")
(defun my-find-grep-builder ()
  (concat "find " (car (cdr (split-string (pwd) "^Directory "))) " -type f -follow -print0 | xargs -0 -e " grep-command))
