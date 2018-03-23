;; GIT CONFIGURATION
;;--------------------------------------------------
(use-package magit
  :ensure t
  :init (global-set-key (kbd "C-x g") 'magit-status)
  (setenv "GIT_ASKPASS" "git-gui--askpass")
  )
