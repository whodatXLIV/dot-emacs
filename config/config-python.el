(/boot/lazy-major-mode "\\.py$" python-mode)

(after 'python-mode
 (setq python-shell-interpreter "python.exe")
 ;;(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")

  (after "company-autoloads"
    (require-package 'company-anaconda)
    (require 'company-anaconda)
    (add-hook 'python-mode-hook (lambda ()
				  (set (make-local-variable 'company-backend) '(company-anaconda)))))
  
;; Set up Flycheck
  )

  (provide 'config-python)
