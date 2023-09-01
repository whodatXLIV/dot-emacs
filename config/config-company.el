(when (eq dotemacs-completion-engine 'company)

  (defgroup dotemacs-company nil
    "Configuration options for company-mode."
    :group 'dotemacs
    :prefix 'dotemacs-company)

  (require-package 'company)

  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)

  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case t)

  (setq company-dabbrev-code-ignore-case t)
  (setq company-dabbrev-code-everywhere t)

  (setq company-etags-ignore-case t)
  
  ;; (when (executable-find "tern")
  ;;   (after "company-tern-autoloads"
  ;;     (add-to-list 'company-backends 'company-tern)))

  ;; (setq company-global-modes
  ;;       '(not
  ;;         eshell-mode comint-mode text-mode erc-mode))
  

  (global-company-mode)
  ;; (global-set-key (kbd "H-<tab>") #'company-complete)
  (global-set-key (kbd "C-<tab>") #'company-other-backend)


   (face-attribute 'company-tooltip :background)
    (set-face-attribute 'company-tooltip nil :background "black" :foreground "gray40")
    (set-face-attribute 'company-tooltip-selection nil :inherit 'company-tooltip :background "gray15")
    (set-face-attribute 'company-preview nil :background "black")
    (set-face-attribute 'company-preview-common nil :inherit 'company-preview :foreground "gray40")
    (set-face-attribute 'company-scrollbar-bg nil :inherit 'company-tooltip :background "gray20")
    (set-face-attribute 'company-scrollbar-fg nil :background "gray40")
    )
  

(provide 'config-company)
