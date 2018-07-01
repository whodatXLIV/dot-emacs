;;; package --- tabbar configuration

;;; Commentary:

;;; Code:

(require-package 'tabbar)

(tabbar-mode t)

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    ((eq major-mode 'go-mode)
     "Go"
     )
    ((eq major-mode 'python-mode)
     "Python"
     )
    ((string-equal "*ein:" (substring (buffer-name) 0 5))
     "Python"
     )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((string-equal "magit:" (substring (buffer-name) 0 6))
     "Magit"
     )
    (t
     "Misc"
     )
    )))


(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

;; (setq tabbar-use-images nil)

(global-set-key (kbd "C-x <up>") 'tabbar-press-home)
(global-set-key (kbd "C-x <left>") 'tabbar-backward-tab)
(global-set-key (kbd "C-x <right>") 'tabbar-forward-tab)
(global-set-key (kbd "C-x <down>") 'tabbar-press-scroll-right)

(provide 'config-tabbar)
;;; config-tabbar.el ends here
