;;; package --- Python Configuration

;;; Commentary:



;; (require-package 'pyenv-mode)
(require-package 'flycheck)
;; (require-package 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (add-hook 'python-mode-hook (lambda ()
;;                               (setq anaconda-mode-localhost-address "localhost")
;;                               )
;;           )


;; ;; (setq python-shell-interpreter "python3")
;; (add-hook 'python-mode-hook 'flycheck-mode)
;; (add-hook 'python-mode-hook
;; 	      (lambda ()
;; 		    (setq-default indent-tabs-mode nil)
;; 		    (setq python-indent-offset 4)
;; 		    ;;     (setq-default tab-width 4)
;; 		    ;;     (setq-default py-indent-tabs-mode t)
;; 	        (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(require-package 'eglot)
(require-package 'flycheck-eglot)
(global-flycheck-eglot-mode 1)

;; ########
;; (require-package 'lsp-mode)
;; (require-package 'lsp-ui)
;; (require-package 'lsp-jedi)

;; Start LSP Mode
;; (add-hook 'python-mode-hook #'lsp-deferred)
;; (setq lsp-headerline-breadcrumb-enable nil)


;; (use-package lsp-jedi
;;   :ensure t
;;   ;; :config
;;   ;; (with-eval-after-load "lsp-mode"
;;   ;;   (add-to-list 'lsp-disabled-clients 'pyls)
;;   ;;   (add-to-list 'lsp-disabled-clients 'pylsp)
;;   ;;   (add-to-list 'lsp-enabled-clients 'jedi)
;;   ;;   (add-to-list 'lsp-enabled-clients 'jedi-remote)
;;   ;;   )
;;   )

;; (lsp-register-client
;;  (make-lsp-client :new-connection (lsp-tramp-connection "jedi-language-server")
;;                   :major-modes '(python-mode)
;;                   :priority 10
;;                   :server-id 'jedi-remote
;;                   :remote? t
;;                   )
;;  )


;; (add-to-list 'lsp-enabled-clients 'jedi)
;; (add-to-list 'lsp-enabled-clients 'jedi-remote)

;; ########

  ;; Company mode
(setq company-idle-delay 1)
(setq company-minimum-prefix-length 1)
(add-hook 'python-mode-hook 'company-mode)

(setq flycheck-global-modes '(not python-mode))
(add-hook 'python-mode-hook #'yas-minor-mode)


(require-package 'yapfify)
(add-hook 'python-mode-hook 'yapf-mode)
;;; Code:







  ;; Flake8 'python -m pip install flake8' for flycheck
  ;; yapf 'pip -m install yapf' for style with py-yapf
  ;; need to be downloaded seperately and set paths



;;ac-source-jedi-direct

(provide 'config-python)
;;; config-python.el ends here
