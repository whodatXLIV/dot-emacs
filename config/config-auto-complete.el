(when (eq dotemacs-completion-engine 'auto-complete)
  (require-package 'auto-complete)
  (require 'auto-complete)
  (ac-config-default)

  (defun ac-common-setup ()
  (setq ac-sources (append ac-sources '(ac-source-filename))))
  ;; (add-to-list 'ac-sources 'ac-source-filename)

  (setq ac-auto-show-menu .8)
  (setq ac-use-menu-map t)
  (setq ac-auto-start 2)
  (setq ac-comphist-file (concat dotemacs-cache-directory "ac-comphist.dat"))
  (setq ac-quick-help-delay 2)
  (setq ac-quick-help-height 30)
  (setq ac-show-menu-immediately-on-auto-complete nil)
  (global-set-key [C-tab] 'auto-complete)

  (set-face-foreground 'ac-completion-face "goldenrod")
  (set-face-underline 'ac-completion-face "goldenrod")
  ;;(define-key ac-completing-map "\r" nil)

  ;; (dolist (mode '(vimrc-mode html-mode stylus-mode))
  ;;   (add-to-list 'ac-modes mode))
  (after 'linum
    (ac-linum-workaround))

  (after 'yasnippet
    (add-hook 'yas-before-expand-snippet-hook (lambda () (auto-complete-mode -1)))
    (add-hook 'yas-after-exit-snippet-hook (lambda () (auto-complete-mode t)))
    (defadvice ac-expand (before dotemacs activate)
      (when (yas-expand)
        (ac-stop))))

  (require-package 'ac-etags)
  (setq ac-etags-requires 1)
  (after 'etags
    (ac-etags-setup)))

(provide 'config-auto-complete)
