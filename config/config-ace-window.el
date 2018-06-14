;;; package --- ace window configuration

;;; Commentary:

;;; Code:
(require-package 'ace-window)

(global-set-key (kbd "C-c C-SPC") 'ace-window)
(setq aw-dispatch-always t)

(provide 'config-ace-window)
;;; config-ace-window.el ends here
