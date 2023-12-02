;;; config-popper.el --- Popup Buffers for Emacs

;;; Commentary:
;; Popper is a minor mode to manage buffers better as popups 

(require-package 'popper)
(global-set-key (kbd "s-;") 'popper-toggle)
(global-set-key (kbd "s-M-;") 'popper-cycle)
(global-set-key (kbd "s-C-;") 'popper-toggle-type)


(setq popper-reference-buffers
      '("\\*Messages\\*"
        "Output\\*$"
        "\\*Async Shell Command\\*"
        help-mode
        compilation-mode
        image-mode
        ))

;; Match eshell, shell, term and/or vterm buffers
(setq popper-reference-buffers
      (append popper-reference-buffers
              '("^\\*eshell.*\\*$" eshell-mode ;eshell as a popup
                "^\\*shell.*\\*$"  shell-mode  ;shell as a popup
                "^\\*term.*\\*$"   term-mode   ;term as a popup
                "^\\*vterm.*\\*$"  vterm-mode  ;vterm as a popup
                "^\\*jupyter-repl*\\*$" jupyter-repl-mode
                )))

(setq popper-group-function 'nil) ; projectile projects #'popper-group-by-projectile


(popper-mode)
(popper-echo-mode)                ; For echo area hints


(provide 'config-popper)

;;; config-popper.el ends here
