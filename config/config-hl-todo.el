;;; config-hl-todo.el --- highlight todo's 

;;; Commentary:
;; setup and highlight todos in comments

(require-package 'hl-todo)

(setq hl-todo-keyword-faces
      '(("TODO"   . "#934b9c")
        ("NOTE"  . "#1E90FF")
        ("HACK"  . "#CC6200")
        ("BUG"  . "#FF0000")
        ))

(global-set-key (kbd "H-t t") 'hl-todo-insert)
(global-set-key (kbd "H-t n") 'hl-todo-next)
(global-set-key (kbd "H-t p") 'hl-todo-previous)

(global-hl-todo-mode)


(provide 'config-hl-todo)

;;; config-hl-todo.el ends here
