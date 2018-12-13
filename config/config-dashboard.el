;;; package --- dashboard configuration

;;; Commentary:

;;; Code:

(require-package 'dashboard)
(require-package 'page-break-lines)


(global-page-break-lines-mode)


(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))


;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
(setq dashboard-startup-banner 'official)
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png which displays whatever image you would prefer

(setq dashboard-items '((recents  . 15)
                       (projects . 5)
                      ))

(provide 'config-dashboard)
;;; config-dashboard.el ends here
