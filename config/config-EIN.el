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

;; (require 'ein)
;; (require 'ein-loaddefs)
;; (require 'ein-notebook)
;; (require 'ein-subpackages)

(setq ein:jupyter-server-args (list "--no-browser"))
;;(setq ein:use-auto-complete-superpack t)
;; (add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
(setq-default ein:completion-backend 'ein:use-ac-jedi-backend)
(global-set-key (kbd "C-c C-j") 'ein:jupyter-server-start)


(provide 'config-ein)
;;; config-EIN.el ends here
