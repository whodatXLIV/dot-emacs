;;; package --- drag-stuff configuration

;;; Commentary:

;;; Code:

(require-package 'drag-stuff)
(drag-stuff-global-mode 1)


(global-set-key (kbd "<C-M-right>") 'drag-stuff-right)
(global-set-key (kbd "<C-M-left>") 'drag-stuff-left)
(global-set-key (kbd "<C-M-down>") 'drag-stuff-down)
(global-set-key (kbd "<C-M-up>") 'drag-stuff-up)

(provide 'config-drag-stuff)
;;; config-drag-stuff.el ends here
