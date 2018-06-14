;;; package --- ace window configuration

;;; Commentary:

;;; Code:
(require-package 'ace-window)

(global-set-key (kbd "C-c C-SPC") 'ace-window)
(setq aw-dispatch-always t)

(defvar aw-dispatch-alist
  '((?d aw-delete-window "Delete Window")
	(?s aw-swap-window "Swap Windows")
	(?m aw-move-window "Move Window")
	(?b aw-switch-buffer-in-window "Select Buffer")
	(?n aw-flip-window)
	(?B aw-switch-buffer-other-window "Switch Buffer Other Window")
	(?c aw-split-window-fair "Split Fair Window")
	(?h aw-split-window-vert "Split Vert Window")
	(?v aw-split-window-horz "Split Horz Window")
	(?o delete-other-windows "Delete Other Windows")
	(?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.")

(provide 'config-ace-window)
;;; config-ace-window.el ends here
