(/boot/lazy-major-mode "\\.go$" go-mode)

(after 'go-mode
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-k") 'godoc)))
  
  (after "company-autoloads"
    (require-package 'company-go)
    (require 'company-go)
    (add-hook 'go-mode-hook (lambda ()
                              (set (make-local-variable 'company-backends) '(company-go)))))
  
  (add-to-list 'load-path "~/Projects/src/github.com/dougm/goflymake")
  (add-hook 'go-mode-hook
          (lambda ()
            (flycheck-mode -1)))
  (require 'go-flymake)
  (require 'go-flycheck)
  
  )


(provide 'config-go)
