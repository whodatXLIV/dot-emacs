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
(setq inhibit-startup-message t)        ; Disable startup message
(global-linum-mode t) ;; enable line numbers globally
(show-paren-mode 1)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

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

;;==================================================

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
  (package-initialize)

  (load (concat core-directory "core-boot"))

  (setq themes-file (concat themes-directory "themes.el"))
  (when (file-exists-p themes-file)
    (add-to-list 'load-path themes-directory)
    (load themes-file))

  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)
    (setenv "GOPATH" "/Users/sethfigueroa/Projects")
)


  (use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

  (cl-loop for file in (reverse (directory-files-recursively config-directory "\\.el$"))
           do (condition-case ex
                  (load (file-name-sans-extension file))
                ('error (with-current-buffer "*scratch*"
                          (insert (format "[INIT ERROR]\n%s\n%s\n\n" file ex))))))

  (add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))
  )

;; (pdf-tools-install)
(pdf-loader-install) ;; Provides better start up time

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Documents/todo.org" "~/Documents/Extend_Target/Extend_Target.org")))
 '(package-selected-packages
   (quote
    (yapfify sane-term anaconda-mode tramp xref-js2 tern-auto-complete tern pyenv-mode json-navigator csv-mode image+ org-bullets pdf-view go-eldoc go-autocomplete latex-mode LaTeX-mode go-dlv go-playground minimap ace-window py-yapf flake8 company-jedi pylint company-anaconda undo-tree go-flymake org-mode py-autopep8 latex-preview-pane jedi golden-ratio flymd flycheck-pos-tip emmet-mode elpy diminish company-go auctex)))
 '(zoom-mode t nil (zoom))
 '(zoom-size (quote (0.618 . 0.618))))

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
