;;; package --- Pulsar configuration

;;; Commentary:

;;; Code:

(require-package 'pulsar)



;; Check the default value of `pulsar-pulse-functions'.  That is where
;; you add more commands that should cause a pulse after they are
;; invoked

;; (setq pulsar-pulse t)
(setq pulsar-delay 0.07)
(setq pulsar-iterations 10)
(setq pulsar-face 'pulsar-magenta)
(setq pulsar-highlight-face 'pulsar-cyan)

(pulsar-global-mode 1)

(let ((map global-map))
  (define-key map (kbd "C-c p p") #'pulsar-pulse-line)
  (define-key map (kbd "C-c p h") #'pulsar-highlight-dwim))

;; (add-hook ' #'pulsar-recenter-top)
;; (add-hook 'imenu-after-jump-hook #'pulsar-reveal-entry)

(provide 'config-pulsar)
;;; config-pulsar.el ends here

