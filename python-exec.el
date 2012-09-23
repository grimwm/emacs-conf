(defun eval-python-on-current-buffer ()
  ((save-buffer)
   (call-process "python" (buffer-file-name))))

(add-hook 'python-mode-hook
	  (lambda ()
	    (setq python-indent 2)
	    (setq py-indent-offset 2)
	    (setq python-continuation-offset 2)
	    (local-set-key (kbd "M-g p") 'eval-python-on-current-buffer)))
;; (setq-default py-indent-offset 2)
;; (setq-default python-indent 2)
;; (setq-default python-continuation-offset 2)

(provide 'python-exec)
