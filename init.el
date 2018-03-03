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
;; ==================================================

(require 'tomorrow-night-bright-theme)


;; ADD PACKAGES
;;-------------------------------
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; Install extensions if they're missing
(require 'cl)
(require 'package)
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;=======================================



;; OS SPECIFIC SETTINGS
;;--------------------------------------------------
;; Set theme and font based on system
   (cond ((eq system-type 'windows-nt)
	  ;; Windows-specific code goes here.
	  (add-to-list 'default-frame-alist
             '(font . "consolas-10:bold"))
	  
	  (add-to-list 'exec-path "~/.emacs.d/")
	  )
          ((eq system-type 'darwin)
           ;; Linux-specific code goes here.
	   (add-to-list 'default-frame-alist
             '(font . "Courier-14:bold"))
	   (setq python-shell-interpreter "/Library/Frameworks/Python.framework/Versions/3.6/bin/python3
")
	   (when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
	   ))

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
;;==================================================

;; GO CONFIGURATION
;;--------------------------------------------------
;; go get -u golang.org/x/tools/...
;; go get github.com/rogpeppe/godef
;; go get -u github.com/dougm/goflymake
;; go get -u github.com/nsf/gocode
;; http://yousefourabi.com/blog/2014/05/emacs-for-go/

(use-package company-go
  :ensure t)

(use-package go-mode
  :ensure t
  :init (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
  (add-hook 'go-mode-hook '(lambda ()
			     (local-set-key (kbd "C-c C-k") 'godoc)))
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))

(add-to-list 'load-path "~/Go/src/github.com/dougm/goflymake")
(require 'go-flymake)
(require 'go-flycheck)
)

;; GIT CONFIGURATION
;;--------------------------------------------------
(use-package magit
  :ensure t
  :init (global-set-key (kbd "C-x g") 'magit-status)
  (setenv "GIT_ASKPASS" "git-gui--askpass")
  )

;; LATEX CONFIGURATIONS
;;--------------------------------------------------
(use-package latex-preview-pane
  :ensure t
  :if (eq system-type 'darwin)
  :init (setq pdf-latex-command "xelatex")
  )

(setq TeX-engine 'xetex)

;; PYTHON CONFIGURATION
;;-----------------------------------

 (use-package elpy
   :ensure t
   )

(use-package py-autopep8
  :ensure t)

(use-package jedi
  :ensure t )

 (elpy-enable)
 (when (require 'flycheck nil t)
   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
   (add-hook 'elpy-mode-hook 'flycheck-mode))
 (require 'py-autopep8)
 (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
 ;;===================================

;;MARKDOWN MODE CONFIGURATION
;;------------------------------

(use-package flymd
  :ensure t
  :init
  (cond ((eq system-type 'windows-nt)
	  ;; Windows-specific code goes here.
(defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function)
	  )
          ((eq system-type 'darwin)
           ;; Linux-specific code goes here.
  (defun my-flymd-browser-function (url)
    (let ((process-environment (browse-url-process-environment)))
      (apply 'start-process
	     (concat "firefox " url)
	     nil
	     "/usr/bin/open"
	     (list "-a" "firefox" url))))
  (setq flymd-browser-open-function 'my-flymd-browser-function))
	   ))





;; SMARTPARENS CONFIGURATION
;;--------------------------------------------------

(use-package smartparens-config
  :ensure smartparens
  :init (smartparens-global-mode t)
  :bind(:map smartparens-mode-map
	     ("M-<up>" . sp-beginning-of-sexp)
	     ("M-<down>" . sp-end-of-sexp)

	     ;("C-<down>" . sp-down-sexp)
	     ;("C-<up>"   . sp-backward-up-sexp)
	    ; ("M-<down>" . sp-backward-down-sexp)
	    ; ("M-<up>"   . sp-up-sexp)

	     ;("C-M-f" . sp-forward-sexp)
	     ;("C-M-b" . sp-backward-sexp)

	     ;("C-M-n" . sp-next-sexp)
	     ;("C-M-p" . sp-previous-sexp)

	     ("C-<right>" . sp-forward-slurp-sexp)
	     ("M-<right>" . sp-forward-barf-sexp)
	     ("C-<left>"  . sp-backward-slurp-sexp)
	     ("M-<left>"  . sp-backward-barf-sexp)

	     ;("C-M-t" . sp-transpose-sexp)
	     ("C-M-k" . sp-kill-sexp)
	     ("C-k"   . sp-kill-hybrid-sexp)
	     ("M-k"   . sp-backward-kill-sexp)
	     ("C-M-w" . sp-copy-sexp)

	     ("M-s s" . sp-split-sexp)
	     ("M-s j" . sp-join-sexp)

	     ;("C-M-d" . delete-sexp)

	     ;("M-<backspace>" . backward-kill-word)
	     ;("C-<backspace>" . sp-backward-kill-word)
	     ;([remap sp-backward-kill-word] . backward-kill-word)

	     ("M-]" . sp-backward-unwrap-sexp)
	     ("M-[" . sp-unwrap-sexp)
	     ; C-M space highlights words forward then use par to wrap them
	     ("C-x C-t" . sp-transpose-hybrid-sexp)
	     )
  )
;; ===================


;; EXPAND REGIONS CONFIGURATION
;;--------------------------------------------------
(use-package expand-region
  :bind ("C-=" . er/expand-region))
;; ;; ==================================================


;; MULTIPLE CURSORS CONFIGURATION
;;--------------------------------------------------

(use-package multiple-cursors
  :ensure t
  :bind (     ("C-> e" . mc/edit-lines)
	      ("C-> m" . mc/mark-more-like-this-extended)
	      ("C-> a" . mc/mark-all-like-this)
	      ("C-> n" . mc/insert-numbers)
	      ("C-> l" . mc/insert-letters)              
	      )
  )


;;==================================================


;; HTML CONFIGURATION
;;--------------------------------------------------
(use-package emmet-mode
  :ensure t
  :init (
	 dolist(hook '(sgml-mode-hook css-mode-hook))
	  (add-hook hook #'emmet-mode))
  )
;;==================================================


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flymd go-mode emmet-mode use-package smartparens py-autopep8 pdf-tools multiple-cursors magit latex-preview-pane js2-mode jedi golden-ratio flycheck expand-region exec-path-from-shell elpy auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-template-field ((t (:background "blue" :foreground "snow"))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(sp-pair-overlay-face ((t (:foreground "snow")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
