;;; config-yas.el --- configure yassnippe

;;; Commentary:
;; this should configure and set paths for snippets

(require-package 'yasnippet)

(require-package 'ivy-yasnippet)

(require-package 'yasnippet-snippets)

(yas-global-mode 1)

(global-set-key (kbd "H-,") 'ivy-yasnippet)


(provide 'config-yas)

;;; config-yas.el ends here
