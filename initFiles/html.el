;; HTML CONFIGURATION
;;--------------------------------------------------
(use-package emmet-mode
  :ensure t
  :init (
	 dolist(hook '(sgml-mode-hook css-mode-hook))
	  (add-hook hook #'emmet-mode))
  )
