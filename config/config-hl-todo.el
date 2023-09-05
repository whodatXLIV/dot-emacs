;;; config-hl-todo.el --- highlight todo's 

;;; Commentary:
;; setup and highlight todos in comments

(require-package 'hl-todo)
(global-hl-todo-mode)

(setq hl-todo-keyword-faces
      '(("TODO"   . "#934b9c")
        ("NOTE"  . "#1E90FF")
        ("HACK"  . "#CC6200")
        ("BUG"  . "#FF0000")
        ))

(provide 'config-hl-todo)

;;; config-hl-todo.el ends here
