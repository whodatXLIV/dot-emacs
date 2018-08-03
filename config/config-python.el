;;; package --- Python Configuration

;;; Commentary:

;;; Code:
(/boot/lazy-major-mode "\\.py$" python-mode)

(after 'python-mode

  ;; (setq-default py-shell-name "ipython"
  ;; 		py-ipython-command-args "--simple-prompt -i")
  
  ;; (setq-default py-which-bufname "IPython")

; don't split windows
  (setq py-split-window-on-execute nil)
; try to automagically figure out indentation
  (setq py-smart-indentation t)
  (ein:jupyter-server-start (executable-find "jupyter") (getenv '"HOME"))
  (after "company-autoloads"
;    (add-to-list 'company-backends 'company-anaconda)
    (add-to-list 'company-backends 'company-anaconda))


  (require 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  
  (require-package 'py-yapf)
  (require 'py-yapf)
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save)

  ;; Flake8 'python -m pip install flake8' for flycheck
  ;; yapf 'pip -m install yapf' for style with py-yapf
  ;; need to be downloaded seperately and set paths
  
  


  )

(provide 'config-python)
;;; config-python.el ends here
