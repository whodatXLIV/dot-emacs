;; LATEX CONFIGURATIONS
;;--------------------------------------------------
(use-package latex-preview-pane
  :ensure t
  :if (eq system-type 'darwin)
  :init (setq pdf-latex-command "xelatex")
  )

(setq TeX-engine 'xetex)
