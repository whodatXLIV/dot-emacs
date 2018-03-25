;; GO CONFIGURATION
;;--------------------------------------------------
;; go get -u golang.org/x/tools/...
;; go get github.com/rogpeppe/godef
;; go get -u github.com/dougm/goflymake
;; go get -u github.com/nsf/gocode
;; http://yousefourabi.com/blog/2014/05/emacs-for-go/

(use-package company-go
  :ensure t)

(use-package go-mode
  :ensure t
  :init (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-k") 'godoc)))
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))

(add-to-list 'load-path "~/Go/src/github.com/dougm/goflymake")
(require 'go-flymake)
(require 'go-flycheck)
)
