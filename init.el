
;; ==================================================
;; ADD PACKAGES
;;-------------------------------
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; Install extensions if they're missing
(require 'cl)
(require 'package)
(package-initialize)
;;--------------------------------------------------

(load "~/.emacs.d/initFiles/startup.el")
(load "~/.emacs.d/initFiles/themes.el")
(load "~/.emacs.d/initFiles/git.el")
