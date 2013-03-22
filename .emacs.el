(add-to-list 'load-path "~/.emacs.d")
(load "indent-all")
(load "python-exec")
(load "my-shell")
(load "php-mode")
(load "color-theme")
(load "hooks")
(load "grep-addl")
(load "js-setup")
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(color-theme-initialize)
;; (color-theme-gray30)
(color-theme-goldenrod)

(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . html-mode))
;(add-to-list 'warning-suppress-types '(undo discard-info))
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(global-set-key (kbd "S-<return>") 'newline)
(global-set-key (kbd "C-h a") 'apropos)
;; (global-set-key (kbd "C-c g") (lambda () (interactive) (grep-find))
;; (global-set-key (kbd "C-c g") 'grep-find)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c m") 'man)
(global-set-key (kbd "C-c s") (lambda () (interactive) (shell "*my-shell*") (rename-buffer "*shell*" t)))
(global-set-key (kbd "C-c a") (lambda () (interactive) (ansi-term (if explicit-shell-file-name explicit-shell-file-name (getenv "SHELL")))))
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)
(global-set-key  [(f1)]  (lambda () (interactive) (manual-entry (current-word))))

(transient-mark-mode t)
(column-number-mode t)
(global-font-lock-mode t)
(menu-bar-mode 0)
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(show-paren-mode t)
(if (display-graphic-p) (global-hl-line-mode 0))

(setq printer-name nil)
(setq comint-input-ignoredups t)
(setq comint-input-filter (function (lambda (str) (not (string-match "^\\(#\\|go\\|reset\\|\\s +$\\)" str)))))
(setq comint-password-prompt-regexp "\\(\\(\\[sudo\\] \\|[Oo]ld \\|[Nn]ew \\|'s \\|login \\|Kerberos \\|CVS \\|UNIX \\| SMB \\|[Ee]nter \\|^\\)[Pp]assword\\( (again)\\)?\\|pass phrase\\|Verify\\|\\(Enter\\|R\epeat\\|Bad\\) passphrase\\)\\(?:, try again\\)?\\(?: for [^:]+\\)?:\\s *\\'")

(setq kill-buffer-query-functions (remove 'process-kill-buffer-query-function kill-buffer-query-functions))
(setq mac-command-modifier 'alt
      mac-option-modifier 'meta)
(setq show-paren-style 'expression)
(setq delete-auto-save-files t)
(setq backup-directory-alist `(("." . ,(concat "/tmp/" (user-login-name)))))
(setq inhibit-splash-screen t)

(if (custom-facep 'show-paren-match) (progn
                                       (set-face-background 'show-paren-match nil)
                                       (set-face-foreground 'show-paren-match "yellow")
                                       (set-face-bold-p 'show-paren-match t)))

;(setq c-default-style
;      '((c-mode . "bsd") (c++-mode . "bsd")))

(eval-after-load "shell" '(user-login-name))
(defun my-shell-mode-hook ()
  (define-key shell-mode-map (kbd "C-l") '(recenter 0)))
(add-hook 'shell-mode-hook 'my-shell-mode-hook)

(defun my-c-mode-hook ()
  (setq compile-command "gmake -k "))
(add-hook 'c-mode-hook 'my-c-mode-hook)

(defun my-c++-mode-hook ()
  (setq compile-command "gmake -k "))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(defun my-java-mode-hook ()
  (setq compile-command "javac -Xlint "))
(add-hook 'java-mode-hook 'my-java-mode-hook)

(server-start)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(link ((((class color) (background light)) (:foreground "green" :underline t)))))
