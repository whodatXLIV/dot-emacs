;;; package --- Python Configuration

;;; Commentary:
;; (require-package 'pyenv-mode)
;; (require-package 'flycheck)
;; (require-package 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (add-hook 'python-mode-hook (lambda ()
;;                               (setq anaconda-mode-localhost-address "localhost")
;;                               )
;;           )


;; (setq python-shell-interpreter "python3")
;; (add-hook 'python-mode-hook 'flycheck-mode)
;; (add-hook 'python-mode-hook
;; 	      (lambda ()
;; 		    (setq-default indent-tabs-mode nil)
;; 		    (setq python-indent-offset 4)
;; 		    ;;     (setq-default tab-width 4)
;; 		    ;;     (setq-default py-indent-tabs-mode t)
;; 	        (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


(require-package 'lsp-mode)
(require-package 'lsp-ui)
;; (require-package 'lsp-pyright)

Start LSP Mode
(add-hook 'python-mode-hook #'lsp-deferred)
(setq lsp-headerline-breadcrumb-enable nil)

(use-package lsp-mode
  :hook
  ((python-mode . lsp)))

(require 'lsp-mode)
(lsp-register-client
 (make-lsp-client :new-connection (lsp-tramp-connection "pylsp")                                                          
                  :major-modes '(python-mode)
                  :priority 10
                  :server-id 'pylsp-remote
                  :remote? t
                  )
 )

(require-package 'yapfify)
(add-hook 'python-mode-hook 'yapf-mode)
;;; Code:
(/boot/lazy-major-mode "\\.py$" python-mode)
(after 'python-mode
  ;; (require-package 'jedi)
  ;; (add-hook 'python-mode-hook 'jedi:setup)
  ;; (setq jedi:complete-on-dot t)
  ;; (setq jedi:tooltip-method nil)
  ;; (setq jedi:get-in-function-call-delay 1000000)


  ;; (global-set-key [C-tab] 'auto-complete)
  ;; (add-hook 'python-mode-hook
  ;;           (lambda ()
  ;;             (local-set-key (kbd "C-c C-c") 'python-shell-send-buffer)))
  ;; (add-hook 'python-mode-hook
  ;;           (lambda ()
  ;;             (local-set-key (kbd "C-c p") 'run-python)))

  ;; (add-hook 'python-mode-hook
  ;;           (lambda ()
  ;;             (local-set-key [C-tab] 'anaconda-mode-complete)))

  ;; ;; ; don't split windows
  ;; (add-to-list 'ac-sources 'ac-source-jedi-direct)

  ;; (setq py-split-window-on-execute nil)
; try to automagically figure out indentation
  ;; (setq py-smart-indentation t)
  ;;(ein:jupyter-server-start (executable-find "jupyter") (getenv '"HOME"))

  ;; (require 'py-yapf)
  ;; (add-hook 'python-mode-hook 'py-yapf-enable-on-save)

  

  


  ;; Flake8 'python -m pip install flake8' for flycheck
  ;; yapf 'pip -m install yapf' for style with py-yapf
  ;; need to be downloaded seperately and set paths

 )

;;ac-source-jedi-direct

(provide 'config-python)
;;; config-python.el ends here
