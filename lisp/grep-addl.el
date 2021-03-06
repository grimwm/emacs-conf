(if (functionp 'grep-compute-defaults) (grep-compute-defaults))
(defun my-find-grep-builder ()
  (concat "find " (car (cdr (split-string (pwd) "^Directory "))) " -type f -follow -print0 | xargs -0 -e " grep-command))
(grep-apply-setting 'grep-command "egrep -nH -e ")
(grep-apply-setting 'grep-find-command (my-find-grep-builder))
