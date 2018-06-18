;;; package --- ace jump mode configuration

;;; Commentary:

;;; Code:
(require-package 'ace-jump-mode)

(define-key global-map (kbd "C-c j") 'ace-jump-mode)

(provide 'config-ace-jump-mode)
;;; config-ace-jump-mode.el ends here
