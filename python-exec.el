(defun eval-python-on-current-buffer ()
  ((save-buffer)
   (call-process "python" (buffer-file-name))))
;(global-set-key (kbd "M-g p") 'eval-python-on-current-buffer)
(setq-default python-indent 2)
(provide 'python-exec)