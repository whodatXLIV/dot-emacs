;;; config-dumb-jump.el --- should be better at jumping to potential files

;;; Commentary:
;; Use this when eldoc cannot find the file essentially

(require-package 'dumb-jump)

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
;;; Using this, you can now use M-. (or gd when using Evil).

(setq xref-show-definitions-function #'xref-show-definitions-completing-read)

(defhydra dumb-jump-hydra (:color blue :columns 3)
    "Dumb Jump"
    ("j" dumb-jump-go "Jump")
    ("o" dumb-jump-go-other-window "Other window")
    ("e" dumb-jump-go-prefer-external "Go external")
    ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
    ("i" dumb-jump-go-prompt "Prompt")
    ("l" dumb-jump-quick-look "Quick look")
    ("b" dumb-jump-back "Back"))

(global-set-key (kbd "H-h .") 'dumb-jump-hydra/body)

(with-eval-after-load 'dumb-jump
  (add-to-list 'dumb-jump-language-file-exts '(:language "python" :ext "org" :agtype "python" :rgtype "py")) ;; Make it so that dumb-jump finds python defs
  )
;; (setq dumb-jump-language-file-exts '((:language "python" :ext "org" :agtype "python" :rgtype "py")))

;; 
(provide 'config-dumb-jump)

;;; config-dumb-jump.el ends here
