(defun indent-all (mode)
  (mapc (lambda (buffer)
            (with-current-buffer buffer
              (when (eq mode major-mode)
                (indent-region (point-min)
                               (point-max)))))
          (buffer-list)))

(autoload 'indent-all "indent-all"
  "Indents all buffers with MODE using indent-region." 1 nil)
(provide 'indent-all)