(setq my-shell-number 0)
(defun my-next-shell-number ()
  (setq my-shell-number (1+ my-shell-number)))
(defun my-next-shell-buffer ()
  (concat "*shell-" (number-to-string (my-next-shell-number)) "*"))
(provide 'my-shell)