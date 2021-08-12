;;; package --- sane-term configuration

;;; Commentary:

;;; Code:

(require-package 'multi-term)
(global-set-key (kbd "C-x t") 'multi-term)

;; (defvar f-key-defs
;;   (let ((fkeys nil))
;;     (dotimes (i 12)
;;       (push (cons (intern (concat "f" (int-to-string (1+ i))))
;;                   (format "\e[%d~" (+ i (if (> i 4) 12 11))))
;;             fkeys))
;;     fkeys))

;; (defun send-f-key ()
;;   "Send an f-key escape sequence to the sub-process."
;;   (interactive)
;;   (term-send-raw-string (alist-get last-input-event f-key-defs)))

;; (dotimes (i 12)
;;   (define-key term-raw-map
;;     (vector (intern (concat "f" (int-to-string (1+ i))))
;;     #'send-f-key)))



(provide 'config-multi-term)

;;; config-multi-term.el ends here
