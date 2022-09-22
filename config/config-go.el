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
  ;; (add-hook 'go-mode-hook 'eglot-ensure)
  ;; (defun project-find-go-module (dir)
  ;;   (when-let ((root (locate-dominating-file dir "go.mod")))
  ;;     (cons 'go-module root)))

  ;; (cl-defmethod project-root ((project (head go-module)))
  ;;   (cdr project))

  ;; (add-hook 'project-find-functions #'project-find-go-module)

  ;; (defun eglot-format-buffer-on-save ()
  ;;   (add-hook 'before-save-hook #'eglot-format-buffer -10 t))
  ;; (add-hook 'go-mode-hook #'eglot-format-buffer-on-save)

  
  ;; Company mode
  (setq company-idle-delay 1)
  (setq company-minimum-prefix-length 1)
  (add-hook 'go-mode-hook 'company-mode)
  
  ;; (setq flycheck-global-modes '(not go-mode))

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
                    :priority -1
                    :remote? t
                    )
   )


  ;; (add-hook 'go-mode-hook #'yas-minor-mode)



  
  ;; (setq gofmt-command "goimports")
  ;; (add-hook 'before-save-hook 'gofmt-before-save)
  ;; (add-hook 'go-mode-hook '(lambda ()
  ;;   		     (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
  ;; (add-hook 'go-mode-hook '(lambda ()
  ;;   		     (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
  ;; (add-hook 'go-mode-hook '(lambda ()
  ;;   		     (local-set-key (kbd "C-c C-k") 'godoc)))
  
  ;; ;; (after "company-autoloads"
  ;; ;;   (require-package 'company-go)
  ;; ;;   (require 'company-go)
  ;; ;;   (add-hook 'go-mode-hook (lambda ()
  ;; ;;                             (set (make-local-variable 'company-backends) '(company-go)))))

  ;; (after "auto-complete-autoloads"
  ;;   (require-package 'go-autocomplete)
  ;;   (require 'go-autocomplete)
  ;;   (defun auto-complete-for-go ()
  ;;     (auto-complete-mode 1))
  ;;   (add-hook 'go-mode-hook 'auto-complete-for-go)
  ;;   )

  ;; (require-package 'go-eldoc)
  ;; (require 'go-eldoc)
  ;;   (add-hook 'go-mode-hook 'go-eldoc-setup)
  
  ;; (require-package 'go-playground)
  ;; (add-to-list 'load-path "~/Projects/src/github.com/dougm/goflymake")
  ;; (add-to-list 'load-path "~/Projects/src/github.com/cweill/gotests")
  
  ;; (add-hook 'go-mode-hook
  ;;         (lambda ()
  ;;           (flycheck-mode -1)))
  ;; (require 'go-flymake)
  ;; (require 'go-flycheck)
  ;; (require 'gotests)
  ;; (require-package 'go-dlv)
  )


(provide 'config-go)
;;; config-go.el ends here
