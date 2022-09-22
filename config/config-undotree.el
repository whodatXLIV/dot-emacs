(require-package 'undo-tree)
(global-undo-tree-mode)
  
(provide 'config-undotree)

(setq undo-tree-history-directory-alist `(("." . "~/.emacs.d/.saves")))
