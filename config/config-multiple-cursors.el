(after "multiple-cursors-autoloads"
  (global-set-key (kbd "C-> e") 'mc/edit-lines)
  (global-unset-key (kbd "C-c d"))
  (global-set-key (kbd "C-> m") 'mc/mark-more-like-this-extended)
  (global-set-key (kbd "C-> a") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-> n") 'mc/insert-numbers)
  (global-set-key (kbd "C-> l") 'mc/insert-letters)
  (global-unset-key (kbd "M-<down-mouse-1>"))
  (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click))

(after 'multiple-cursors
    (define-key mc/keymap (kbd "C-'") 'mc-hide-unmatched-lines-mode))
