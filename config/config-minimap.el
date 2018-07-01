;;; package --- minimap configuration

;;; Commentary:

;;; Code:

(require-package 'minimap)
(global-set-key (kbd "C-c m") 'minimap-mode)

(minimap-mode)
(setq minimap-window-location 'right)
(setq minimap-recenter-type 'middle)
(setq minimap-update-delay 0)
(setq minimap-always-recenter nil)
(set-face-attribute 'minimap-active-region-background nil :background "gray20")
(set-face-attribute 'minimap-font-face nil :height 45 :family "DejaVu Sans Mono")
(minimap-mode 'toggle)


(provide 'config-minimap)
;;; config-minimap.el ends here
