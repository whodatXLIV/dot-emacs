;;; package --- Python Configuration

;;; Commentary:

;;; Code:
(/boot/lazy-major-mode "\\.js$" js2-mode)
(after 'js2-mode
  (add-hook 'js2-mode-hook 'js2-imenu-extras-mode)
  (require-package 'js2-refactor)
  (require-package 'tern)
  
  (add-hook 'js2-mode-hook 'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-m")
  ;; (define-key js2-mode-map (kbd "C-k") 'js2r-kill)
  
  (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
  
  (require-package 'xref-js2)
  (add-hook 'js2-mode-hook (lambda ()
  			     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
  
  (eval-after-load 'tern
   '(progn
      (require-package 'tern-auto-complete)
      (tern-ac-setup)))

  (define-key js2-mode-map (kbd "M-.") nil)
  (add-hook 'tern-mode-hook (lambda ()
			      (define-key tern-mode-keymap (kbd "M-.") nil)
			      (define-key tern-mode-keymap (kbd "M-,") nil)
			      ))

   )



;;ac-source-jedi-direct

(provide 'config-jacascript)
;;; config-javascript.el ends here
