;;; package --- Python Configuration

;;; Commentary:

;;; Code:
(/boot/lazy-major-mode "\\.py$" python-mode)

(after 'python-mode

  (setq-default py-shell-name "ipython"
		py-ipython-command-args "--simple-prompt -i")
  
  (setq-default py-which-bufname "IPython")

  (after "company-autoloads"
    (require-package 'company-anaconda)
    (require 'company-anaconda)
    (add-hook 'python-mode-hook (lambda ()
				  (set (make-local-variable 'company-backend) '(company-anaconda)))))
  (require-package 'pylint)
  (require 'pylint)


  )

(provide 'config-python)
;;; config-python.el ends here
