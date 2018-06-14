;;; package --- ace mc configuration

;;; Commentary:

;;; Code:
(require-package 'ace-mc)

(global-set-key (kbd "C-> SPC") 'ace-mc-add-multiple-cursors) 
;; (global-set-key (kbd "C-> ") 'ace-mc-add-single-cursor) 

(provide 'config-ace-mc)
;;; config-ace-jump-mode.el ends here
