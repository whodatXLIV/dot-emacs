(require-package 'ivy)
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq ivy-virtual-abbreviate 'full)
(setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
(setq ivy-height 12)
(setq ivy-display-style 'fancy)
(setq ivy-count-format "[%d/%d] ")
(setq ivy-initial-inputs-alist nil)
(setq ivy-use-selectable-prompt t)
(setq ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-create)


(require-package 'swiper)
(global-set-key "\C-s" 'swiper)
(after 'swiper
  (defadvice swiper (before dotemacs activate)
    (setq gc-cons-threshold most-positive-fixnum))
  (defadvice swiper-all (before dotemacs activate)
    (setq gc-cons-threshold most-positive-fixnum)))

(require-package 'counsel)
(require-package 'ivy-hydra)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "C-c f") 'counsel-describe-function)
;;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "C-c u") 'counsel-unicode-char)
;;
;;(after "projectile-autoloads"
;;  (require-package 'counsel-projectile))


(provide 'config-ivy)
