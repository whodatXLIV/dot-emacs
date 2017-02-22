;; no startup msg  
(setq inhibit-startup-message t)        ; Disable startup message

;; Add my .emacs to path as well as all its subfolders
(let ((default-directory  "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Set theme and font
(require 'tomorrow-night-bright-theme)
(add-to-list 'default-frame-alist
             '(font . "consolas-10:bold"))
