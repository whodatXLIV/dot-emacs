 ;;; Commentary:
;;init.el -- Emacs configuration entry point.
;;
;; Author: Seth Figueroa <sethamin.7@gmail.com>
;;  Many parts taken from:
;;       https://github.com/bling/dotemacs/
;; This file sets up the load path and calls the package requirements

;;==================================================
;;  GENERAL START UP
;;==================================================
;;; Code:
(load "/opt/homebrew/opt/scimax/share/emacs/site-lisp/scimax/init.el")
(setq inhibit-startup-message t)        ; Disable startup message
(global-display-line-numbers-mode t)

(show-paren-mode 1)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(global-set-key (kbd "C-c M-l") 'scroll-lock-mode)


;; (setq vterm-tramp-shells '(("/bin/zsh")))
;; (setq tramp-default-remote-shell "/bin/zsh") 
(with-eval-after-load "tramp" (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

;; '(tramp-connection-properties
;;    '(("/sshfs:" "direct-async-process" t)
;;      ((regexp-quote "/ssh:") "remote-shell" "/bin/zsh")))

(setq shell-file-name "/bin/zsh")
(setq vterm-shell "/bin/zsh")
;; /ceph/var/users/sfigueroa/gopath/bin/gopls

;; M-x tramp-cleanup-this-connection

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(when (member "Hack" (font-family-list)) (set-frame-font "Hack-12" t t))

(setq mark-ring-max 2)
(setq global-mark-ring-max 2)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; Garbage collect

(defun my-minibuffer-setup-hook ()
  "Set high gc when minibuffer is open."
  (setq gc-cons-threshold (* 256 1024 1024)))

(defun my-minibuffer-exit-hook ()
  "Set low GC when minibuffer exits."
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook 'my-minibuffer-exit-hook)

(defun connect-focusvq-home ()
  (interactive)
  (dired "/scp:sfigueroa@dev.focusvq.com:"))

(defun connect-focusvq-ceph ()
  (interactive)
  (dired "/scp:sfigueroa@dev.focusvq.com:/ceph/var/users/sfigueroa"))

(defun connect-focusvq-elcano ()
  (interactive)
  (dired "/scp:sfigueroa@dev.focusvq.com:/ceph/var/elcano"))

;;; Global keybindings
;; (global-set-key (kbd "C-x M-s") 'speedbar)
(global-set-key (kbd "C-x M-r") 'revert-buffer)
(global-set-key (kbd "C-x M-h") 'connect-focusvq-home)
(global-set-key (kbd "C-x M-c") 'connect-focusvq-ceph)
(global-set-key (kbd "C-x M-e") 'connect-focusvq-elcano)

(setq sql-connection-alist
      '(
        (mysql-fds (sql-product 'mysql)
                    (sql-port 0)
                    (sql-server "db.internal.focusvq.com")
                    (sql-user "fds")
                    (sql-password "WnJSuqmND9i0ePYw")
                    (sql-database "fds"))

        (mysql-elcano (sql-product 'mysql)
                    (sql-port 0)
                    (sql-server "db.internal.focusvq.com")
                    (sql-user "fds")
                    (sql-password "WnJSuqmND9i0ePYw")
                    (sql-database "elcano"))
        )
      )

;; ;;==================================================

;; # Must manually install cl
(eval-when-compile (require 'cl))

(lexical-let ((emacs-start-time (current-time)))
  (add-hook 'emacs-startup-hook
            (lambda ()
              (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                (message "[Emacs initialized in %.3fs]" elapsed)))))

(let ((gc-cons-threshold (* 2 1024 1024 1024))
      (file-name-handler-alist nil)
      (core-directory (concat user-emacs-directory "core/"))
      (config-directory (concat user-emacs-directory "config/"))
      (themes-directory (concat user-emacs-directory "themes/")))

  (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (unless (display-graphic-p) (menu-bar-mode -1))

  (defgroup dotemacs nil
    "Custom configuration for dotemacs."
    :group 'local)

  (defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
    "The storage location for various persistent files."
    :type 'directory
    :group 'dotemacs)

  (defcustom dotemacs-completion-engine
    'auto-complete
    "The completion engine the use."
    :type '(radio
            (const :tag "company-mode" company)
            (const :tag "auto-complete-mode" auto-complete))
    :group 'dotemacs)

  (defcustom dotemacs-switch-engine
    'ivy
    "The primary engine to use for narrowing and navigation."
    :type '(radio
            (const :tag "helm" helm)
            (const :tag "ido" ido)
            (const :tag "ivy" ivy))
    :group 'dotemacs)

  (defcustom dotemacs-pair-engine
    'smartparens
    "The primary engine to use auto-pairing and parens matching."
    :type '(radio
            (const :tag "emacs" emacs)
            (const :tag "smartparens" smartparens))
    :group 'dotemacs)

  (setq package-archives '(("melpa" . "http://melpa.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")
                           ("gnu" . "http://elpa.gnu.org/packages/")))
  (setq package-enable-at-startup nil)
  ;; (package-initialize)

  (load (concat core-directory "core-boot"))

  (setq themes-file (concat themes-directory "themes.el"))
  (when (file-exists-p themes-file)
    (add-to-list 'load-path themes-directory)
    (load themes-file))


  (require-package 'exec-path-from-shell)
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)
    (setq mac-option-key-is-meta nil
          mac-command-key-is-meta t
          mac-command-modifier 'meta
          mac-option-modifier 'super
          ns-function-modifier 'hyper
          )
    )

  (require-package 'use-package)


  ;; (use-package flycheck
  ;; :ensure t
  ;; :init (global-flycheck-mode))

  (cl-loop for file in (reverse (directory-files-recursively config-directory "\\.el$"))
           do (condition-case ex
                  (load (file-name-sans-extension file))
                ('error (with-current-buffer "*scratch*"
                          (insert (format "[INIT ERROR]\n%s\n%s\n\n" file ex))))))

  (add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))
  )

;; (custom-set-variables
;;  '(conda-anaconda-home "/ssh:sfigueroa@dev.focusvq.com:/ceph/var2/users/sfigueroa/miniconda"))

;; (pdf-tools-install)
;; (pdf-loader-install) ;; Provides better start up time

;; highlight line with the cursor, preserving the colours.
(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :inherit nil :background "gray6")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:inherit default))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-done ((t (:foreground "lime green" :background "gray10" :box (:color "forest green" :line-width 2 :style none) :height 1))))
 '(org-level-1 ((t (:font "American Typewriter" :weight regular :background "gray15" :foreground "#70c0b1" :height 1.5))))
 '(org-level-2 ((t (:font "Courier New" :weight regular :underline t :foreground "salmon" :height 1.3))))
 '(org-level-3 ((t (:font "Verdana" :weight regular :foreground "SkyBlue" :height 1.2))))
 '(org-level-4 ((t (:font "Verdana" :weight regular :foreground "SlateBlue3" :height 1.1))))
 '(org-level-5 ((t (:font "Verdana" :weight regular :foreground "orange3"))))
 '(org-level-6 ((t (:font "Verdana" :weight regular :foreground "DarkOliveGreen"))))
 '(org-level-7 ((t (:font "Verdana" :weight regular :foreground "gray60"))))
 '(org-level-8 ((t (:font "Verdana" :weight regular :foreground "gray50"))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-todo ((t (:foreground "OrangeRed" :background "gray10" :box (:color "firebrick" :line-width 2 :style none) :height 1))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(jupyter ein edbi ejc-sql pulsar flycheck-eglot eglot pylint lsp-jedi posframe json-rpc-server json-rpc pyvenv flycheck skewer-mode ace-mc ac-etags page-break-lines dashboard drag-stuff counsel swiper magit projectile smartparens tabbar zoom yapfify yaml-mode xref-js2 undo-tree tramp-term tramp tern-auto-complete speed-type sane-term python-mode pyenv-mode py-yapf multi-term minimap markdown-preview-mode lua-mode lsp-ui js2-refactor ivy-hydra image+ go-mode exec-path-from-shell csv-mode conda company clipboard-collector base16-theme auctex anaconda-mode ace-window))
 '(zoom-mode t nil (zoom))
 '(zoom-size '(0.618 . 0.618)))
