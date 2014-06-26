;; Setup CEDET, using the build for the appropriate OS.
;; 
;; More information can be found at
;; http://cedet.sourceforge.net/setup.shtml
(when (string= "gnu/linux" system-type)
  (load "cedet-1.1-linux/common/cedet.el")
  )

(when (boundp 'cedet-version)
  (global-ede-mode 1)                   ; Enable the Project management system.
  (semantic-load-enable-code-helpers)   ; Enable prototype help and smart completion.
  (global-srecode-minor-mode 1)         ; Enable template insertion menu.
  )
