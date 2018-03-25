;; PYTHON CONFIGURATION
;;-----------------------------------

 (use-package elpy
   :ensure t
   )

(use-package py-autopep8
  :ensure t)

(use-package jedi
  :ensure t )

 (elpy-enable)
 (when (require 'flycheck nil t)
   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
   (add-hook 'elpy-mode-hook 'flycheck-mode))
 (require 'py-autopep8)
 (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
