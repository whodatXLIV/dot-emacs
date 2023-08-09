;;; which-keys.el --- customize which-keys

;;; Commentary:
;; which keys is a package that helps remember key commands

(require-package 'which-key)
(which-key-mode)


;; open on right side then on bottom
(which-key-setup-side-window-right-bottom)

;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-show-early-on-C-h t)
;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.
(setq which-key-idle-delay 10000)
(setq which-key-idle-secondary-delay 0.05)

(provide 'which-keys)

;;; which-keys.el ends here
