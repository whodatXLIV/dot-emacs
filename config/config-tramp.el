;;; package --- tramp configuration

;;; Commentary:

;;; Code:

(require-package 'tramp)

(defun connect-dev ()
  "CONNCECT TO DEV."
  (interactive)
  (dired "/scp:sfigueroa@dev.focusvq.com:"))


(provide 'config-tramp)
;;; config-tramp.el ends here
