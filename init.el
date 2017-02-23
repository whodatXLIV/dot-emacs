;; no startup msg  

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)        ; Disable startup message

;; Add my .emacs to path as well as all its subfolders
(let ((default-directory  "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))


(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Set theme and font
   (cond ((eq system-type 'windows-nt)
	  ;; Windows-specific code goes here.
	  (add-to-list 'default-frame-alist
             '(font . "consolas-10:bold"))
           )
          ((eq system-type 'darwin)
           ;; Linux-specific code goes here.
	   (add-to-list 'default-frame-alist
             '(font . "Courier-14:bold"))
	   ;;(setenv "PATH" "/Library/Tex/texbin/")
	   (when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
	   ))

(require 'tomorrow-night-bright-theme)
(latex-preview-pane-enable)


;; Install extensions if they're missing
(require 'cl)
(require 'package)
(package-initialize)

(let* ((packages
        '(
          golden-ratio         ; Automatic resizing windows to golden ratio
          latex-preview-pane   ; Preview Pdf 
          jedi                 ; Python auto-completion for Emacs
          js2-mode             ; Improved JavaScript editing mode
          pdf-tools            ; Emacs support library for PDF files
         ))                ; Try out Emacs packages
       ;; Remove all packages already installed
       (packages (remove-if 'package-installed-p packages)))
  (when packages
    (ignore-errors (package-refresh-contents)
                   (mapcar 'package-install packages)
                   )))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(latex-preview-pane-multifile-mode (quote auctex))
 '(package-selected-packages (quote (exec-path-from-shell auctex)))
 '(pdf-latex-command "xelatex"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
