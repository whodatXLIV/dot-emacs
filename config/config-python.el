;;; package --- Python Configuration

;;; Commentary:

;;; Code:
(/boot/lazy-major-mode "\\.py$" python-mode)
(after 'python-mode
 
  (require-package 'jedi)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t) 

  ;; ; don't split windows
  (setq py-split-window-on-execute nil)
; try to automagically figure out indentation
  (setq py-smart-indentation t)
  (ein:jupyter-server-start (executable-find "jupyter") (getenv '"HOME"))
  
  (require-package 'anaconda-mode)
  (require 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

  (require 'py-yapf)
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save)

  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  ;; Flake8 'python -m pip install flake8' for flycheck
  ;; yapf 'pip -m install yapf' for style with py-yapf
  ;; need to be downloaded seperately and set paths

 )  


(provide 'config-python)
;;; config-python.el ends here
