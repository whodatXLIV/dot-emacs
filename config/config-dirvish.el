;;; config-dirvish.el --- a prettier dired

;;; Commentary:
;; This package adds functionality and prettyness to dired


(require-package 'all-the-icons)

;; (all-the-icons-install-fonts)
(require-package 'dired-subtree)
(define-key dired-mode-map (kbd "H-i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "H-r") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "H-c") 'dired-subtree-cycle)
(define-key dired-mode-map (kbd "H-p") 'dired-subtree-up)
(define-key dired-mode-map (kbd "H-n") 'dired-subtree-down)
(define-key dired-mode-map (kbd "H-<up>") 'dired-subtree-beginning)
(define-key dired-mode-map (kbd "H-<down>") 'dired-subtree-end)
(define-key dired-mode-map (kbd "H-m") 'dired-subtree-mark-subtree)
(define-key dired-mode-map (kbd "H-u") 'dired-subtree-unmark-subtree)

(require-package 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(require-package 'dired-filter)
(add-hook 'dired-mode-hook 'dired-filter-mode)
(setq dired-listing-switches "-alogh")

(defun seth/dired-side--vc (directory)
  "Open the root directory of the current version-controlled repository or th present working directory with `dired' and bespoke window parameters."
  (let* (
         (backend (vc-responsible-backend directory t))
         (dir (if (eq backend nil)
                  directory
                (expand-file-name (vc-call-backend backend 'root directory))))
         (dired_dir (dired-noselect dir))
         (path-list (split-string (first (last (split-string directory dir))) "/"))
         )
    (display-buffer-in-side-window
     dired_dir `((side . left)
           (slot . 0)
           (window-width . 0.3)
           (window-parameters) . ((no-other-window . t)
                                  (no-delete-other-windows . t)
                                  (mode-line-format . (" " "%b"))
                                  )
           )
     )
    (with-current-buffer dired_dir
      (setq window-size-fixed 'width)
      (switch-to-buffer-other-frame dired_dir)
      (revert-buffer)
      (dired-hide-details-mode)
      (goto-char 0)
      (cl-loop for p in path-list do
               (goto-char (search-forward p))
               (dired-subtree-insert)
               )
      )
    )
  )

(defun seth/dired-side-vc (&optional initial-input)
  "Open the root directory of the current version-controlled repository or th present working directory with `dired' and bespoke window parameters."
  (interactive) 
     
  (ivy-read "Dired: " #'read-file-name-internal
              :matcher #'counsel--find-file-matcher
              :initial-input initial-input
              :action (lambda (d) (seth/dired-side--vc (expand-file-name d)))
              :preselect (counsel--preselect-file)
              :require-match 'confirm-after-completion
              :history 'file-name-history
              :keymap counsel-find-file-map
              :caller 'counsel-dired)
  )

(global-set-key (kbd "C-x d") 'seth/dired-side-vc)

(provide 'config-dirvish)

;;; config-dirvish.el ends here

(setq file (expand-file-name "~/Documents/focusvq/elcano/projects/goalsets/"))
(setq dir (expand-file-name (vc-call-backend (vc-responsible-backend file t) 'root file)))
