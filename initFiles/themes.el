(require 'tomorrow-night-bright-theme)

;; OS SPECIFIC SETTINGS
;;--------------------------------------------------
;; Set theme and font based on system
   (cond ((eq system-type 'windows-nt)
	  ;; Windows-specific code goes here.
	  (add-to-list 'default-frame-alist
             '(font . "consolas-10:bold"))
	  
	  (add-to-list 'exec-path "~/.emacs.d/")
	  )
          ((eq system-type 'darwin)
           ;; Linux-specific code goes here.
	   (add-to-list 'default-frame-alist
             '(font . "Courier-14:bold"))
	   (setq python-shell-interpreter "/Library/Frameworks/Python.framework/Versions/3.6/bin/python3
")
	   (when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
	   ))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flymd go-mode emmet-mode use-package smartparens py-autopep8 pdf-tools multiple-cursors magit latex-preview-pane js2-mode jedi golden-ratio flycheck expand-region exec-path-from-shell elpy auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-template-field ((t (:background "blue" :foreground "snow"))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(sp-pair-overlay-face ((t (:foreground "snow")))))
