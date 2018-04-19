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


  (require 'anaconda-mode)
  (require-package 'py-yapf)
  (require 'py-yapf)
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save)

  ;; Flake8 'python -m pip install flake8' for flycheck
  ;; yapf 'pip -m install yapf' for style with py-yapf
  ;; need to be downloaded seperately and set paths
  
  


  )

(provide 'config-python)
;;; config-python.el ends here
