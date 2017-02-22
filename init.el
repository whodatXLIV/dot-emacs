;; no startup msg  
(setq inhibit-startup-message t)        ; Disable startup message

;; Add my .emacs to path as well as all its subfolders
(let ((default-directory  "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Set theme and font
(require 'tomorrow-night-bright-theme)
(add-to-list 'default-frame-alist
             '(font . "consolas-10:bold"))
