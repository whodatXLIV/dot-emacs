(require-package 'dired-sidebar)
(after "dired-sidebar-autoloads"
  (global-set-key (kbd "C-c d") 'dired-sidebar-toggle-sidebar)
  (setq dired-sidebar-should-follow-file t)
  (setq dired-sidebar-follow-file-idle-delay 0.2)
;;  (setq dired-sidebar-theme 'icons)
  (setq dired-sidebar-theme 'nerd)
  
;;  (require-package 'all-the-icons)
 ;; (require-package 'all-the-icons-dired)
 ;; (after "all-the-icons-dired"
  ;; (all-the-icons-dired-mode))
  )
