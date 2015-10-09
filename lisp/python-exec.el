(defun eval-python-on-current-buffer ()
  ((save-buffer)
   (call-process "python" (buffer-file-name))))
(setq-default py-indent-offset 2)
(setq-default python-indent 2)
(setq-default python-continuation-offset 2)

(provide 'python-exec)
