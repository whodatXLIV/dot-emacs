;;; package --- Python Configuration

;;; Commentary:



;; (require-package 'pyenv-mode)
(require-package 'flycheck)

(require-package 'eglot)
(require-package 'flycheck-eglot)
(global-flycheck-eglot-mode 1)

  ;; Company mode
(setq company-idle-delay 1)
(setq company-minimum-prefix-length 1)
(add-hook 'python-mode-hook 'company-mode)

(setq flycheck-global-modes '(not python-mode))
(add-hook 'python-mode-hook #'yas-minor-mode)


(require-package 'yapfify)
(add-hook 'python-mode-hook 'yapf-mode)
(add-hook 'python-mode-hook ;; org mode
            '(lambda ()
               (local-set-key (kbd "H-<left>") 'python-indent-shift-left)
               (local-set-key (kbd "H-<right>") 'python-indent-shift-right)
               ))

;;; Code:

  ;; Flake8 'python -m pip install flake8' for flycheck
  ;; yapf 'pip -m install yapf' for style with py-yapf
  ;; need to be downloaded seperately and set paths



;;ac-source-jedi-direct

(provide 'config-python)
;;; config-python.el ends here
