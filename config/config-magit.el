;;; package --- magit configuration

;;; Commentary:

;;; Code:
(require-package 'magit)

;; (require-package 'magit-todos)
;; (magit-todos-mode)
(global-set-key (kbd "C-x g") 'magit-status)
(setenv "GIT_ASKPASS" "git-gui--askpass")



(provide 'config-magit)
;;; config-magit.el ends here
