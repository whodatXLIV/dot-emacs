;;; package --- Python Configuration

;;; Commentary:

;;; Code:
(/boot/lazy-major-mode "\\.py$" python-mode)
(after 'python-mode

  (require-package 'jedi)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:tooltip-method nil)
  (setq jedi:get-in-function-call-delay 1000000)

  (global-set-key [C-tab] 'auto-complete)
  ;; ;; ; don't split windows
  ;; (add-to-list 'ac-sources 'ac-source-jedi-direct)

  (setq py-split-window-on-execute nil)
; try to automagically figure out indentation
  ;; (setq py-smart-indentation t)
  (add-hook 'python-mode-hook
	    (lambda ()
		    (setq-default indent-tabs-mode t)
		    (setq-default tab-width 4)
		    (setq-default py-indent-tabs-mode t)
	    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

  ;;(ein:jupyter-server-start (executable-find "jupyter") (getenv '"HOME"))

  (require-package 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

  (require 'py-yapf)
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save)

  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  ;; Flake8 'python -m pip install flake8' for flycheck
  ;; yapf 'pip -m install yapf' for style with py-yapf
  ;; need to be downloaded seperately and set paths

 )

;;ac-source-jedi-direct

(provide 'config-python)
;;; config-python.el ends here
