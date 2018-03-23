(/boot/lazy-major-mode "\\.go$" go-mode)

(after 'go-mode
  (after "company-autoloads"
    (require-package 'company-go)
    (require 'company-go)
    (add-hook 'go-mode-hook (lambda ()
                              (set (make-local-variable 'company-backends) '(company-go))))))

(provide 'config-go)
