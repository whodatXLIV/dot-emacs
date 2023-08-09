;;; package --- multiple cursors configuration

;;; Commentary:

;;; Code:
(after "multiple-cursors-autoloads"
  (global-set-key (kbd "H-<return> e") 'mc/edit-lines)
  (global-unset-key (kbd "C-c d"))
  (global-set-key (kbd "H-<return> m") 'mc/mark-more-like-this-extended)
  (global-set-key (kbd "H-<return> a") 'mc/mark-all-like-this)
  (global-set-key (kbd "H-<return> n") 'mc/insert-numbers); C-u N M-x, to insert numbers starting at N
  (global-set-key (kbd "H-<return> l") 'mc/insert-letters)
  (global-unset-key (kbd "M-<down-mouse-1>"))
  (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click))

(after 'multiple-cursors
    (define-key mc/keymap (kbd "C-'") 'mc-hide-unmatched-lines-mode))
;;; config-multiple-cursors.el ends here
