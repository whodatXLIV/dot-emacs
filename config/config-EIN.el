;;; package --- EIN configuration

;;; Commentary:

;;; Code:

;; pip install tornado
(require-package 'ein)
(require-package 'websocket)
(require-package 'request)
(require-package 'dash)
(require-package 's)
(require-package 'skewer-mode)

(setq ein:jupyter-server-args (list "--no-browser"))

(global-set-key (kbd "C-c C-j") 'ein:jupyter-server-start)

(provide 'config-ein)
;;; config-EIN.el ends here
