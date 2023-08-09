;;; package --- undotree configuration

;;; Commentary:

;;; Code:

(require-package 'undo-tree)
(global-undo-tree-mode)
  
(provide 'config-undotree)

(setq undo-tree-history-directory-alist `(("." . "~/.emacs.d/.saves")))
;; (setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq
   backup-by-copying t      ; don't clobber symlinks 
   backup-directory-alist
    '(("." . "~/.emacs.d/.saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 2
   kept-old-versions 6
   version-control t)       ; use versioned backups
;; (require 'backup-dir)
;; (add-to-list 'bkup-backup-directory-info
;;              (list "." "~/.emacs.d/.saves/" 'full-path))
;; (setq tramp-bkup-backup-directory-info bkup-backup-directory-info)

(setq undo-tree-enable-undo-in-region t)


(provide 'config-undotree)
;;; config-undotree.el ends here
