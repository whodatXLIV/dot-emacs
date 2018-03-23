;; init.el -- Emacs configuration entry point.
;;
;; Author: Seth Figueroa <sethamin.7@gmail.com>
;;  Many parts taken from:
;;       https://github.com/bling/dotemacs/
;; This file sets up the load path and calls the package requirements

(eval-when-compile (require 'cl))

;; Initialize time
(lexical-let ((emacs-start-time (current-time)))
  (add-hook 'emacs-startup-hook
            (lambda ()
              (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                (message "[Emacs initialized in %.3fs]" elapsed)))))


(let ((gc-cons-threshold(* 256 1024 1024)) ;; Garbage Collection
      ;; Setting directory locations
      (file-name-handler-alist nil)
      (core-directory(concat user-emacs-directory "core/"))
      (config-directory(concat user-emacs-directory "config/")))
  
  ;; defining a group for custom configuration
  (defgroup dotemacs nil
    :group 'local)

  ;; Storage location for various persistent files
  (defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
    :type 'directory
    :group 'dotemacs)

  ;;The completion engine to use
  (defcustom dotemacs-completion-engine
    'company
    :type '(radio
	    (const :tag "company-mode" company)
	    (const :tag "auto-complete-mode" auto-complete))
    :group 'dotemacs)

  ;; Primary engine for narrowing and navigation
  (defcustom dotemacs-switch-engine
    'ido
    :type '(radio
	    (const :tag "helm" helm)
	    (const :tag "ido" ido)
	    (const :tag "ivy" ivy))
    :group 'dotemacs)

  ;; Primary engine to use auto-pairing and parens matching
  (defcustom dotemacs-pair-engine
    'smartparens
    :type '(radio
	    (const :tag "emacs" emacs)
	    (const :tag "smartparens" smartparens))
    :group 'dotemacs)

  ;; Set where to get packages from
  (setq package-archives '(("melpa" . "http://melpa.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")
                           ("gnu" . "http://elpa.gnu.org/packages/")))
  (setq package-enable-at-startup nil)
  (package-initialize)

  (load (concat core-directory "core-boot"))

  (setq custom-file (concat user-emacs-directory "custom.el"))
  (when(file-exists-p custom-file)
    (load custom-file))

  (cl-loop for file in (reverse(directory-files-recursively config-directory "\\.el$"))
	   do(condition-case ex
		 (load (file-name-sans-extension file))
	       ('error(with-current-buffer "*scratch*"
			(insert(format "[INIT ERROR]\n%s\n%s\n\n" file ex)))))))
	       

;; 
