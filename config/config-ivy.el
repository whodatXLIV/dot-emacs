(require-package 'ivy)
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq ivy-virtual-abbreviate 'full)
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
(setq ivy-height 12)
(setq ivy-display-style 'fancy)
(setq ivy-count-format "[%d/%d] ")
(setq ivy-initial-inputs-alist nil)


;;(require-package 'swiper)
;;(after 'swiper
;;  (defadvice swiper (before dotemacs activate)
;;    (setq gc-cons-threshold most-positive-fixnum))
;;  (defadvice swiper-all (before dotemacs activate)
;;    (setq gc-cons-threshold most-positive-fixnum)))
;;
;;
;;(require-package 'counsel)
;;
;;
;;(after "projectile-autoloads"
;;  (require-package 'counsel-projectile))
;;

(provide 'config-ivy)
