;;; package --- magit configuration

;;; Commentary:

;;; Code:
(require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(setenv "GIT_ASKPASS" "git-gui--askpass")

(provide 'config-magit)
;;; config-magit.el ends here
