;; GENERAL START UP SETTINGS 
;;--------------------------------------------------
(setq inhibit-startup-message t)        ; Disable startup message
(global-linum-mode t) ;; enable line numbers globally
(show-paren-mode 1)
;; Add my .emacs to path as well as all its subfolders
(let ((default-directory  "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)



;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;==================================================
(getenv "PATH")

;; CONFIGURATIONS

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; FLYCHECK CONFIGURATIONS
(use-package flycheck
  :ensure t
  )

;; EXPAND REGIONS CONFIGURATION
;;--------------------------------------------------
(use-package expand-region
  :bind ("C-=" . er/expand-region))
