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
    ((eq major-mode 'eshell-mode)
     "Eshell"
     )
    ((eq major-mode 'go-mode)
     "Go"
     )
    ((eq major-mode 'org-mode)
     "Org"
     )
    ((eq major-mode 'python-mode)
     "Python"
     )
    ((string-equal "*ein:" (substring (buffer-name) 0 5))
     "Python"
     )
    ((string-equal "*Pyth" (substring (buffer-name) 0 5))
     "Python"
     )
    ((eq major-mode 'php-mode)
     "PHP"
     )
    ((eq major-mode 'csv-mode)
     "CSV"
     )
    ((string-equal "*PHP*" (substring (buffer-name) 0 5))
     "PHP"
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


(defun tabbar-move-current-tab-one-place-left ()
  "Move current tab one place left, unless it's already the leftmost."
  (interactive)
  (let* ((bufset (tabbar-current-tabset t))
         (old-bufs (tabbar-tabs bufset))
         (first-buf (car old-bufs))
         (new-bufs (list)))
    (if (string= (buffer-name) (format "%s" (car first-buf)))
        old-bufs ; the current tab is the leftmost
      (setq not-yet-this-buf first-buf)
      (setq old-bufs (cdr old-bufs))
      (while (and
              old-bufs
              (not (string= (buffer-name) (format "%s" (car (car old-bufs))))))
        (push not-yet-this-buf new-bufs)
        (setq not-yet-this-buf (car old-bufs))
        (setq old-bufs (cdr old-bufs)))
      (if old-bufs ; if this is false, then the current tab's buffer name is mysteriously missing
          (progn
            (push (car old-bufs) new-bufs) ; this is the tab that was to be moved
            (push not-yet-this-buf new-bufs)
            (setq new-bufs (reverse new-bufs))
            (setq new-bufs (append new-bufs (cdr old-bufs))))
        (error "Error: current buffer's name was not found in Tabbar's buffer list."))
      (set bufset new-bufs)
      (tabbar-set-template bufset nil)
      (tabbar-display-update))))

(defun tabbar-move-current-tab-one-place-right ()
  "Move current tab one place right, unless it's already the rightmost."
  (interactive)
  (let* ((bufset (tabbar-current-tabset t))
         (old-bufs (tabbar-tabs bufset))
         (first-buf (car old-bufs))
         (new-bufs (list)))
    (while (and
            old-bufs
            (not (string= (buffer-name) (format "%s" (car (car old-bufs))))))
      (push (car old-bufs) new-bufs)
      (setq old-bufs (cdr old-bufs)))
    (if old-bufs ; if this is false, then the current tab's buffer name is mysteriously missing
        (progn
          (setq the-buffer (car old-bufs))
          (setq old-bufs (cdr old-bufs))
          (if old-bufs ; if this is false, then the current tab is the rightmost
              (push (car old-bufs) new-bufs))
          (push the-buffer new-bufs)) ; this is the tab that was to be moved
      (error "Error: current buffer's name was not found in Tabbar's buffer list."))
    (setq new-bufs (reverse new-bufs))
    (setq new-bufs (append new-bufs (cdr old-bufs)))
    (set bufset new-bufs)
    (tabbar-set-template bufset nil)
    (tabbar-display-update)))

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(setq tabbar-use-images nil)

(global-set-key (kbd "C-x <up>") 'tabbar-press-home)
(global-set-key (kbd "C-x <left>") 'tabbar-backward-tab)
(global-set-key (kbd "C-x <right>") 'tabbar-forward-tab)
(global-set-key (kbd "C-x <down>") 'tabbar-press-scroll-right)
;; Key sequences "C-S-PgUp" and "C-S-PgDn" move the current tab to the left and to the right.
(global-set-key (kbd "C-S-<left>") 'tabbar-move-current-tab-one-place-left)
(global-set-key (kbd "C-S-<right>") 'tabbar-move-current-tab-one-place-right)

(provide 'config-tabbar)
;;; config-tabbar.el ends here
