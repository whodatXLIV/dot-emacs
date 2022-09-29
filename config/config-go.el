;;; package --- go-mode configuration

;;; Commentary:

;;; Code:
(require-package 'go-mode)
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'company)
;; (require-package 'eglot)
(require-package 'project)
;; (require-package 'yasnippet)
(/boot/lazy-major-mode "\\.go$" go-mode)

(after 'go-mode

  ;; EGLOT
  ;; (defun project-find-go-module (dir)
  ;;   (when-let ((root (locate-dominating-file dir "go.mod")))
  ;;     (cons 'go-module root)))

  ;; (add-hook 'project-find-functions #'project-find-go-module)

  ;; (cl-defmethod project-root ((project (head go-module)))
  ;;   (cdr project))


  ;; (defun eglot-format-buffer-on-save ()
  ;;   (add-hook 'before-save-hook #'eglot-format-buffer -10 t))
  ;; (add-hook 'go-mode-hook #'eglot-format-buffer-on-save)

  ;; (add-hook 'go-mode-hook 'eglot-ensure)

  ;; Company mode
  (setq company-idle-delay 1)
  (setq company-minimum-prefix-length 1)
  (add-hook 'go-mode-hook 'company-mode)
  
  (setq flycheck-global-modes '(not go-mode))

  ;; Go - lsp-mode
  ;; Set up before-save hooks to format buffer and add/delete imports.
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

  ;; Start LSP Mode
  (add-hook 'go-mode-hook #'lsp-deferred)
  (setq lsp-headerline-breadcrumb-enable nil)

  (require 'lsp-mode)
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "gopls")                                                          
                  :major-modes '(go-mode)
                  :priority 10
                  :server-id 'gopls-remote
                  :remote? t
                  )
   )

  )


(provide 'config-go)
;;; config-go.el ends here
