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

;; Add packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; Set theme and font
 (require 'tomorrow-night-bright-theme)
;; (add-to-list 'default-frame-alist
;;              '(font . "consolas-10:bold"))
